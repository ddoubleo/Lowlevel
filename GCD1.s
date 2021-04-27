.text
start:
.globl start
  lw a4, array_length     # а4 = <длина массива>
  la a5, array            # а5 = <адрес 0-го элемента>
  li a3, 1                # а3 = 1
  li a7, 1                # а7 = 1
  bgeu a3, a4, loop_exit  # Если 1 элемент -> выход
  addi a6, a5, 4          # а6 = а5 + 4 <адрес 1 элемента>
  lw t0, 0(a5)            # t0 = array[0]
  lw t1, 0(a6)            # t1 = array[1]
ge:
  beq t0, t1, plus        # Если t0 = t1 -> plus
  bgeu t0, t1, loop1      # Если t0 >= t1 -> loop1
  bgeu t1, t0  loop2      # Если t0 <= t1 -> loop2
loop1:
  sub t2, t0, t1          # t2 = t0 - t1 
  addi t0, t2, 0          # t0 = t2
  jal zero, ge
loop2:
  sub t2, t1, t0          # t2 = t1 - t0
  addi t1, t2, 0          # t1 = t2
  jal zero, ge
plus:
  addi a3, a3, 1          # a3++
  bgeu a3, a4, loop_exit  # Если а3 >= а4 -> выход
  beq t0, a7, loop_exit   # выход, если НОД = 1
  addi a6, a6, 4          # а6 += 4 <адрес нового элемента>
  lw t1, 0(a6)            # t1 = <новый элемент>
  jal zero, ge
loop_exit:
  addi a1, t0, 0          # записываем ответ в а1
  li a0, 24               # 
  ecall                   # выводим а1
  li a0,10                # 
  ecall                   # конец работы
.rodata
array_length:
  .word 5
.rodata
array:
  .word 35, 70, 105, 140, 42