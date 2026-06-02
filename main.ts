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
    let currentLeftPosition = BridgePosition.Flat
    let currentRightPosition = BridgePosition.Flat

    function showPosition(position: BridgePosition): string {
        if (position == BridgePosition.Down) {
            return "D"
        } else if (position == BridgePosition.Flat) {
            return "F"
        } else if (position == BridgePosition.Middle) {
            return "M"
        } else {
            return "U"
        }
    }

    function showSidePosition(side: string, position: BridgePosition): void {
        basic.showString(side + showPosition(position))
    }

    function clampPosition(position: BridgePosition): BridgePosition {
        if (position < BridgePosition.Down) {
            return BridgePosition.Down
        }
        if (position > BridgePosition.Up) {
            return BridgePosition.Up
        }
        return position
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
        basic.showString(showPosition(position))
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
     * Raise the right bridge a step.
     */
    //% blockId=towerbridge_raise_right_partial
    //% block="raise right bridge"
    //% group="Bridge"
    //% weight=65
    export function raiseRightBridge(): void {
        currentRightPosition = clampPosition(currentRightPosition + 1)
        showSidePosition("R", currentRightPosition)
    }

    /**
     * Lower the right bridge a step.
     */
    //% blockId=towerbridge_lower_right_partial
    //% block="lower right bridge"
    //% group="Bridge"
    //% weight=64
    export function lowerRightBridge(): void {
        currentRightPosition = clampPosition(currentRightPosition - 1)
        showSidePosition("R", currentRightPosition)
    }

    /**
     * Raise the left bridge a step.
     */
    //% blockId=towerbridge_raise_left_partial
    //% block="raise left bridge"
    //% group="Bridge"
    //% weight=63
    export function raiseLeftBridge(): void {
        currentLeftPosition = clampPosition(currentLeftPosition + 1)
        showSidePosition("L", currentLeftPosition)
    }

    /**
     * Lower the left bridge a step.
     */
    //% blockId=towerbridge_lower_left_partial
    //% block="lower left bridge"
    //% group="Bridge"
    //% weight=62
    export function lowerLeftBridge(): void {
        currentLeftPosition = clampPosition(currentLeftPosition - 1)
        showSidePosition("L", currentLeftPosition)
    }

    /**
     * Raise the right bridge fully.
     */
    //% blockId=towerbridge_raise_right_full
    //% block="raise right bridge fully"
    //% group="Bridge"
    //% weight=61
    export function raiseRightBridgeFully(): void {
        currentRightPosition = BridgePosition.Up
        showSidePosition("R", currentRightPosition)
    }

    /**
     * Lower the right bridge fully.
     */
    //% blockId=towerbridge_lower_right_full
    //% block="lower right bridge fully"
    //% group="Bridge"
    //% weight=60
    export function lowerRightBridgeFully(): void {
        currentRightPosition = BridgePosition.Down
        showSidePosition("R", currentRightPosition)
    }

    /**
     * Raise the left bridge fully.
     */
    //% blockId=towerbridge_raise_left_full
    //% block="raise left bridge fully"
    //% group="Bridge"
    //% weight=59
    export function raiseLeftBridgeFully(): void {
        currentLeftPosition = BridgePosition.Up
        showSidePosition("L", currentLeftPosition)
    }

    /**
     * Lower the left bridge fully.
     */
    //% blockId=towerbridge_lower_left_full
    //% block="lower left bridge fully"
    //% group="Bridge"
    //% weight=58
    export function lowerLeftBridgeFully(): void {
        currentLeftPosition = BridgePosition.Down
        showSidePosition("L", currentLeftPosition)
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
