.data
array: .word 5, 10, 9, 8, 7, 2, 1, 3, 4, 6  // Arreglo de 10 elementos
y: .word 5 // Constante y = 5

.text
.global _start

_start:
	ldr r0, =array // r0 = dirección base del arreglo
	ldr r1, =y // r1 = dirección de y
	ldr r1, [r1] // r1 = valor de y
	mov r2, #0 // r2 = índice (i = 0)
	mov r3, #10 // r3 = longitud del arreglo

loop:
	cmp r2, r3 // Compara i con 10
	bge end // Si no son iguales se termina
	
	ldr r4, [r0, r2, lsl #2] // r4 = array[i] (offset = i x 4)
	cmp r4, r1 // Compara array[i] con y
	blt else // Si array[i] menor que y, salta a else
	
	mul r4, r4, r1 // array[i] *= y
	b store // Salta a almacenar
	
else:	
	add r4, r4, r1 // array[i] += y

store:
	str r4, [r0, r2, lsl #2] // Almacena el resultado en array[i]
	add r2, r2, #1 // i++
	b loop // Repite el loop

end:
	B end // Fin