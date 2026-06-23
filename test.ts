basic.forever(function () {
    if (bridgeSensors.isShipPresent()) {
        bridgeLighting.setTowerLightingBrightness(BridgeSide.Left, 100)
        if (bridgeSensors.getColorSensorReading() == bridgeSensors.getColor(ColorSensorColor.Red)) {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Left, 0xff0000)
        } else {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Left, 0x007fff)
        }
        if (bridgeSensors.getShipTransitDirection() == bridgeSensors.upriver()) {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Right, 0x00ff00)
        } else {
            bridgeLighting.setTowerLightingColorHex(BridgeSide.Right, 0xff8000)
        }
        basculeMotors.raiseLowerBascule(BridgeSide.Left, BasculeDirection.Raise)
        basculeMotors.raiseLowerBascule(BridgeSide.Right, BasculeDirection.Raise)
        while (bridgeSensors.isShipPresent()) {
            basic.pause(100)
        }
        basculeMotors.raiseLowerBascule(BridgeSide.Left, BasculeDirection.Lower)
        basculeMotors.raiseLowerBascule(BridgeSide.Right, BasculeDirection.Lower)
    } else {
        bridgeLighting.setTowerLightingBrightness(BridgeSide.Left, 0)
    }
    basic.pause(100)
})

