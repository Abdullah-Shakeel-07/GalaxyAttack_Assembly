include box.lib
include player.lib
include game.lib
include lvlone.lib
include lvltwo.lib
include lvlthree.lib
include sship.lib
include burst.lib
include sound.lib
include design.lib
include select.lib

.model small 
.stack 
.data  
; --------------------------------- Level One Enemy Coordinate ------------------------------
; x_cor db 6,5, 4,4,4,4, 5,6,7, 8,9,10,11,12, 13,14,15,16,17,18,19,20, 5, 4,4,4,4 ,5,6,7 ,8,9,10,11,12 ,13,14,15,16,17,18,19           ; Row

; x_cor db 5,4, 3,3,3,3, 4,5,6, 7,8,9,10,11, 12,13,14,15,16,17,18,19, 4, 3,3,3,3, 4,5,6 ,7,8,9,10,11 ,12,13,14,15,16,17,18          ; Row
; xlen = ($-x_cor)
; y_cor db 16,15, 14,13,12,11, 10,9,8 ,8,8,8,8,8, 9,10,11,12,13,14,15,16, 17, 18,19,20,21 ,22,23,24 ,24,24,24,24,24 ,23,22,21,20,19,18,17         ; Column
; ylen = ($-y_cor) 

; ---------------------------- Pattrn 1
x_cor db 60 , 100, 140, 180, 80 , 120, 160, 200, 60 , 100, 140, 180, 220, 80 , 120, 160, 200
xlen = ($-x_cor)
y_cor db 20, 20, 20 , 20, 50, 50, 50, 50, 80, 80, 80 , 80, 80, 110, 110, 110, 110
ylen = ($-y_cor) 

x_cor_copy db 60 , 100, 140, 180, 80 , 120, 160, 200, 60 , 100, 140, 180, 220, 80 , 120, 160, 200
y_cor_copy db 20, 20, 20 , 20, 50, 50, 50, 50, 80, 80, 80 , 80, 80, 110, 110, 110, 110

pattrn1x_cor_3 db 100, 140, 180, 80 , 120, 160, 200, 60 , 100, 140, 180, 220, 80 , 120, 160, 200
xlen1 = ($-pattrn1x_cor_3)
pattrn1y_cor_3 db 20, 20 , 20, 50, 50, 50, 50, 80, 80, 80 , 80, 80, 110, 110, 110, 110
ylen1 = ($-pattrn1y_cor_3) 

; ------------------------------ Pattrn 2 
x_cor_2 db 60 , 200, 100, 160, 130, 100, 160,  60, 200
xlen_2 = ($-x_cor_2)
y_cor_2 db 20, 20, 40, 40, 60, 80, 80, 100 , 100
ylen_2 = ($-y_cor_2) 

pattrn2_x_cor_2 db 60 , 200, 100, 160, 130, 100, 160,  60, 200
xlen_3 = ($-pattrn2_x_cor_2)
pattrn2_y_cor_2 db 20, 20, 40, 40, 60, 80, 80, 100 , 100
ylen_3 = ($-pattrn2_y_cor_2) 

store_x db 0
store_y db 0

theend db 0

len_x db 0                                                  ; length of x coordinate
len_y db 0                                                  ; length of y coordinate
temp dw 0
temp1 dw 0
countval dw 0
border db 0                                                 ; Enemy Movement
tocompare dw 0                                             ; to compare score with in level 2

; ----------------------------- Space Ship ------------------------------------
image   DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  5
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  6
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  7
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 10
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,07h,0Fh,0Fh,07h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 12
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 13
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h,00h,00h,01h,00h,00h,00h,00h,00h     ; 14
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,01h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h,00h,01h,09h,00h,00h,00h,00h,00h     ; 15
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,01h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h,00h,01h,09h,00h,00h,00h,00h,00h     ; 16
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,08h,01h,00h,08h,07h,0Fh,07h,07h,0Fh,07h,08h,00h,01h,08h,00h,00h,01h,00h,00h     ; 17
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,09h,00h,00h,0Fh,08h,00h,0Fh,0Fh,0Fh,09h,09h,0Fh,0Fh,0Fh,00h,08h,0Fh,00h,00h,09h,01h,00h     ; 18
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,09h,00h,00h,0Fh,08h,0Ch,0Fh,07h,09h,09h,09h,09h,07h,0Fh,0Ch,08h,0Fh,00h,00h,09h,01h,00h     ; 19
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,09h,00h,00h,07h,08h,08h,0Fh,07h,09h,09h,09h,09h,07h,0Fh,08h,08h,07h,00h,00h,09h,01h,00h     ; 20
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,00h,00h,0Ch,07h,0Fh,0Fh,07h,09h,07h,07h,09h,07h,0Fh,0Fh,07h,0Ch,00h,00h,0Fh,08h,00h     ; 21
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,00h,00h,07h,0Fh,0Fh,0Fh,0Fh,07h,0Fh,0Fh,07h,0Fh,0Fh,0Fh,0Fh,07h,00h,00h,0Fh,08h,00h     ; 22
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,0Fh,08h,00h     ; 23
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,09h,08h,0Fh,0Fh,0Fh,0Fh,08h,09h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,00h     ; 24
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,09h,08h,0Fh,0Fh,0Fh,0Fh,08h,09h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,00h     ; 25
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,09h,08h,0Fh,0Fh,0Fh,0Fh,08h,09h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,00h     ; 26
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,08h,09h,09h,08h,0Fh,0Fh,0Fh,0Fh,08h,09h,09h,08h,0Fh,0Fh,0Fh,0Fh,08h,00h     ; 27
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,07h,09h,09h,09h,09h,07h,0Fh,0Fh,07h,09h,09h,09h,09h,07h,0Fh,0Fh,0Fh,08h,00h     ; 28
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,07h,00h,01h,09h,09h,01h,00h,07h,07h,00h,01h,09h,09h,01h,00h,07h,0Fh,0Fh,08h,00h     ; 29
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,08h,08h,00h,00h,01h,01h,00h,00h,07h,07h,00h,00h,01h,01h,00h,00h,08h,08h,0Fh,08h,00h     ; 30
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,07h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h,07h,08h,00h     ; 31
temp_x db 0                                                     ; Temp x to store x coordinate 
temp_y db 0
s_x db 140                                   ; Spaceship x and y coordinate for 12H -> 25 for 13h 
s_y db 150

func_X db 0
func_y db 0

; ----------------------------------------- Bullete -------------------------
bulet   DB 00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  1
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  2
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  3
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  4
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  5
        DB 00h,00h,00h,04h,04h,00h,00h,00h     ;  6
        DB 00h,00h,00h,00h,00h,00h,00h,00h     ;  7



bx_ db 160                                   ; Bullette x and y coordinate
by_ db 150                                   ; Y axis = 150 - size of spaceship
bx1_ db 160                                  
by1_ db 150

mbx_ db 55                                   ;
mby_ db 175

monster_x db 20
monster_y db 160

life db 3

; ------------------------------------------ Enenmy ------------------------------ 32x16
enemy   DB 00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h     ;  5
        DB 00h,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h     ;  6
        DB 00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h     ;  7
        DB 00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h     ;  8
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;  9
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ; 10
        DB 0Ah,0Ah,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,0Ah,0Ah     ; 11
        DB 0Ah,0Ah,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,0Ah,0Ah     ; 12
        DB 0Ah,0Ah,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,0Ah,0Ah     ; 13
        DB 0Ah,0Ah,00h,00h,0Ah,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Ah,00h,00h,0Ah,0Ah     ; 14
        DB 0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,0Ah,0Ah     ; 15

enemy1  DB 00h,0h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch     ;  1
        DB 0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch     ;  2
        DB 0Ch,0Ch,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,0Ch,0Ch     ;  3
        DB 0Ch,0Ch,00h,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,00h,0Ch,0Ch     ;  4
        DB 0Ch,0Ch,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,0Ch,0Ch     ;  5
        DB 0Ch,0Ch,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,0Ch,0Ch     ;  6
        DB 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h     ;  7
        DB 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h     ;  8
        DB 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h     ;  9
        DB 00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h     ; 10
        DB 00h,00h,00h,00h,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h     ; 12
        DB 00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h     ; 13
        DB 00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h,00h,00h     ; 14
        DB 00h,00h,0Ch,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,00h,00h     ; 15

special DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h,00h,00h,00h,00h,00h     ;  2
            DB 00h,00h,00h,00h,00h,00h,00h,00h,03h,03h,00h,00h,00h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h,00h,00h,00h,00h,00h     ;  3
            DB 00h,00h,00h,00h,00h,03h,00h,00h,00h,03h,03h,03h,00h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,03h,03h,00h,00h,00h,00h,00h,00h,00h     ;  4
            DB 00h,00h,00h,00h,00h,03h,03h,03h,00h,01h,0Bh,0Bh,03h,00h,00h,00h,03h,03h,00h,00h,00h,00h,03h,0Bh,03h,00h,00h,00h,00h,00h,00h,00h     ;  5
            DB 00h,00h,00h,00h,00h,00h,03h,0Bh,03h,00h,03h,0Bh,0Bh,07h,03h,00h,03h,0Bh,00h,00h,00h,03h,0Bh,0Bh,03h,00h,00h,00h,00h,00h,00h,00h     ;  6
            DB 00h,00h,00h,00h,00h,00h,00h,03h,0Bh,03h,03h,0Bh,0Bh,0Bh,0Bh,03h,03h,0Bh,03h,00h,03h,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h,00h,00h,00h     ;  7
            DB 00h,00h,00h,00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,0Bh,0Bh,0Bh,0Bh,00h,00h,03h,03h,00h,00h,00h,00h     ;  8
            DB 00h,00h,00h,00h,00h,03h,03h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,03h,0Bh,03h,00h,00h,00h,00h     ;  9
            DB 00h,00h,00h,00h,00h,00h,03h,0Bh,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h     ; 10
            DB 00h,00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h,00h     ; 11
            DB 00h,00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,03h,00h,00h     ; 12
            DB 00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,03h,03h,00h,00h     ; 13
            DB 00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,07h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h     ; 14
            DB 00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,08h,07h,07h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h     ; 15
            DB 00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,03h,00h,08h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h     ; 16
            DB 00h,00h,00h,03h,03h,0Bh,0Bh,0Bh,03h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,00h,00h,00h,00h,00h     ; 17
            DB 00h,00h,00h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h,00h,00h     ; 18
            DB 00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h,00h     ; 19
            DB 00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,00h,00h,00h     ; 20
            DB 00h,00h,00h,00h,00h,03h,0Bh,0Bh,03h,03h,03h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,03h,03h,01h,00h,00h,00h     ; 21
            DB 00h,00h,00h,00h,00h,00h,01h,03h,03h,0Bh,0Bh,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,00h,00h,00h,00h,00h,00h,00h,00h     ; 22
            DB 00h,00h,00h,00h,00h,00h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,01h,00h,00h,00h,00h,00h,00h,00h,00h     ; 23
            DB 00h,00h,00h,00h,00h,00h,00h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 24
            DB 00h,00h,00h,00h,00h,00h,00h,00h,01h,03h,03h,07h,03h,03h,03h,0Bh,0Bh,0Bh,0Bh,03h,03h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 25
            DB 00h,00h,00h,00h,00h,00h,00h,00h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,03h,03h,03h,03h,03h,0Bh,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 26
            DB 00h,00h,00h,00h,00h,00h,00h,00h,03h,03h,03h,03h,03h,0Bh,0Bh,03h,03h,03h,03h,03h,0Bh,0Bh,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 27
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,03h,03h,03h,00h,03h,03h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 28
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 29
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 30
            DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 31

; Fir 32x32
fire    DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,0Eh,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,0Eh,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,09h,0Eh,0Eh,04h,04h,04h,04h,04h,0Eh,04h,00h,00h,00h,00h,00h,00h,00h,00h     ;  5
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,04h,0Eh,0Eh,04h,04h,04h,04h,04h,04h,04h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h     ;  6
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,0Eh,0Eh,0Eh,04h,04h,04h,0Eh,0Eh,0Eh,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h     ;  7
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,00h,00h,00h,00h,00h,00h,00h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,05h,00h,00h,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,0Eh,04h,0Eh,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,00h,00h,00h,00h,00h,00h,00h     ; 10
        DB 00h,00h,00h,00h,00h,00h,04h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,04h,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,00h,00h,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,00h,00h,00h,02h,00h,0Eh,04h,04h,0Eh,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,04h,00h,00h,00h     ; 12
        DB 00h,00h,00h,00h,00h,00h,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,00h,00h,00h     ; 13
        DB 00h,00h,0Eh,00h,04h,04h,04h,04h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,00h,00h,00h     ; 14
        DB 04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,0Eh,00h,00h     ; 15
        DB 04h,00h,00h,04h,04h,04h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h     ; 16
        DB 00h,00h,00h,04h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h     ; 17
        DB 04h,04h,04h,04h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,04h,00h,00h,00h     ; 18
        DB 00h,0Eh,04h,04h,04h,0Eh,04h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,0Eh,04h,00h,00h,00h     ; 19
        DB 00h,00h,00h,00h,00h,04h,04h,0Eh,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,0Eh,04h,00h,00h,00h,00h     ; 20
        DB 00h,00h,00h,00h,00h,05h,05h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,0Eh,04h,00h,00h,00h,00h     ; 21
        DB 00h,00h,00h,00h,00h,00h,00h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,00h,00h,00h,00h,00h     ; 22
        DB 00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,00h,04h,0Eh,04h,0Eh,0Eh,04h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,00h,00h,00h,00h,00h     ; 23
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,00h,00h,04h,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h     ; 24
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,00h,00h,04h,04h,0Eh,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h     ; 25
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,04h,04h,04h,04h,04h,04h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h     ; 26
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 27
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 28
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 29
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 30
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 31

monster  DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,04h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,04h,04h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h     ;  5
        DB 04h,00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,04h,04h,04h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h     ;  6
        DB 00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,00h     ;  7
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h     ; 10
        DB 00h,00h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h,04h,04h,02h,02h,02h,04h,00h,00h,04h,04h,00h,04h,04h,04h,04h,04h,00h,00h,00h,00h     ; 12
        DB 00h,00h,00h,04h,00h,00h,00h,00h,00h,04h,00h,04h,04h,02h,04h,04h,04h,02h,04h,00h,04h,00h,04h,02h,02h,02h,02h,02h,04h,00h,00h,00h     ; 13
        DB 00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,04h,04h,02h,04h,04h,04h,04h,04h,02h,04h,04h,04h,02h,04h,04h,04h,04h,04h,02h,00h,00h,00h     ; 14
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,02h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,02h,00h,00h     ; 15
        DB 00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,02h,02h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,02h,00h,00h     ; 16
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,02h,04h,04h,04h,04h,04h,02h,04h,04h,04h,02h,04h,04h,04h,04h,04h,02h,00h,00h,00h     ; 17
        DB 00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,042,04h,04h,04h,02h,04h,00h,04h,00h,04h,02h,02h,02h,02h,02h,04h,00h,00h,00h     ; 18
        DB 00h,00h,00h,04h,00h,00h,00h,00h,00h,04h,00h,00h,04h,04h,02h,02h,02h,04h,00h,00h,04h,04h,00h,04h,04h,04h,04h,04h,00h,00h,00h,00h     ; 19
        DB 00h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 20
        DB 00h,00h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h     ; 21
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h     ; 22
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h     ; 23
        DB 00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h     ; 24
        DB 00h,00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,04h,04h,00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,00h     ; 25
        DB 04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,04h,04h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h     ; 26
        DB 00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h     ; 27
        DB 00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 28
        DB 00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 29
        DB 00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 30
        DB 00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 31

m_bulet DB 04h,04h,04h,04h  
        DB 04h,04h,04h,04h 

turn db 0                                   ; 0 for green enemy and 1 for red enemy
num dw 0                                    ; Even => turn 0 else turn 1
; ----------------------------------------- Main Manu ---------------------------------
enterstring db "Enter pressed",13,10,'$'
msg db "Galaxy Attack: Alien Shooter$" 
msg1 db "Start Game$" 
msg2 db "Player Information$" 
msg3 db "Select Level$" 
msg4 db "Enter Level(1-3)$" 
score_description db "Score: $"
level_description db "Level: $"
life_description db "Life: $"
state_description db "You $"
score dw 0
one_score dw 0
two_score dw 0
three_score dw 0

score_check db 0                                ; To compare if it is equal to the lenght of enemy array then move to level 2
status db "Lose$"
win db "Win$"
lose db "Lose$"
game db 0                                   ; 0 for New Game and 1 for player Information
count db 0
game_status db 0                            ; 0 for lose and 1 for win

; ----------------------------------------- Assests ---------------------------
x_pos db 6



seconds db 0 
WAIT_TIME dw 0
input db "Enter your name: $"
str1 db 20 dup("$")

DIGITCOUNT1 db 0
rndm_num dw 0

; --------------------- File Handling ----------------------
fname db 'user.txt',0 
fhandle dw ? 

; ------------------------------------- Designing ------------------
congo db "Congratulation $"
completed_1 db "level 1 completed $"                        ; Congratulation on level 1 completion
completed_2 db "level 2 completed $" 
completed_3 db "level 3 completed $" 
level db 1
press db "Press Enter to continueue $" 



.code

printscore PROC

mov ax, one_score
add ax, two_score
add ax, three_score
mov score, ax

PRINT2:
	MOV DL,32   ;SPACE
	MOV AH,02H
	INT 21H
	MOV AX,0
	MOV AX,score;SAVES ELEMENT IN REGISTER
	MOV DIGITCOUNT1,0  ;COUNTS NO OF DIGITS IN AN ELEMENT
	
PUSH_IN:
	MOV DX,0
	MOV BX,10 
	DIV BX  ;  AX % 10
	PUSH DX   ;PUSHES DIGIT IN A STACK
	INC DIGITCOUNT1  ;COUNTS NO OF DIGITS IN A NUMBER
	CMP AX,0
	JNE PUSH_IN
			
POP_UP:
	CMP DIGITCOUNT1,0  ;STOPS WHEN EQUAL TO NO OF DIGITS
	JE EXT
	DEC DIGITCOUNT1
	POP DX    ;POP FROM STACK ONE BY ONE
	ADD DX,48
	MOV AH,02H
	INT 21H
	JMP POP_UP
		
EXT:
RET
printscore ENDP

sleeping_1 proc 
    pop bx
    TIMER_:
    MOV     AH, 00H
    INT     1AH
    CMP     DX,WAIT_TIME
    JB      TIMER_
    ADD     DX, 5        ;1-18, where smaller is faster and 18 is close to 1 second
    MOV     WAIT_TIME,DX

    push bx

sleeping_1 ENDP

main proc
    mov ax, @data
    mov ds, ax 
    ; Storing length of array for later use
    mov al, xlen
    mov len_x, al

    ; Screen Selection
    mov ah, 0
    mov al, 13h
    int 10h    

    ; cancel blinking and enable all 16 colors:
    mov ax, 1003h
    mov bx, 0
    int 10h

    ; Cursor position
    MOV AH, 02H
    ; MOV DH, 12;Row Number
    ; MOV DL, 23 ;Column Number
    MOV DH, 12;Row Number
    MOV DL, 5 ;Column Number
    INT 10H  

    mov dx, offset input
    mov ah, 09h
    int 21h
    ; Taking input
    mov si, offset str1
    inpt:
    mov ah,01
    int 21h
    cmp al,13
    je lr
    mov [si],al
    inc si
    sound 
    jmp inpt
    lr:


    ; mov dx, offset str1
    ; mov ah, 3Fh
    ; int 21h

; Creating file

    mov ah, 3ch
    lea dx, fname
    mov cl, 0
    int 21h
    jc error
    mov fhandle, ax

    ; Open File
    mov ah, 3dh
    lea dx, fname
    mov al, 2                           ; In read and write mode
    int 21h
    jc error
    mov fhandle, ax

    ; Writing to file
    mov ah, 40h
    mov bx, fhandle
    mov dx, offset str1
    mov cx, 37
    int 21h

    error:


    Running:

        ;Background
        set_background

    ; ------------------- Printing Game Name ---------------------
        ; Clearing Register
        mov AX, 0
        mov BX, 0
        mov CX, 0   
        ; Cursor position
        MOV AH, 02H
        ; MOV DH, 10;Row Number
        ; MOV DL, 23 ;Column Number
        MOV DH, 0;Row Number
        MOV DL, 5 ;Column Number
        INT 10H 

        ; Printing
        mov dx, offset msg
        mov ah, 09h
        int 21h

        ; mov dl,10 					; next line
        ; mov ah,02
        ; int 21h

    ; ------------------- Printing New Game ---------------------

        ; Cursor position
        MOV AH, 02H
        ; MOV DH, 12;Row Number
        ; MOV DL, 32 ;Column Number
        MOV DH, 12;Row Number
        MOV DL, 17 ;Column Number
        INT 10H 

        mov dx, offset msg1
        mov ah, 09h
        int 21h

    ; ------------------- Printing Player Information ---------------------

        ; Cursor position
        MOV AH, 02H
        ; MOV DH, 14;Row Number
        ; MOV DL, 28 ;Column Number
        MOV DH, 14;Row Number
        MOV DL, 12 ;Column Number
        INT 10H 

        mov dx, offset msg2
        mov ah, 09h
        int 21h

    ; ------------------- Printing Level Selction ---------------------

        ; Cursor position
        MOV AH, 02H
        ; MOV DH, 14;Row Number
        ; MOV DL, 28 ;Column Number
        MOV DH, 16;Row Number
        MOV DL, 15 ;Column Number
        INT 10H 

        mov dx, offset msg3
        mov ah, 09h
        int 21h

        printBox game
    
    ; -------------------- Input key -------------------------------------
        ; Get keystroke
        mov ah,0
        int 16h

        cmp ah,48h
        je up

        cmp ah,50h
        je down

        cmp ah,1Ch
        je entr

        cmp ah,1
        je Exit_screen
        jmp Running

        up:
            .if game == 1
                mov game, 0
            .endif
            .if game == 2
                mov game, 1
            .endif
            
            jmp Running
        down:
            .if game == 1
                mov game, 2
            .endif
            .if game == 0
                mov game, 1
            .endif
            jmp Running
        entr:
            ; mov dx,offset enterstring
            ; mov ah,9
            ; int 21h
            ; jmp exit
            .if game == 0
                run_game level
                jmp Running
            .endif
            
            .if game == 1
                jmp info
            .endif

            .if game == 2
                select_level game
                jmp Running
            .endif
            
            jmp Exit_screen

            ; mov bh, game
            ; cmp bh, 1
            ; je info
            ; run_game level
            ; jmp Exit_screen
            ; ; jmp exit
            info:
                ; mov dx,offset enterstring
                ; mov ah,9
                ; int 21h
                ; jmp exit
                player_info game
                jmp Running
                ; jmp exit

            ;     select_level

            jmp Exit

; -------------------------- End Screen ----------------------
    Exit_screen:
        ;Background
        MOV AH, 06h    ; Scroll up function
        XOR AL, AL     ; Clear entire screen
        XOR CX, CX     ; Upper left corner CH=row, CL=column
        MOV DX, 1D4FH  ; lower right corner DH=row, DL=column 
        MOV BH, 8h    ; Gray
        INT 10H

        ;player_info
        ; jmp Exit
        
; -------------------------- Printing State ----------------

        ; Clearing Register
        mov AX, 0
        mov BX, 0
        mov CX, 0 

        ; Cursor Position
        MOV AH, 02H
        MOV DH, 12;Row Number
        MOV DL, 10 ;Column Number                               ; For 12H replace 10 with 35
        INT 10H

        mov dx, offset state_description
        mov ah, 09h
        int 21h

        .if game_status == 1
                mov dx, offset win                ; 
                mov ah, 09h
                int 21h
        .endif

        .if game_status == 0
                mov dx, offset lose                ; 
                mov ah, 09h
                int 21h
        .endif

; -------------------------- Printing Score ----------------

        ; Clearing Register
        mov AX, 0
        mov BX, 0
        mov CX, 0 

        ; Cursor Position
        MOV AH, 02H
        MOV DH, 14;Row Number
        MOV DL, 10 ;Column Number                               ; For 12H replace 10 with 35
        INT 10H

        mov dx, offset score_description
        mov ah, 09h
        int 21h

        call printscore

        ; mov dx, score                ; Print value of score
        ; add dx, 48
        ; mov ah, 02H
        ; int 21h

; -------------------------- Printing Level ----------------

        ; Clearing Register
        mov AX, 0
        mov BX, 0
        mov CX, 0 

        ; Cursor Position
        MOV AH, 02H
        MOV DH, 16;Row Number
        MOV DL, 10 ;Column Number                                       ; For 12H replace 10 with 35
        INT 10H

        mov dx, offset level_description
        mov ah, 09h
        int 21h

        mov dl, level                ; Print value of level
        add dl, 48
        mov ah,02h
        int 21h


    Exit:
    ; End    
    mov ah, 4ch
    int 21h

main endp
end main