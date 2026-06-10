# Raise Tower Bridge

```package
raise-tower-bridge=github:hisi741/pxt-raise-tower-bridge
```

## Introduction @showdialog

# Raise Tower Bridge Workshop

You are an engineer working at **Tower Bridge**.

Large ships need to pass safely along the River Thames. Your job is to program the bridge so the bascules can rise and lower at the right time.

Work carefully, test your code, and talk with your team for each task.

## Task 1 Video @showdialog

Watch the video for Task 1. 

![Random Video 1](youtube:65ivoafQnzw)

## Task 1: Raise and lower the bridge

Make the bridge respond to the micro:bit buttons.

When you press **button A**, both sides of the bridge should go **up**.

When you press **button B**, both sides of the bridge should go **down**.

Test your code on the Tower Bridge model.


```blocks
input.onButtonPressed(Button.A, function () {
    towerBridge.raiseLeftBascule()
    towerBridge.raiseRightBascule()
})
input.onButtonPressed(Button.B, function () {
    towerBridge.lowerLeftBascule()
    towerBridge.lowerRightBascule()
})
```


## Finish @showdialog

Great work, engineer!

[Next task](https://makecode.microbit.org/#tutorial:https://github.com/hisi741/pxt-raise-tower-bridge/tutorials/task2)


```template
input.onButtonPressed(Button.A, function () {
    towerBridge.raiseLeftBascule()
})
input.onButtonPressed(Button.B, function () {
    towerBridge.lowerLeftBascule()
})
``` 



```template
input.onButtonPressed(Button.A, function () {
    towerBridge.raiseLeftBascule()
})
input.onButtonPressed(Button.B, function () {
    towerBridge.lowerLeftBascule()
})
```