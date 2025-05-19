
# Technical Details:
Period 4

Vincent Chen & Jessica Seto

(cool group name later)

PENTRiX -- This is the classic Tetris, but instead of tetrominoes we use pentominoes (5 tiles per block!) which leads to more variation and some added difficulty. This would have the standard key options (soft drop, hard drop, rotate right, etc.) as well as the different line clears (with appropriate scores attached) and high score tracking, and we may also try to make the standard Tetris as another option if time permits. Link to tetris: https://play.tetris.com/

**Expanded Description:**

After 1.5 weeks, we hope to have a working Tetris and its 5-block counterpart. Mainly, we hope to create adequate centering and a working board that is aesthetically pleasing and functional; additional goals include functional rotation and dropping (as well as any other appropriate methods), as well as potential fun add-ons (maybe skills and/or power-ups?). 

## Things Strictly Neccesary:
- Clear line after filled
- Falling pieces (and quick drop)
- rotation
- moving left and right

 ## Things that are very neccesary
- Score tracking
- Colorful pieces

## Thins that would be nice to have
- Powerups?
- Animations when clearing a row?
 
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

Random ideas for project design:

pieces class
 - Has blocks
 - Has a center of rotation
 - and rotate (coordinate rotation)!
 - and move left and right
 - needs to check if a new position of the piece (after falling or moving) is valid
 - will need a fall method


block class (that can have color).
 - Keeps track of whether it is fallen/is a wall/falling
 - needs color

Board class could be array of these block objects
- Needs to be able to render it.
- Uh score?
    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

