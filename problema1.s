.data
array: .word 5, 10, 9, 8, 7, 2, 1, 3, 4, 6 
y: .word 5

.text
.global _start

_start:
	ldr r0, =array
	ldr r1, =y
	ldr r1, [r1]
	mov r2, #0
	mov r3, #10

loop:
	cmp r2, r3
	bge end
	
	ldr r4, [r0, r2, lsl #2]
	cmp r4, r1
	blt else
	
	mul r4, r4, r1
	b store
	
else:	
	add r4, r4, r1

store:
	str r4, [r0, r2, lsl #2]
	add r2, r2, #1
	b loop

end:
	B end