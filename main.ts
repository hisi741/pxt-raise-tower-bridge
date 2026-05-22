enum BridgePosition {
    //% block="down"
    Down = 0,
    //% block="flat"
    Flat = 1,
    //% block="middle"
    Middle = 2,
    //% block="up"
    Up = 3
}

/**
 * Blocks for controlling a Tower Bridge model.
 */
//% weight=100 color=#0066AA icon="\uf13d" block="Tower Bridge"
//% groups=['Bridge', 'Sensors', 'Traffic']
namespace towerBridge {
    let currentPosition = BridgePosition.Flat

    function showPosition(position: BridgePosition): void {
        if (position == BridgePosition.Down) {
            basic.showString("D")
        } else if (position == BridgePosition.Flat) {
            basic.showString("F")
        } else if (position == BridgePosition.Middle) {
            basic.showString("M")
        } else {
            basic.showString("U")
        }
    }

    /**
     * Set the bridge to a named position.
     * @param position the bridge position
     */
    //% blockId=towerbridge_set_position
    //% block="set bridge to $position"
    //% group="Bridge"
    //% weight=90
    export function setBridgePosition(position: BridgePosition): void {
        currentPosition = position
        showPosition(position)
    }

    /**
     * Raise the bridge fully.
     */
    //% blockId=towerbridge_raise
    //% block="raise bridge"
    //% group="Bridge"
    //% weight=80
    export function raiseBridge(): void {
        setBridgePosition(BridgePosition.Up)
    }

    /**
     * Lower the bridge to the flat position.
     */
    //% blockId=towerbridge_lower
    //% block="lower bridge"
    //% group="Bridge"
    //% weight=70
    export function lowerBridge(): void {
        setBridgePosition(BridgePosition.Flat)
    }

    /**
     * Check whether a boat is detected.
     * Mock version: button A means a boat is detected.
     */
    //% blockId=towerbridge_boat_detected
    //% block="boat detected"
    //% group="Sensors"
    //% weight=90
    export function boatDetected(): boolean {
        return input.buttonIsPressed(Button.A)
    }

    /**
     * Show that road traffic must stop.
     */
    //% blockId=towerbridge_traffic_red
    //% block="show red traffic light"
    //% group="Traffic"
    //% weight=80
    export function trafficRed(): void {
        basic.showIcon(IconNames.No)
    }

    /**
     * Show that road traffic may go.
     */
    //% blockId=towerbridge_traffic_green
    //% block="show green traffic light"
    //% group="Traffic"
    //% weight=70
    export function trafficGreen(): void {
        basic.showIcon(IconNames.Yes)
    }
}
