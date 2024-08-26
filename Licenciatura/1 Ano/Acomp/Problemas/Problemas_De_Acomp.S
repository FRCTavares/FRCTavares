
                                                                 Aula de Problemas 3 - LEEC 21/22 - Acomp

1)

    addi    sp, sp, -4
    sw      x10, 0(sp)
    mv      x10, x11
    lw      x11, 0(sp)
    addi    sp, sp, 4

2)
    a)
    
        addi    sp, sp, -12     #Reserva espaco para argumentos de subtrai.
        li      x10, 4          #Coloca na pilha os argumentos pela ordem no cabecalho da funcao.
        li      x11, 7
        sw      x10, 8(sp)
        sw      x11, 4(sp)
        sw      x11, 0(sp)
        jal     ra, soma3       #Chama funcao soma3.

        li      x10, 3          #Acrescenta a pilha o 3.
        addi    sp, sp, -4
        sw      x10, 0(sp)
        jal     ra, subtrai     #Chama a funcao subtrai.
        
        lw      x10, 0(sp)      #Le o resultado.
        addi    sp, sp, 4       #Limpa a pilha.

subtrai:#Salvaguarda de contexto
        addi    sp, sp, -8  
        sw      x10, 4(sp)
        sw      x11, 0(sp)
        #Ler operandos de entrada
        lw      x10, 12(sp) #a
        lw      x11, 8(sp)  #b
        #Calcula resultado
        sub     x10, x10, x11
        #Coloca resultado na pilha
        sw      x10, 12(sp) #Resultado
        #Repoe contexto
        lw      x10, 4(sp)
        lw      x11, 0(sp)
        addi    sp, sp, 12  #Sai
        jalr    x0, x1, 0   #Return      

soma3:  #Salvaguarda contexto
        addi    sp, sp, -24
        sw      x5, 20(sp)
        sw      x6, 16(sp)
        sw      x7, 12(sp)
        sw      x10, 8(sp)
        sw      x11, 4(sp)
        sw      x1, 0(sp)
        #Ler os operandos
        lw      x5, 32(sp)
        lw      x6, 28(sp)
        lw      x7, 24(sp)
        #Fazer as contas
        mv      x10, x5
        mv      x11, x6
        jal     x1, soma

        mv      x11, x7
        jal     x1, soma
        #Guarda o resultado
        sw      x10, 32(sp)
        #Repor o contexto
        lw      x5, 20(sp)
        lw      x6, 16(sp)
        lw      x7, 12(sp)
        lw      x10, 8(sp)
        lw      x11, 4(sp)
        lw      x1, 0(sp)
        #Corrigir o sp
        addi    sp, sp, 32
        #return
        ret

soma3:  #SIMPLIFICADO
        addi    sp, sp, -12
        sw      x1, 8(sp)
        sw      x10, 4(sp)
        sw      x11, 0(sp)

        lw      x10, (sp)   #a
        lw      x11, (sp)   #b
        jal     ra, soma    #x10=a+b
        sw      x10, (sp)
        lw      x11, 0(sp)  
        lw      x10, 4(sp)
        lw      x1, 8(sp)
        addi    sp, sp, 20
        ret
soma:   
        add     x10, x10, x11
        ret




4)

fatorial:
        addi    sp, sp, -12
        sw      x1, 8(sp)
        sw      x10, 4(sp)
        sw      x11, 0(sp)

        addi    x11, x0, 1
        lw      x10, 12(sp)       # x10=i
        beq     x10, x0, IF

ELSE:   addi    sp, sp, -4
        addi    x11, x10, -1
        sw      x11, 0(sp)
        jal     ra, fatorial    # fatorial(i-1)
        
        lw      x11, 0(sp)
        mul     x11, x10, x11   # *i

IF:     sw      x11, (sp) 
        lw      x11, 0(sp)
        lw      x10, 4(sp)
        lw      x1, 8(sp)
        addi    sp, sp, 12 
        ret


    


        

    