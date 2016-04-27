volatile unsigned int* key....

clear_display()
index = 0
set_cursor(bottom_left)
string_array[28] //setting up the string array (index * 2 entries)























DISPLAY ARRAY

|0123456789ABCDEF|
|-----------------
|    MAIN MENU   | 0
|- ROUTE        v| 1
------------------ 
|- ADJ PARAM    ^| 2
|                | 3 
------------------
|   ROUTE MENU   | 4
|- A->B->C      v| 5
------------------
|- A->C->B      ^| 6
|- B->A->C      v| 7
------------------
|- B->C->A      ^| 8
|- C->A->B      v| 9
------------------
|- C->B->A      ^| 10
|- RETURN        | 11
------------------
|ADJUST PARAMETER| 12
|- A=DISTORTION v| 13
------------------
|- B=TREMOLO    ^| 14
|- C=DELAY      v| 15
------------------
|- RETURN       ^| 16
|                | (3)
------------------
|  DISTORTION ON | 17
|- DRIVE        v| 18
------------------
|- VOLUME       ^| 19
|- RETURN        | (11)
------------------
|   TREMOLO ON   | 20
|- RATE         v| 21
------------------
|- DEPTH        ^| 22
|- DUTY CYCLE   v| 23
------------------
|- RETURN       ^| (16)
|                | (3)
------------------
|    DELAY ON    | 24
|- TIME         v| 25
------------------
|- MIX          ^| 26
|- REPEATS      v| 27
------------------
|- RETURN       ^| (16)
|                | (3)
------------------
..................
|  TREMOLO OFF   | 28
| DISTORTION OFF | 29
|   DELAY OFF    | 30
|      XXX       | 31


