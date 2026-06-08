/**
 * Tower Bridge — PXT block API (stubs)
 *
 * This file provides MakeCode/PXT blocks (stub implementations) for
 * classroom prototyping. Functions are intentionally empty; replace with
 * hardware or simulation code as needed.
 */

//% weight=100 color=#0066AA icon="\uf13d" block="Tower Bridge"
//% groups=['Bridge','Sensors']
namespace towerBridge {

    /**
     * Raise left bascule (step).
     */
    //% blockId=towerbridge_raise_left_bascule
    //% block="raise left bascule"
    //% group="Bridge"
    //% weight=90
    export function raiseLeftBascule(): void {
        // stub — implement actuator or simulation here
    }

    /**
     * Raise right bascule (step).
     */
    //% blockId=towerbridge_raise_right_bascule
    //% block="raise right bascule"
    //% group="Bridge"
    //% weight=89
    export function raiseRightBascule(): void {
        // stub — implement actuator or simulation here
    }

    /**
     * Lower left bascule (step).
     */
    //% blockId=towerbridge_lower_left_bascule
    //% block="lower left bascule"
    //% group="Bridge"
    //% weight=88
    export function lowerLeftBascule(): void {
        // stub — implement actuator or simulation here
    }

    /**
     * Lower right bascule (step).
     */
    //% blockId=towerbridge_lower_right_bascule
    //% block="lower right bascule"
    //% group="Bridge"
    //% weight=87
    export function lowerRightBascule(): void {
        // stub — implement actuator or simulation here
    }

    /**
     * Set left bascule to <n>°.
     * n is clamped to integer values between -15 and 86.
     */
    //% blockId=towerbridge_set_left_bascule_to
    //% block="set left bascule to %n°"
    //% n.min=-15 n.max=86
    //% group="Bridge"
    //% weight=86
    export function setLeftBasculeTo(n: number): void {
        // stub — set left bascule angle (degrees)
    }

    /**
     * Set right bascule to <n>°.
     * n is clamped to integer values between -15 and 86.
     */
    //% blockId=towerbridge_set_right_bascule_to
    //% block="set right bascule to %n°"
    //% n.min=-15 n.max=86
    //% group="Bridge"
    //% weight=85
    export function setRightBasculeTo(n: number): void {
        // stub — set right bascule angle (degrees)
    }

    /**
     * Ship coming — boolean sensor block usable in `if` statements.
     * Returns true/false (1/0). Default stub returns false.
     */
    //% blockId=towerbridge_ship_coming
    //% block="ship coming"
    //% group="Sensors"
    //% weight=84
    export function shipComing(): boolean {
        // stub sensor — replace with real detection/simulation
        return false
    }

}
