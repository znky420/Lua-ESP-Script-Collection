# Lua ESP Script Collection

A professional collection of 8 modular ESP scripts for Lua environments supporting the Drawing API. All scripts are optimized for performance with RenderStepped logic and dynamic scaling.

## Included Scripts

- 2dboxesp.lua: Standard 2D bounding box (non-filled).
- corneresp.lua: Corner-style bounding box for minimal obstruction.
- nameesp.lua: Player name display with distance-based font scaling.
- healthesp.lua: Dynamic green health bar with background frame.
- distanceesp.lua: Distance indicator in studs that scales with perspective.
- traceresp.lua: Line tracers from bottom center to target position.
- skeletonesp.lua: Basic skeleton line connecting head and torso.
- headesp.lua: Non-filled circle overlay on target head position.

## Technical Features

- RenderStepped Logic: All scripts sync with the framerate to prevent jitter.
- Dynamic Scaling: UI elements and text automatically resize based on distance.
- Error Handling: Checks for character existence and visibility to prevent crashes.
- Standalone Design: Each script can be executed independently.

## Usage

1. Select the desired .lua script.
2. Execute the code within your compatible environment.
3. The ESP elements will automatically attach to other players.

## Disclaimer

These scripts are for educational purposes only. Use at your own risk. The developer is not responsible for any misuse or violations of third-party terms of service.
