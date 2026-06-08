# Code reference — Tower Bridge PXT blocks

This README documents the code API and offered MakeCode/PXT blocks in this repository.

## Key types and state

- `enum BridgePosition` — named positions: `Down`, `Flat`, `Middle`, `Up`.
- `namespace towerBridge` — main API namespace. Internal state variables:
	- `currentPosition` — overall bridge state.
	- `currentLeftPosition`, `currentRightPosition` — per-side positions.

## Primary functions / blocks

These functions are exported as MakeCode blocks (see `//% blockId=...` in `main.ts`). They are intentionally small and act as placeholders for physical or simulated bridge control.

- `setBridgePosition(position: BridgePosition)` — set the global bridge position.
- `raiseBridge()` / `lowerBridge()` — convenience functions that set the bridge to `Up` or `Flat`.

Per-side partial movement (step):
- `raiseRightBridge()` / `lowerRightBridge()` — move right side up/down by one step.
- `raiseLeftBridge()` / `lowerLeftBridge()` — move left side up/down by one step.

Per-side full movement:
- `raiseRightBridgeFully()` / `lowerRightBridgeFully()` — set right side to `Up` / `Down`.
- `raiseLeftBridgeFully()` / `lowerLeftBridgeFully()` — set left side to `Up` / `Down`.

Other helpers:
- `boatDetected(): boolean` — a sensor mock (button A). Use to trigger bridge behaviour in examples.
- `trafficRed()` / `trafficGreen()` — show a simple traffic icon on the micro:bit display.

## How it displays state

- For quick feedback the code uses `basic.showString(...)`. Side-specific actions show `R` or `L` followed by a single-letter position (`D`, `F`, `M`, `U`).

## Usage examples

TypeScript example (MakeCode):

```ts
// raise the right side a step when a boat is detected
basic.forever(() => {
	if (towerBridge.boatDetected()) {
		towerBridge.raiseRightBridge()
	}
})

// set both sides fully up
towerBridge.raiseRightBridgeFully()
towerBridge.raiseLeftBridgeFully()
```

Blocks: load the project in MakeCode / PXT and search for the "Tower Bridge" toolbox. Blocks correspond to the function names above.

## Development notes

- The current functions are scaffolded for prototyping and classroom use; they do not drive motors or real hardware by default.
- Expect the API and blocks to change as the project evolves — this file will be updated to reflect breaking changes.

If you'd like, I can also add a short examples file (`examples.md`) or inline comments in `main.ts` showing recommended classroom activities.


