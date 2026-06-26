basic.forever(function () {
    if (bridgeSensors.isShipPresent()) {
        if (bridgeSensors.checkColor(ColorSensorColor.Red)) {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Left, 0xff0000)
        } else {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Left, 0x007fff)
        }
        if (bridgeSensors.checkShipSailingDirection(ShipSailingDirection.Upriver)) {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Right, 0xff8000)
        } else {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Right, 0x00ff00)
        }
        basculeMotors.raiseLowerBascule(BridgeSide.Left, BasculeDirection.Raise)
        basculeMotors.raiseLowerBascule(BridgeSide.Right, BasculeDirection.Raise)
        while (bridgeSensors.isShipPresent()) {
            basic.pause(100)
        }
        basculeMotors.raiseLowerBascule(BridgeSide.Left, BasculeDirection.Lower)
        basculeMotors.raiseLowerBascule(BridgeSide.Right, BasculeDirection.Lower)
    } else {
        basic.pause(100)
    }
})
