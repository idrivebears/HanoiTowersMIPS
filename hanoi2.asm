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
 
 hanoi:		