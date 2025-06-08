[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/YxXKqIeT)
# Project Description

This project is a parody of the original Tetris, but with 5 pieces instead of 4 (which gives rise to many new game mechanics!).

Our MVP features the following:

- :white_check_mark: A 10x20 play grid surrounded by wall borders.
- :white_check_mark: All 12 types of 5-square falling pieces (pentominoes), less their mirror images. 
- :white_check_mark: Mechanics for moving left/right, soft drop, hard drop, and rotate.
- :white_check_mark: A real-time game loop with falling blocks and collision detection.
- :white_check_mark: Full line clear detection and removing of filled rows that might cause some flashing on the screen.
- :white_check_mark: Score tracking based on # of rows cleared, pieces used, and drops.
- :white_check_mark: Game-over detection.

(note: we discovered a bug where sustained playing leads to a "smoosh" effect at the top of the screen when pieces drop, but this will be fixed.)

Post-MVP, we'll try to incorporate the following:
- :white_check_mark: Next piece preview.
- :white_check_mark: Visible score on RHS.
- :white_check_mark: Powerups! Clear powerup blocks to get special powerups
  - :white_check_mark: Freezing of the game (snowflake blocks): (Stops automatic dropping so YOU can control where the piece goes for 3 seconds)
  - :white_check_mark: Score bonus (star blocks): Multiplies your score by 3x for 5 seconds
  -  :white_check_mark: Added opportunities to swap out a piece
- :white_check_mark: Ability to swap out a piece you don't like for another one.
- :white_check_mark: A clearRow that isn't bugged


# Intended usage:

![PIECES DIAGRAM](pieces.jpeg?raw=true "Diagram of all pentomino pieces. Our implemented pieces may be different due to reflections for optimization." )

- We will randomly drop one of 18 pentominoes (O,P,Q,R,S,T,U,V,W,X,Y,Z, as well as reflections of P,Q,R,S,Y,Z -- see attached diagram) and the player will have to arrange it in a way to clear as many rows as possible. 
- We'll end the game when new blocks can no longer be spawned in. (e.g. it hits top of the board)
- When rows are filled, the row will clear and all above placed blocks will move down accordingly.
- To move blocks, use the following:
  - 'a'/left key to move piece left
  - 'd'/right key to move piece right
  - 'w'/up/'r' key to rotate in a counterclockwise fashion
  - 's'/down key to lower piece by one
  - 'q' key to hold a piece
  - space key to quick drop to lowest position (e.g. can't be dropped further without collision)
