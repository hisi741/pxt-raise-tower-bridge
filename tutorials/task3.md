# Raise Tower Bridge


```package
raise-tower-bridge=github:hisi741/pxt-raise-tower-bridge
```

## Task 3 Video @showdialog

Watch the video for Task 3.

![Random Video 3](youtube:65ivoafQnzw)

## Task 3: Use the ship sensor

Now make the bridge work automatically.

If the sensor detects a ship, the bridge should go **up**.

If there is no ship, the bridge should go **down**.

Test your code by using the ship sensor.

```blocks
basic.forever(function () {
    if (towerBridge.shipComing()) {
        towerBridge.raiseLeftBascule()
        towerBridge.raiseRightBascule()
    } else {
        towerBridge.lowerLeftBascule()
        towerBridge.lowerRightBascule()
    }
})
```




## Finish @showdialog

Great work, engineer!

You have programmed Tower Bridge to:

* move with buttons
* move to chosen angles
* react automatically to a ship sensor

Now test your final program on the bridge model.

Can your team make the bridge move smoothly and safely? 

[Prev task](https://makecode.microbit.org/#tutorial:https://github.com/hisi741/pxt-raise-tower-bridge/tutorials/task2)


```template
basic.forever(function () {
    if (towerBridge.shipComing()) {
    } else {
    }
})
```
