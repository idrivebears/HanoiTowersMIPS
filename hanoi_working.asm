#Solucionador de torres de hanoi por medio de recursion
#Arquitectura de Computadoras
#ITESO
#Giovanni Zuno  |   Alejandro Walls

# void towerOfHanoi(int n, char from, char to, char aux)
# a0 = n
# a1 = from
# a2 = aux
# a3 = to

# s1 = constante 1
# s2 = variable auxiliar
	
 start:		#Parametros para funcion
 		addi $a1, $zero, 0		#inicializar Torre1	
 		addi $a2, $zero, 32		#inicializar Torre2
 		addi $a3, $zero, 64		#inicializar torre3
 
 		addi $sp, $zero, -4		# Inicializacion del stack pointer
		addi $a0, $zero, 8		# a0 = N
		add  $t1, $zero, $a0		# t1 = a0
		addi $s1, $zero, 1		# s1 = 1
		addi $t1, $t1, 1		# t1++
		addi $s3, $zero, 0

initTower_1:
		addi $t1, $t1, -1		# t1--
		addi $sp, $sp, 4		# stackPointer+=4
		sw  $t1, 0($sp)			# push(t1)
		#add $a1, $zero, $sp		# mantener apuntador a torre 1
		beq $t1, $s1, reset_sp		# if(t1 == 1), ir a hannoi;
		j initTower_1

 reset_sp:	addi $sp, $zero, 96		#estado inicial del stack pointer
 
 		
 
 hanoi_izq:	#Recursivamente guardar valores en stack, haciendo switch
 		bne $a0,$zero, else
 loop:		jr $ra
 		j loop
 		
 else:		sw $ra, 0($sp)			#cargar ra al stack
 		sw $a0, 4($sp)			#cargar a0 a stack
 		sw $a1, 8($sp)			#cargar a1 al stack	
 		sw $a2, 12($sp)			#cargar a2 al stack
 		sw $a3, 16($sp)			#cargar a3 al stack
 		addi $sp, $sp, 20		#añadir 20 al stack pointer
 		addi $a0, $a0, -1 		#Disminuir n
 		#a1 = a1
 		#a2 <> a3
 		addi $s2, $zero, 0		#borrar datos de t1
 		add  $s2, $a3, $zero		#guardar valor de a3 en t1
 		addi $a3, $zero, 0		#borrar datos de a3
 		add  $a3, $a2, $zero		#asignar a2 a a3
 		addi $a2, $zero, 0		#borrar datos de a2
 		add  $a2, $s2, $zero		#asignar a3 a a2
 recur:		jal hanoi_izq

 
 load_data:	lw $a3, -4($sp)			#cargar a3 del stack
 		lw $a2, -8($sp)			#cargar a2 del stack	
 		lw $a1, -12($sp)		#cargar a1 del stack
 		lw $a0, -16($sp)		#cargar a0 del stack
 		lw $ra, -20($sp)		#cargar ra del stack
 		
 		addi $sp, $sp, -20		#mover apuntador del stack
 
 move_disc:	add $t6, $a1, 28
 		lw $t7, ($t6) 
 		beq $t7, $zero, find_n
	 	j cont_mov
 find_n:	addi $t6, $t6, -4
 		lw $t7, ($t6)
 		beq $t7, $zero, find_n
 		
 		
 cont_mov:	sw $zero, ($t6)
 		add $t6, $a3, 0			#iterate and store values
 		lw $t5, ($t6)			#load value of t6 into t5
 		bne $t5, $zero, find_top	#check if its 0, if not keep adding	
 		j cont_mov2			
find_top:	add $t6, $t6, 4			#move iterator
		lw $t5, ($t6)			#store value of t6 into t5
		bne $t5, $zero, find_top	#check if its 0, if not keep adding
cont_mov2:	 		
 		sw $t7, ($t6)			#mover disco de origen a destino
 		
 		#hanoi_der
 		#a1 <> a2
 		#a3 = a3
 		addi $s2, $zero, 0		#borrar datos de t1
 		add  $s2, $a1, $zero		#guardar valor de a3 en t1
 		addi $a1, $zero, 0		#borrar datos de a3
 		add  $a1, $a2, $zero		#asignar a2 a a1
 		addi $a2, $zero, 0		#borrar datos de a2
 		add  $a2, $s2, $zero		#asignar a2 a a1
 		addi $a0, $a0, -1
 		addi $s3, $zero, 0		#reset flag
 		
 		j recur
 		