#Solucionador de torres de hanoi por medio de recursion
#Arquitectura de Computadoras
#ITESO
#Giovanni Zuno  |   Alejandro Walls

# void towerOfHanoi(int n, char from, char to, char aux)
# a0 = n
# a1 = from
# a2 = to
# a3 = aux

# s1 = constante 1
# s2 = variable auxiliar
	
 start:		#Parametros para funcion
 		addi $a1, $zero, 0		#inicializar Torre1	
 		addi $a2, $zero, 32		#inicializar Torre2
 		addi $a3, $zero, 64		#inicializar torre3
 
 		addi $sp, $zero, -4		# Inicializacion del stack pointer
		addi $a0, $zero, 4		# a0 = N
		add  $t1, $zero, $a0		# t1 = a0
		addi $s1, $zero, 1		# s1 = 1
		addi $t1, $t1, 1		# t1++

initTower_1:
		addi $t1, $t1, -1		# t1--
		addi $sp, $sp, 4		# stackPointer+=4
		sw  $t1, 0($sp)			# push(t1)
		add $a1, $zero, $sp		# mantener apuntador a torre 1
		beq $t1, $s1, reset_sp		# if(t1 == 1), ir a hannoi;
		j initTower_1

 reset_sp:	addi $sp, $zero, 96		#estado inicial del stack pointer
 
 hanoi:		bne $a0, $zero, else 		#checar si estamos en condicion terminal
 		
 		#movedisc()
 		lw $a3, -4($sp)			#cargar a3 del stack
 		lw $a2, -8($sp)			#cargar a2 del stack	
 		lw $a1, -12($sp)		#cargar a1 del stack
 		lw $a0, -16($sp)		#cargar a0 del stack
 		lw $ra, -20($sp)		#cargar ra del stack
 		
 		addi $sp, $sp, -20		#mover apuntador del stack
 		
 		lw $t9, 0($a1)
 		sw $zero, 0($a1)
 		sw $t9, 0($a2)			#mover disco de origen a destino	
 		addi $a2, $a2, 4		#añadir 4 a destino
 		addi $a1, $a1, -4		#quitar 4 de origen
 		jr $ra				#regresar a last call
 	
 else:		#addi $sp, $zero, 96		#reset stack a 96 (torres en 0 - 64)
 		sw $ra, 0($sp)			#cargar ra al stack
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
 		jal hanoi			#llamar a janoi con datos
 		
 		#a2 = a2
 		#a1 <> a3
 		addi $s2, $zero, 0		#borrar datos de t1*
 		add  $s2, $a3, $zero		#guardar valor de a3 en t1
 		addi $a3, $zero, 0		#borrar datos de a3
 		add  $a3, $a1, $zero		#asignar a1 a a3
 		addi $a1, $zero, 0		#borrar datos de a1
 		add  $a1, $s2, $zero		#asignar a3 a a1
 		j  hanoi
 	
 	
 	
 	
 			
 					
 	
 	
