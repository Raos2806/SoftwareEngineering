# Use-Case Specification: Play the game

# 1. Play the game

## 1.1 Brief Description
This use case is about the actual gameplay of the application. The player (user) can freely move their character within the limits given by the rules of the game. This means he can:
-move his character to the left or to the right at a set speed
-jump upwards a set distance
-can move to the left or right while jumping
-has to overcome obstacles while moving towards the goal at the end of the level at the very right
-
## 1.2 Mockup 
tbd

## 1.3 Screenshots
tbd

# 2. Flow of Events

## 2.1 Basic Flow
- Users klicks on "Post new session"-button
- "Post-Session"-template pops up
- User fills in template
- User klicks on "finish"-button
- Session gets posted

### Activity Diagram
![Activity Diagram](../activity_diagrams/UCD1_Post_Session.png)


## 2.2 Alternative Flows
n/a

# 3. Special Requirements
n/a

# 4. Preconditions
The preconditions for this use case are:
1. The user has started the App
2. The user has klicked on the "Post a session"-button

# 5. Postconditions
The postconditions for this use case are:
1. The session gets posted on the session overview page
2. The players participating index is incremented (session creator is the first person)

### 5.1 Save changes / Sync with server

If a session gets posted it needs to get synced with the server, so that every user can see the session.


# 6. Function Points
![Function Points UC1_Post_Session](../function_points/UC1_Posting.png)
<img src="../function_points/Blue_print.png" alt="Function Points Blue_Print" width="500"/>

Total number of function points: 13.09
