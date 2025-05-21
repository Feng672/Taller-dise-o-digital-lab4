.text
.global _start

_start:
    mov r0, #5           // X = 5 (cambia este valor para probar)
    mov r1, #1           // result = 1
    mov r2, #1           // i = 1

loop:
    cmp r2, r0           // ¿i <= X?
    bgt end              // Si no, termina

    mul r1, r1, r2       // result *= i
    add r2, r2, #1       // i++
    b loop

end:
    // R1 contiene el factorial de X (ej: 5! = 120)
    b end