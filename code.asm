add $s1, $zero, $zero #i
addi $s6, $zero, 268500992 #data için ayrýlan memorynin baþlagýç adresinin deximal hali 
addi $s5, $zero, 12 #12 den küçük mü diye kontrol etmek için
add  $s2, $zero, $zero # j 
addi $s4, $zero, 14 #14 den küçük mü diye kontrol etmek için
addi $t8, $zero, 1 
add $t7, $zero, $zero
sw $t8, 0($s6)# numbers[0] = 1
sw $t8, 4($s6)# numbers[1] = 1
addi $s3, $zero, 2 # k=2

ini:
slt $t5 $s3, $s4 # if k <14 then t5 = 1
beq $t5, $zero, while # t5 0 a eþitse yani k >= 14 ise while geç

sll $t6, $s3, 2 # k*4
add $t6, $t6, $s6 #base of numbers a 4*k yý ekle oradki elemana ulaþma yani
sw $t7, 0($t6) # numbers arayindeki diðer elemanlarý 0 yapma
addi $s3, $s3, 1 # k++
j ini 

while: 
slt $s7, $s1, $s5 # if i <12 then s7 = 1
beq $s7, $zero, loop # s7 0 a eþitse yani i >= 12 ise loopa geç

sll $t1, $s1, 2  # i*4
add $t9, $t1, $s6 #base of numbers a 4*i yý ekle oradki elemana ulaþma yani
lw $t0, 0($t9) # numbers[i] yi t0 a yükle

addi $t9, $t9,4 #number [i] nin memory adresini 4 arttýrarak numbers [i+1] i elde ettik. 
lw $t2, 0($t9)# numbers[i+1] i t2 ye yükle

addi $t9, $t9,4 #number [i+1] in memory adresini 4 arttýrarak numbers [i+2] yi elde ettik. 
add $t4, $t0, $t2 #number [i] ve number [i+1] i toplayýp t4 e yükledik
sw $t4, 0($t9) # t4 ün içeriðini t9 yani  numbers [i+2] ye attýk.
addi $s1, $s1, 1 #i++
j while

loop:
slt $t9, $s2, $s4 # if j <14 then t9 = 1
beq $t9, $zero, exit  # t9 0 a eþitse yani j >= 14 ise exite geç

sll $t5, $s2, 2 # j*4
add $t9, $t5, $s6 #base of numbers a 4*j yý ekle oradki elemana ulaþma yani numbers[j]
lw $t6, 0($t9) #numbers[j] i t6 ya yükle
li $v0,1# yazdýma iþlemleri için 
add $a0,$t6,$zero # yazdýma iþlemleri için 
syscall # yazdýma iþlemleri için 
addi $s2, $s2, 1 #j++
j loop
exit:
