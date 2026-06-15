//% weight=100 color=#0066AA icon="" block="Tower Bridge"
//% groups='["Bridge","Sensors"]'
namespace towerBridge {

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
