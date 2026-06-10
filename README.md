# Tower Bridge — PXT Extension

MakeCode/PXT extension for micro:bit Tower Bridge control.

## Development Guide

### The most important file

If you don't know what to look, just open **`main.ts`**.

### Workflow

1. **Design functions** — decide what blocks are needed.
2. **Implement the functions** in `main.ts`.
3. **Handle simultaneous execution** (see below).

---
## 1. Design functions
Now that I know the way to hide functions, I’m all for adding them for now, even if we’re not sure whether we’ll end up using them. 

## 2. Implement functions
I have absolutely no idea what works and what doesn't, so @everyone (including @codex and @claude_code), do your best!


## 3. Simultaneous Execution

Consider the following example:

```ts
input.onButtonPressed(Button.A, function () {
    towerBridge.raiseRightBascule()
    towerBridge.raiseLeftBascule()
})
```

The ideal behaviour here is that both bascules rise at the same time.
However, as written, the right bascule finishes before the left one starts (move sequentially).

According to ChatGPT, it is technically possible to make both move simultaneously by structuring the code carefully. I think this is a challenge worth solving.

---

## Available Blocks for now

| Block | Description |
|---|---|
| `raise left bascule` | Raise the left bascule for somewhat small amount|
| `raise right bascule` | Raise the right bascule for somewhat small amount|
| `lower left bascule` | Lower the left bascule for somewhat small amount|
| `lower right bascule` | Lower the right bascule for somewhat small amount|
| `set left bascule to n °` | Set the left bascule angle (−15 to 86°) |
| `set right bascule to n °` | Set the right bascule angle (−15 to 86°) |
| `ship coming` | Boolean sensor block — use in `if` conditions |



## Other function idea
Show red/green traffic light
raise/lower both bridge
