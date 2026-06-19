//% weight=100 color=#0066AA icon="" block="Tower Bridge"
//% groups='["Bridge","Sensors"]'
namespace towerBridge {

    //pindefs.h memorial let statements
    let PWR_IMON_PIN = AnalogPin.P0
    let NORTH_IMON_PIN = AnalogPin.P1
    let SOUTH_IMON_PIN = AnalogPin.P2
    let SENSE2_PIN = AnalogPin.P3
    let SENSE1_PIN = AnalogPin.P4
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

    let muxI2CAddr: uint8 = 0x70
    let encoderI2CAddr: uint8 = 0x36
    let colorI2CAddr: uint8 = 0x44 //0x52

    function swapBytes(value: NumberFormat.UInt16LE) {
        return ((value & 0xFF00) >> 8) | ((value & 0x00FF) << 8)
    }

    function setEncoderChannel(channel: number) { //this also implicitly enables the color sensor channel, since there's no address conflict so that should always be enabled
        pins.i2cWriteNumber(muxI2CAddr, channel == 0 ? 0b0101 : 0b0110, NumberFormat.UInt8LE, false)
    }

    function getEncoderRawAngle() {
        pins.i2cWriteNumber(encoderI2CAddr, 0x0C, NumberFormat.UInt8LE, true)
        let rawAngle = pins.i2cReadNumber(encoderI2CAddr, NumberFormat.UInt16LE, false)
        rawAngle = ((rawAngle & 0xFF00) >> 8) | ((rawAngle & 0x000F) << 8)
        return rawAngle
    }

    //returns the current drawn from the polled motor in milliamps
    function pollMotorVoltage(pin: number) {
        return pins.analogReadPin(pin) * (3.3 / 1024.0) * (700.0 / 2.5) //10bit ADC, 700mA/2.5V VREF
    }

    basic.forever(function () {
        //code in here will run within the fibre scheduler, scheduled cooperatively, with a 6ms polling time
        /*
        TODO:
         poll encoders
         poll motor current sense
         turn off motors if encoders over limit in either direction
         set LEDs if encoders over limit in either direction
         maybe write hiccup timer code for if lowtrip isn't enabled and current is over limit (not sure exactly what the best logic for this would be, will probably write this once we have final model assembled)
         */
        basic.pause(24) //run monitoring loop at ~42Hz (every 4 scheduler cycles when not interrupted)
    })

    /**
     * Raise the left bascule.
     */
    //% blockId=towerbridge_raise_left_bascule
    //% block="raise left bascule"
    //% group="Bridge"
    //% weight=90
    export function raiseLeftBascule(): void {









    }

    /**
     * Raise the right bascule.
     */
    //% blockId=towerbridge_raise_right_bascule
    //% block="raise right bascule"
    //% group="Bridge"
    //% weight=89
    export function raiseRightBascule(): void {







    }

    /**
     * Lower the left bascule.
     */
    //% blockId=towerbridge_lower_left_bascule
    //% block="lower left bascule"
    //% group="Bridge"
    //% weight=88
    export function lowerLeftBascule(): void {





    }

    /**
     * Lower the right bascule.
     */
    //% blockId=towerbridge_lower_right_bascule
    //% block="lower right bascule"
    //% group="Bridge"
    //% weight=87
    export function lowerRightBascule(): void {



    }

    /**
     * Set the left bascule to a specific angle in degrees.
     * @param n angle in degrees, eg: 45
     */
    //% blockId=towerbridge_set_left_bascule_to
    //% block="set left bascule to %n °"
    //% n.min=-15 n.max=86 n.defl=0
    //% group="Bridge"
    //% weight=86
    export function setLeftBasculeTo(n: number): void {


    }

    /**
     * Set the right bascule to a specific angle in degrees.
     * @param n angle in degrees, eg: 45
     */
    //% blockId=towerbridge_set_right_bascule_to
    //% block="set right bascule to %n °"
    //% n.min=-15 n.max=86 n.defl=0
    //% group="Bridge"
    //% weight=85
    export function setRightBasculeTo(n: number): void {



    }

    /**
     * Returns true if a ship is coming.
     */
    //% blockId=towerbridge_ship_coming
    //% block="ship coming"
    //% group="Sensors"
    //% weight=84
    export function shipComing(): boolean {
        return false
    }

}
