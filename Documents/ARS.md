# Architecture Significant Requirements (ASR)

## 1. Utility tree

Here you can get access to our [ARS table](./Pictures/ARS_table.png)

## 2. Architecture decisions and Concrete design patterns

Here are some ouf our thoughts that influenced our priorities in the Utility tree that are important:

We thought that our game will grow significantly in the future. For example more levels or game elements.
Thats why we decided that Modifiability is our main architecture decision.
Some of our tactics are:

- Adding new levels:
Adding a new level should be easy and independent of the game.

- Changing / Adding game elements (Enemies):
Enemies shall be modified just by changing the enemy itself and not changing things in the game/level.
Adding a new enemy should be easy and independent of the game.

- Let the user work:
Adding options for the user to add custom levels, textures, etc.
So the user can add things (independent of the main game) which he likes so he has more fun playing the game. 
