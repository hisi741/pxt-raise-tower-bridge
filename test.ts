towerBridge.raiseLeftBascule()
towerBridge.raiseRightBascule()
towerBridge.lowerLeftBascule()
towerBridge.lowerRightBascule()
towerBridge.setLeftBasculeTo(45)
towerBridge.setRightBasculeTo(45)

basic.forever(function () {
    if (towerBridge.shipComing()) {
        towerBridge.raiseLeftBascule()
        towerBridge.raiseRightBascule()
    } else {
        towerBridge.lowerLeftBascule()
        towerBridge.lowerRightBascule()
    }
})
