# Use-Case Specification: Safe the game

# 1. Safe the game

## 1.1 Brief Description
Safe the progress you make throughout the game. While the player cannot actively safe progress, this is still one of the essential processes of the application.
The game will automatically safe after the completion of each level.

## 1.2 Mockup 
tbd

## 1.3 Screenshots
tbd

# 2. Flow of Events

## 2.1 Basic Flow
- User completes level
- Game saves progress to local data storage (subject to change)

### Activity Diagram
tbd


## 2.2 Alternative Flows
- User tries to perform actions prohibited by the game (e.g. walk through walls)

# 3. Special Requirements
n/a

# 4. Preconditions
The preconditions for this use case are:
1. The user has started the App
2. The user has started a level
3. The user has cleared a level

# 5. Postconditions
The level is saved to the storage.

# 6. Effort

Effort: Low-Medium
The saving process itself doesn't require much effort. Finding a suitable way to save data is not as easy.
