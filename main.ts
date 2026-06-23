enum BridgeSide {
    //% block="left"
    Left,
    //% block="right"
    Right
}

enum BasculeDirection {
    //% block="raise"
    Raise,
    //% block="lower"
    Lower
}

enum BreakbeamSide {
    //% block="west"
    West,
    //% block="east"
    East
}

enum ShipTransitDirection {
    //% block="upriver"
    Upriver,
    //% block="downriver"
    Downriver
}

enum ColorSensorColor {
    //% block="red"
    Red = 0xFF0000,
    //% block="green"
    Green = 0x00FF00,
    //% block="blue"
    Blue = 0x0000FF,
} //TODO idk there's probably more colors or something

let basculeLowerLimit = -15
let basculeUpperLimit = 65

let basculeLowerThresh = 0
let basculeUpperThresh = basculeUpperLimit - 5

//pindefs.h memorial let statements
let PWR_IMON_PIN = AnalogPin.P0
let NORTH_IMON_PIN = AnalogPin.P1
let SOUTH_IMON_PIN = AnalogPin.P2
let SENSE2_PIN = AnalogPin.P3 //east breakbeam
let SENSE1_PIN = AnalogPin.P4 //west breakbeam
let N_BASC_LED_PIN = DigitalPin.P6
let N_TOWER_LED_PIN = DigitalPin.P7
let SIN2 = DigitalPin.P8
let SIN1 = DigitalPin.P9
let LOWTRIP_PIN = DigitalPin.P10
let S_BASC_LED_PIN = DigitalPin.P12
let S_TOWER_LED_PIN = DigitalPin.P13
let NIN2 = DigitalPin.P14
let LED_TX_PIN = DigitalPin.P15 //CTX/COPI pin of the SPI peripheral
let NIN1 = DigitalPin.P16
//I2C pins left unassigned because they are configured by the I2C peripheral

let EAST_BREAKBEAM_PIN = SENSE2_PIN
let WEST_BREAKBEAM_PIN = SENSE1_PIN

let muxI2CAddr: uint8 = 0x70
let encoderI2CAddr: uint8 = 0x36
let colorI2CAddr: uint8 = 0x44 //0x52

let northEncoderChannel = 0
let southEncoderChannel = 1

function swapBytes(value: NumberFormat.UInt16LE) {
    return ((value & 0xFF00) >> 8) | ((value & 0x00FF) << 8)
}

function setEncoderChannel(channel: number) { //this also implicitly enables the color sensor channel, since there's no address conflict so that should always be enabled
    pins.i2cWriteNumber(muxI2CAddr, channel == 0 ? 0b0101 : 0b0110, NumberFormat.UInt8LE, false)
}

//configures I2C mux for correct encoder channel, then polls that encoder
function pollEncoderRawAngle(channel: number) {
    setEncoderChannel(channel)
    pins.i2cWriteNumber(encoderI2CAddr, 0x0C, NumberFormat.UInt8LE, true)
    let rawAngle = pins.i2cReadNumber(encoderI2CAddr, NumberFormat.UInt16LE, false)
    rawAngle = ((rawAngle & 0xFF00) >> 8) | ((rawAngle & 0x000F) << 8)
    return (rawAngle / 4096.0) * 360.0
}

//returns the current drawn from the polled motor in milliamps
function pollMotorMilliamps(pin: number) {
    return pins.analogReadPin(pin) * (3.3 / 1024.0) * (700.0 / 2.5) //10bit ADC, 700mA/2.5V VREF
}

let northBascAngle = 0
let southBascAngle = 0
let northMotorMilliamps = 0
let southMotorMilliamps = 0

let northMotorSpeed = 0
let southMotorSpeed = 0

let shipTransittingBridge = false
let lastShipTransitDirection = ShipTransitDirection.Upriver
let prevEastBreakbeamState = false
let prevWestBreakbeamState = false

let buttonAStillBound = false
let prevButtonAState = false
input.onButtonPressed(Button.A, function () {
    buttonAStillBound = true
    //this will bind this code to button A being pressed, but then user code can easily override this binding
    //TODO
    //I need to figure out exactly how the default behavior will work
    //could do something where we use this event to "sense" if it's still bound when the button is first pressed
    //and then in the main polling loop can just move if buttons are still unbound
    //yeahhhh
    //this will set a flag that will get set back to false on falling edge of the button in the polling loop
    //and then if that flag isn't set manual mode doesn't work
})

//main monitoring loop
basic.forever(function () {
    //code in here will run within the fibre scheduler, scheduled cooperatively, with a 6ms polling time
    /*
    TODO:
     ~~poll encoders~~
     ~~poll motor current sense~~
     ~~turn off motors if encoders over limit in either direction~~
     ~~set LEDs if encoders over limit in either direction~~
     maybe write hiccup timer code for if lowtrip isn't enabled and current is over limit (not sure exactly what the best logic for this would be, will probably write this once we have final model assembled)
     */

    //poll encoders
    //TODO check encoder angle processing/conversion logic
    //from raw 0-360 angles:
    //south bascule starts at 270, negative bascule rot is positive
    //north bascule starts at 90, positive bascule rot is positive
    //same pole of magnet should always face forwards/backwards relative to bascule, on both sides (and then magnet polarity is essentially flipped for north/south)
    northBascAngle = pollEncoderRawAngle(northEncoderChannel) - 90
    southBascAngle = (360 - pollEncoderRawAngle(southEncoderChannel)) - 90

    serial.writeLine("North Angle Sensor: " + northBascAngle)
    serial.writeLine("South Angle Sensor: " + southBascAngle)


    //poll motor current sense
    northMotorMilliamps = pollMotorMilliamps(NORTH_IMON_PIN)
    southMotorMilliamps = pollMotorMilliamps(SOUTH_IMON_PIN)

    //set collision warning LEDs
    pins.digitalWritePin(N_BASC_LED_PIN, + (northBascAngle <= basculeLowerLimit)) //world's dumbest boolean to integer cast
    pins.digitalWritePin(N_TOWER_LED_PIN, + (northBascAngle >= basculeUpperLimit))
    pins.digitalWritePin(S_BASC_LED_PIN, + (southBascAngle <= basculeLowerLimit))
    pins.digitalWritePin(S_TOWER_LED_PIN, + (southBascAngle >= basculeUpperLimit))

    //stop motors from moving if they've hit limits and are moving in the wrong direction
    if (northBascAngle <= basculeLowerLimit && northMotorSpeed < 0) setNorthMotorSpeed(0)
    if (northBascAngle >= basculeUpperLimit && northMotorSpeed > 0) setNorthMotorSpeed(0)
    if (southBascAngle <= basculeLowerLimit && southMotorSpeed < 0) setSouthMotorSpeed(0)
    if (southBascAngle >= basculeUpperLimit && southMotorSpeed > 0) setSouthMotorSpeed(0)


    let currentEastBreakbeamState = pins.digitalReadPin(EAST_BREAKBEAM_PIN) == 0
    let currentWestBreakbeamState = pins.digitalReadPin(WEST_BREAKBEAM_PIN) == 0
    if (shipTransittingBridge) {
        if (!(currentEastBreakbeamState || currentWestBreakbeamState)) shipTransittingBridge = false
    } else {
        if (currentEastBreakbeamState) {
            lastShipTransitDirection = ShipTransitDirection.Upriver
            shipTransittingBridge = true
        } else if (currentWestBreakbeamState) {
            lastShipTransitDirection = ShipTransitDirection.Downriver
            shipTransittingBridge = true
        }
    }
    prevEastBreakbeamState = currentEastBreakbeamState
    prevWestBreakbeamState = currentWestBreakbeamState
    //the commented out line below this is used for testing that the control loop is running properly/being invoked by the scheduler correctly
    // music.play(music.tonePlayable(262, music.beat(BeatFraction.Whole)), music.PlaybackMode.UntilDone)
    basic.pause(24) //run monitoring loop at ~42Hz (every 4 scheduler cycles when not interrupted)
})

function setMotorSpeed(speed: number, IN1: number, IN2: number) {
    let PWMvalue = Math.clamp(-100, 100, speed) * (1024.0 / 100.0)
    if (speed > 0) {
        pins.analogWritePin(IN1, PWMvalue)
        pins.digitalWritePin(IN2, 0)
    } else {
        pins.digitalWritePin(IN1, 0)
        pins.analogWritePin(IN2, PWMvalue)
    }
}

function setNorthMotorSpeed(speed: number) {
    northMotorSpeed = speed
    setMotorSpeed(speed, NIN1, NIN2)
}

function setSouthMotorSpeed(speed: number) {
    southMotorSpeed = speed
    setMotorSpeed(speed, SIN1, SIN2)
}

//% weight=100 color=#0066AA icon="" block="Bascule Motors"
//% groups='["Motors"]'
namespace basculeMotors {

    /**
     * Set a bascule to a specific speed
     * @param side side of bridge to set
     * @param speed speed to set
     */
    //% blockId=towerbridge_set_bascule_speed
    //% block="set the $side bascule to speed $speed"
    //% group="Motors"
    //% weight=90
    //% side.defl=BridgeSide.Left
    //% speed.min=-100 speed.max=100 speed.defl=0
    //% speed.shadow="speedPicker"
    export function setBasculeMotorSpeed(side?: BridgeSide, speed?: number): void {
        switch (side) {
            case BridgeSide.Left:
                setSouthMotorSpeed(speed)
                break
            case BridgeSide.Right:
                setNorthMotorSpeed(speed)
                break
        }
    }

    /**
     * Start a bascule moving in a direction (at speed 50)
     * @param side side of bridge to set
     * @param direction direction to set
     */
    //% blockId=towerbridge_set_bascule_direction
    //% block="start $direction -ing the $side bascule"
    //% group="Motors"
    //% weight=90
    //% side.defl=BridgeSide.Left
    //% direction.defl=BasculeDirection.Raise
    export function setBasculeMoveDirection(side?: BridgeSide, direction?: BasculeDirection): void {
        let speed = 0
        switch (direction) {
            case BasculeDirection.Raise:
                speed = 50
                break
            case BasculeDirection.Lower:
                speed = -50
                break
        }
        switch (side) {
            case BridgeSide.Left:
                setSouthMotorSpeed(speed)
                break
            case BridgeSide.Right:
                setNorthMotorSpeed(speed)
                break
        }
    }

    /**
     * Stops a bascule moving (sets it's speed to 0)
     * @param side side of bridge to set
     */
    //% blockId=towerbridge_stop_basule
    //% block="stop moving the $side bascule"
    //% group="Motors"
    //% weight=90
    //% side.defl=BridgeSide.Left
    export function stopBasculeMoving(side?: BridgeSide): void {
        switch (side) {
            case BridgeSide.Left:
                setSouthMotorSpeed(0)
                break
            case BridgeSide.Right:
                setNorthMotorSpeed(0)
                break
        }
    }

    /**
     * Move a bascule to a specific angle in degrees. (and wait to continue until finished)
     * @param side side of the bridge to set
     * @param angle angle in degrees, eg: 45
     */
    //% blockId=towerbridge_move_bascule_to_degrees
    //% block="move $side bascule to %angle °"
    //% side.defl=BridgeSide.Left
    //% angle.min=-15 angle.max=86 angle.defl=0
    //% group="Motors"
    //% weight=86
    export function moveBasculeTo(side?: BridgeSide, angle?: number): void {
        //note that we (tragically) can't use the protractor shadow picker for this block because that is hardcoded 0-180
        //TODO
    }

    /**
     * Move the bascule an amount of degrees relative to it's current angle. (and wait to continue until finished)
     * @param side side of the bridge to set
     * @param angle angle in degrees, eg: 45
     */
    //% blockId=towerbridge_move_bascule_for_degrees
    //% block="move $side bascule %angle ° from it's current angle"
    //% side.defl=BridgeSide.Left
    //% angle.min=-15 angle.max=86 angle.defl=0
    //% group="Motors"
    //% weight=86
    export function moveBasculeForDegrees(side?: BridgeSide, angle?: number): void {
        //note that we (tragically) can't use the protractor shadow picker for this block because that is hardcoded 0-180
        //TODO
    }

    /**
     * Raises or lowers a bascule (at speed 50)
     * @param side side of bridge to set
     * @param direction sets whether to raise or lower bascule
     */
    //% blockId=towerbridge_raise_lower_bascule
    //% block="$direction the $side bascule"
    //% group="Motors"
    //% weight=90
    //% side.defl=BridgeSide.Left
    //% direction.defl=BasculeDirection.Raise
    export function raiseLowerBascule(side?: BridgeSide, direction?: BasculeDirection): void {
        let angleTarget = direction == BasculeDirection.Raise ? 86 : 0
        moveBasculeTo(side, angleTarget)
    }


}

//% weight=100 color=#4a27b3 icon="⭐️" block="Bascule Sensors"
//% groups='["Angle Sensors"]'
namespace angleSensors {

    /**
     * Returns true if the bascule is in/close enough to the raised or lowered position
     */
    //% blockId=towerbridge_bascule_in_position
    //% block="$side bascule is fully $direction -ed"
    //% group="Angle Sensors"
    //% weight=84
    //% side.defl=BridgeSide.Left
    //% direction.defl=BasculeDirection.Raise
    export function isBasculeInPosition(side?: BridgeSide, direction?: BasculeDirection): boolean {
        let bascAngle = 0
        switch (side) {
            case BridgeSide.Left:
                bascAngle = southBascAngle
                break
            case BridgeSide.Right:
                bascAngle = northBascAngle
                break
        }
        switch (direction) {
            case BasculeDirection.Raise:
                return bascAngle >= basculeUpperThresh
                break
            case BasculeDirection.Lower:
                return bascAngle <= basculeLowerThresh
                break
        }
    }

    /**
     * Get bascule position in degrees (from last time it is polled in main control loop)
     */
    //% blockId=towerbridge_get_bascule_angle
    //% block="$side bascule angle"
    //% group="Angle Sensors"
    //% weight=84
    //% side.defl=BridgeSide.Left
    export function getBasculePosition(side?: BridgeSide): number {
        //TODO consider rounding to nearest integer?
        switch (side) {
            case BridgeSide.Left:
                return southBascAngle
                break
            case BridgeSide.Right:
                return northBascAngle
                break
        }
    }

    /**
     * Returns true if the angle sensor has detected the presence of the magnet, indicating the bascule is seated
     */
    //% blockId=towerbridge_is_bascule_present
    //% block="$side bascule is present"
    //% group="Angle Sensors"
    //% weight=84
    //% side.defl=BridgeSide.Left
    export function isBasculePresent(side?: BridgeSide): boolean {
        //TODO
        return true
    }

    /**
     * Returns true if the angle sensor is out of valid range, indicating the bascule has been inserted upside down
     */
    //% blockId=towerbridge_is_bascule_upside_down
    //% block="$side bascule is upside-down"
    //% group="Angle Sensors"
    //% weight=84
    //% side.defl=BridgeSide.Left
    export function isBasculeUpsideDown(side?: BridgeSide): boolean {
        //TODO
        return true
    }



}

//% weight=100 color=#F99423 icon="" block="Bridge Sensors"
//% groups='["Break-beam Sensors", "Colour Sensor"]'
namespace bridgeSensors {

    /**
     * Returns true if the infrared beam between the two piers is interrupted by some object
     */
    //% blockId=towerbridge_is_beam_broken
    //% block="$side break-beam is broken"
    //% group="Break-beam Sensors"
    //% weight=84
    //% side.defl=BreakbeamSide.East
    export function isBeamBroken(side?: BreakbeamSide): boolean {
        switch (side) {
            case BreakbeamSide.West:
                return prevWestBreakbeamState
                break
            case BreakbeamSide.East:
                return prevEastBreakbeamState
                break
        }
    }

    /**
     * Returns true if a ship is either waiting or actively transitting the Bridge
     * this is an additional layer of abstraction, based on if either breakbeam was tripped and both haven't gone yet
     */
    //% blockId=towerbridge_is_ship_present
    //% block="ship is passing through bridge"
    //% group="Break-beam Sensors"
    //% weight=84
    export function isShipPresent(): boolean {
        return shipTransittingBridge
    }

    /**
     * Returns which direction the current/most recent ship that transitted through the bridge went in
     * this is an additional layer of abstraction, based on which breakbeam was tripped first
     */
    //% blockId=towerbridge_get_ship_transit_direction
    //% block="most recent ship transit direction"
    //% group="Break-beam Sensors"
    //% weight=84
    export function getShipTransitDirection(): ShipTransitDirection {
        return lastShipTransitDirection
    }


    //TODO I'm sure there's a better way to expose enums to blocks but I can't figure out what it is
    /**
     * Returns the Upriver enum, for checking against getShipTransitDirection
     */
    //% blockId=towerbridge_upriver_enum
    //% block="upriver"
    //% group="Break-beam Sensors"
    //% weight=84
    export function upriver(): ShipTransitDirection {
        return ShipTransitDirection.Upriver
    }

    /**
     * Returns the Downriver enum, for checking against getShipTransitDirection
     */
    //% blockId=towerbridge_downriver_enum
    //% block="downriver"
    //% group="Break-beam Sensors"
    //% weight=84
    export function downriver(): ShipTransitDirection {
        return ShipTransitDirection.Downriver
    }




    /**
     * Get which color the color sensor on the north-west side of the bridge is seeing
     */
    //% blockId=towerbridge_color_sensor_reading
    //% block="colour seen"
    //% group="Colour Sensor"
    //% weight=84
    export function getColorSensorReading(): ColorSensorColor {
        return ColorSensorColor.Red //TODO implement
    }

    //TODO again there's surely a better way to expose these enums but idk what it is
    /**
     * Get a color to compare a color sensor reading against
     */
    //% blockId=towerbridge_color_enum
    //% block="$color"
    //% group="Colour Sensor"
    //% weight=84
    export function getColor(color: ColorSensorColor): ColorSensorColor {
        return color
    }

    /**
     * Get the hue reading the color sensor on the north-west side of the bridge is seeing
     */
    //% blockId=towerbridge_color_sensor_reading_hue
    //% block="hue seen"
    //% group="Colour Sensor"
    //% weight=84
    export function getColorSensorReadingHue(): number {
        return 255 //TODO implement
    }

    /**
     * Get the saturation reading the color sensor on the north-west side of the bridge is seeing
     */
    //% blockId=towerbridge_color_sensor_reading_sat
    //% block="saturation seen"
    //% group="Colour Sensor"
    //% weight=84
    export function getColorSensorReadingSaturation(): number {
        return 255 //TODO implement
    }

    /**
     * Get the value reading the color sensor on the north-west side of the bridge is seeing
     */
    //% blockId=towerbridge_color_sensor_reading_val
    //% block="value seen"
    //% group="Colour Sensor"
    //% weight=84
    export function getColorSensorReadingValue(): number {
        return 255 //TODO implement
    }

    /**
     * Get the brightness reading the color sensor on the north-west side of the bridge is seeing
     */
    //% blockId=towerbridge_color_sensor_reading_brightness
    //% block="total brightness seen"
    //% group="Colour Sensor"
    //% weight=84
    export function getColorSensorReadingBrightness(): number {
        return 255 //TODO implement
    }




}

//% weight=100 color=#4a27b3 icon="⭐️" block="Bridge Lighting"
//% groups='["Lighting"]'
namespace bridgeLighting {


    /**
     * Set the color (with seperate H, S, V values) of the tower LEDs
     * @param side side of the bridge to set
     * @param hue hue to set lighting to
     * @param saturation saturation to set lighting to
     * @param value value to set lighting to
     */
    //% blockId=towerbridge_set_tower_color_hsv
    //% block="set the $side tower lighting|hue to $hue|saturation to $saturation|value to $value"
    //% side.defl=BridgeSide.Left
    //% hue.min=0 hue.max=255 hue.defl=170
    //% saturation.min=0 saturation.max=255 saturation.defl=170
    //% value.min=0 value.max=255 value.defl=170
    //% group="Lighting"
    //% weight=86
    export function setTowerLightingColorHSV(side?: BridgeSide, hue?: number, saturation?: number, value?: number): void {
        //TODO
    }

    /**
     * Set the color (with color picker) of the tower LEDs, given a value in hex (like 0xFF0000, for red)
     * @param side side of the bridge to set
     * @param color color to set lighting to
     */
    //% blockId=towerbridge_set_tower_color
    //% block="set the $side tower lighting color to $color"
    //% side.defl=BridgeSide.Left
    //% color.shadow="colorNumberPicker"
    //% group="Lighting"
    //% weight=86
    export function setTowerLightingColorHex(side?: BridgeSide, color?: number): void {
        //TODO
        let RGBcolor = [color >> 16 & 0xFF, color >> 8 & 0xFF, color & 0xFF]
    }

    /**
     * Set the brightness (0-255) of the tower LEDs
     * @param side side of the bridge to set
     * @param brightness brightness to set lighting to
     */
    //% blockId=towerbridge_set_tower_brightness
    //% block="set the $side tower lighting brightness to $brightness"
    //% side.defl=BridgeSide.Left
    //% brightness.min=0 brightness.max=255 brightness.defl=100
    //% group="Lighting"
    //% weight=86
    export function setTowerLightingBrightness(side?: BridgeSide, brightness?: number): void {
        //TODO
    }


}
