add $s1, $zero, $zero #i
addi $s6, $zero, 268500992 #data i�in ayr�lan memorynin ba�lag�� adresinin deximal hali 
addi $s5, $zero, 12 #12 den k���k m� diye kontrol etmek i�in
add  $s2, $zero, $zero # j 
addi $s4, $zero, 14 #14 den k���k m� diye kontrol etmek i�in
addi $t8, $zero, 1 
add $t7, $zero, $zero
sw $t8, 0($s6)# numbers[0] = 1
sw $t8, 4($s6)# numbers[1] = 1
addi $s3, $zero, 2 # k=2

ini:
slt $t5 $s3, $s4 # if k <14 then t5 = 1
beq $t5, $zero, while # t5 0 a e�itse yani k >= 14 ise while ge�

sll $t6, $s3, 2 # k*4
add $t6, $t6, $s6 #base of numbers a 4*k y� ekle oradki elemana ula�ma yani
sw $t7, 0($t6) # numbers arayindeki di�er elemanlar� 0 yapma
addi $s3, $s3, 1 # k++
j ini 

while: 
slt $s7, $s1, $s5 # if i <12 then s7 = 1
beq $s7, $zero, loop # s7 0 a e�itse yani i >= 12 ise loopa ge�

sll $t1, $s1, 2  # i*4
add $t9, $t1, $s6 #base of numbers a 4*i y� ekle oradki elemana ula�ma yani
lw $t0, 0($t9) # numbers[i] yi t0 a y�kle

addi $t9, $t9,4 #number [i] nin memory adresini 4 artt�rarak numbers [i+1] i elde ettik. 
lw $t2, 0($t9)# numbers[i+1] i t2 ye y�kle

addi $t9, $t9,4 #number [i+1] in memory adresini 4 artt�rarak numbers [i+2] yi elde ettik. 
add $t4, $t0, $t2 #number [i] ve number [i+1] i toplay�p t4 e y�kledik
sw $t4, 0($t9) # t4 �n i�eri�ini t9 yani  numbers [i+2] ye att�k.
addi $s1, $s1, 1 #i++
j while

loop:
slt $t9, $s2, $s4 # if j <14 then t9 = 1
beq $t9, $zero, exit  # t9 0 a e�itse yani j >= 14 ise exite ge�

sll $t5, $s2, 2 # j*4
add $t9, $t5, $s6 #base of numbers a 4*j y� ekle oradki elemana ula�ma yani numbers[j]
lw $t6, 0($t9) #numbers[j] i t6 ya y�kle
li $v0,1# yazd�ma i�lemleri i�in 
add $a0,$t6,$zero # yazd�ma i�lemleri i�in 
syscall # yazd�ma i�lemleri i�in 
addi $s2, $s2, 1 #j++
j loop
exit:
