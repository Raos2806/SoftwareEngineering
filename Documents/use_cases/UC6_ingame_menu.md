# Use-Case Specification: Ingame Menu

# 1. Ingame Menu

### 1.1 Brief Description
This use case is about the ingame Menu which shows up when the Player (user) pushes the  button "Settings.png". The button shows up while being in a level and locates in the top right corner of the screen. After pressing the button the level will pause and 3 (in the future maybe more) buttons will show up:
- "Resume"
- "Settings"
- "Give Up"

### 1.1.1 Resume
Once pressed the "Resume" button the level will unpause and the Player can continue to play.

### 1.1.2 Settings
Once pressed the "Settings" button the use case "UC4_configure_settings" will be execeuted.

### 1.1.3 Give Up
Once pressed the "Give Up" button the use case "UC3_leave_game" will be executed.

## 1.2 Mockup 
tbd

## 1.3 Screenshots
tbd

# 2. Flow of Events

## 2.1 Basic Flow
- User presses Button "Settings.png"

### Activity Diagram
tbd

## 2.2 Alternative Flows
n/a

# 3. Special Requirements
n/a

# 4. Preconditions
The preconditions for this use case are:
1. The user has started the App
2. The user has started a level

# 5. Postconditions
n/a

# 6. Effort

Effort: Small
Requires the Use case "UC3_leave-game", "UC4_configure_settings" and a bit of programming.
