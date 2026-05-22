towerBridge.trafficGreen()

basic.forever(function () {
    if (towerBridge.boatDetected()) {
        towerBridge.trafficRed()
        towerBridge.raiseBridge()
    } else {
        towerBridge.lowerBridge()
        towerBridge.trafficGreen()
    }
})
