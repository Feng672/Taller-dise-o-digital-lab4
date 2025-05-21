.text
.global _start

_start:
    ldr r0, =0x1000      // R0 = dirección de la tecla
    ldr r1, =0x2000      // R1 = dirección del contador

loop:
    ldr r2, [r0]         // R2 = valor de la tecla
    ldr r3, [r1]         // R3 = valor actual del contador

    // Comparar con flecha arriba (0xE048)
    ldr r4, =0xE048
    cmp r2, r4
    beq incrementar

    // Comparar con flecha abajo (0xE050)
    ldr r4, =0xE050
    cmp r2, r4
    beq decrementar

    b loop               // Si no es válida, repite

incrementar:
    add r3, r3, #1       // contador++
    str r3, [r1]
    b loop

decrementar:
    sub r3, r3, #1       // contador--
    str r3, [r1]
    b loop