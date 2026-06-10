# Raise Tower Bridge


```package
raise-tower-bridge=github:hisi741/pxt-raise-tower-bridge
```


## Task 2 Video @showdialog

Watch the video for Task 2. 

![Random video 2](youtube:65ivoafQnzw)

## Task 2: Choose the bridge height

Now you can choose the angle of the bridge.

When you press **button A**, both sides of the bridge should rise to the **same height**.

When you press **button B**, both sides of the bridge should lower back to the **horizontal position**.

Talk with your team:
What is a good height for ships to pass safely?

Try different angles and test your bridge.

```blocks
input.onButtonPressed(Button.A, function () {
    towerBridge.setLeftBasculeTo(70)
    towerBridge.setRightBasculeTo(70)
})
input.onButtonPressed(Button.B, function () {
    towerBridge.setLeftBasculeTo(0)
    towerBridge.setRightBasculeTo(0)
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

[Prev Task](https://makecode.microbit.org/#tutorial:https://github.com/hisi741/pxt-raise-tower-bridge/tutorials/task1)
[Next task](https://makecode.microbit.org/#tutorial:https://github.com/hisi741/pxt-raise-tower-bridge/tutorials/task3)


```template
input.onButtonPressed(Button.A, function () {
    towerBridge.setLeftBasculeTo(20)
    towerBridge.setRightBasculeTo(50)
})
input.onButtonPressed(Button.B, function () {
    towerBridge.setRightBasculeTo(-15)
})
```