.text
start:
.globl start
  call GCD_main
finish:
  mv a3, a0
  li a0, 17
  ecall
.text
GCD_main:
  la a0, array
  lw a3, array_length
  addi sp, sp, -16  # Убираем зацикливание
  sw ra, 12(sp)
  call GCD_sub      # Вызов подпрограммы GCD_sub
  lw ra, 12(sp)
  addi sp, sp, 16   # Убираем зацикливание
  li a0, 24
  ecall
  ret
.rodata
array_length:
 .word 5
.rodata
array:
 .word 35,70,105,140,200
 
.text
GCD_sub:
.globl GCD_sub
  li a2, 1                # а2 = 1
  li gp, 1                # gp = 1
  bgeu a2, a3, loop_exit  # если 1 элемент -> выход
  addi a4, a0, 4          # а4 = а0 + 4 <адрес 1 элемента>
  lw t0, 0(a0)            # t0 = array[0]
  lw t1, 0(a4)            # t1 = array[1]
ge:
  beq t0, t1, plus        # если t1==t0 -> plus
  bgeu t0, t1, loop1      # если t0>=t1 -> loop1
  bgeu t1, t0  loop2      # если t0<=t1 -> loop2
loop1:
  sub t2, t0, t1          # t2 = t0 - t1
  addi t0, t2, 0          # t0 = t2
  jal zero, ge
loop2:
  sub t2, t1, t0          # t2 = t1 - t0
  addi t1, t2, 0          # t1 = t2
  jal zero, ge
plus:
  addi a2, a2, 1          # a2++
  bgeu a2, a3, loop_exit  # если a2>=a3 -> выход
  beq t0, gp, loop_exit   # если НОД=1 -> выход
  addi a4, a4, 4          # a4 +=4 <адрес нового эелемента>
  lw t1, 0(a4)            # t1 = <новый элемент>
  jal zero, ge
loop_exit:
  addi a1, t0, 0          # a1 -> ответ     
  ret