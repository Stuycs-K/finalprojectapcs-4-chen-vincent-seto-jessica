# Dev Log:

This document must be updated daily every time you finish a work session.

## Jessica Seto

### May 21st
Drafted block and fixed UML diagrams

### May 23rd
Editied Block class a bit and started on pieces

### May 27th
Helped Vincent fix the board class and render, and also figured out why the pieces wasn't working (I can't have the templates be static)

### May 27th Homework
Tweaked Piece and Block class and got a test piece to spawn in correctly, changed x and y into r and c, alongside drafting a canFit() to check whether or not it a piece can move into a new position

### May 28th In-class
Unreversed the rows and columns in pieces, got single drop working, fixed the canFit a bit but did not rigorosly test anything yet

### May 28th Homework
Got single drop actually working, fixed the canFit to work properly, drafted Rotate, fixed render

### May 29th in class
Made it so pieces got a random color, fixed rotate, and started adding the actual custom pieces

### May 29th Homework
Added quickdrop, and dropping during tick (very janky), and made a couple pieces

### May 30th not in Class
Started work on end condition, fixed pieces spawning in, and added left and right translations and keybinds to all currently implemented translations

### May 30th Homework
Made an end screen and end condition, and tried to determine the source of a bug where it will just flash columns colors on the screen towards the end of the game.

### June 1 class
Tried to find source of a bug. was not successful.

### June 1 HW
I think I was successful finding source of bug. Is in the score() and clearing row functionality. There is also duplicate clear row methods that needs to be dealt with tomorrow. Also added debug mode, where manually spawn/move pieces and can click on blocks to print debug info. (or press p to print info about current pice)
