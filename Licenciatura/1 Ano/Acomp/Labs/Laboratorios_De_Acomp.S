
                                                                      ########################################
                                                                      # Laboratório 1 -- Acomp -- LEEC-21/22 #
                                                                      ########################################


#################################################################################################################################################################################

Exercício 1:

    .data

    .text

    #y = a*b + c

        li x5, 2
        li x6, 3
        li x7, 4

        mul x6,x5,x6
        add x7,x6,x7
        mv x10,x7


###################################################################################################################################################################################

Ecercício 2:

    a)

        # Declaracao de variaveis
        .data
            a: .word 3
            b: .word 4
            c: .word 5
            d: .word -1
            y: .zero 4

        .text
            #y = a*b / (c+d)

            # a*b
                lw x5, a
                lw x6, b
                mul x6,x5,x6

            # c+d
                lw x5, c
                lw x7, d
                add x7,x5,x7

            # a*b / (c+d)
                div x7,x6,x7
                la x6, y
                sw x7, 0(x6)

    b)
    
         &#39;int&#39;

    c) Não podia porque ‘.zero’ 1 indica que é declarado um vetor de 1 byte inicializados a 0, logo, uma vez que estamos a trabalhar com números em hexadecimal, 
    por número, é necessário termos sempre, pelo menos, 4 bytes disponíveis.

############################################################################################################################################################################

Exercício 3:

    .data
        a: .word 3
        b: .word 4
        c: .word 5
        d: .word -1
        y: .zero 4
        z: .zero 4

    .text
        #y = (a/b + d)*(c+a)

            lw x5, a
            lw x6, b
            div x6, x5, x6 # x6 = a/b

            lw x7, d
            add x6, x6, x7 # x6 = a/b + d

            lw x7, c
            add x7, x7, x5 # x7 = c+a

            mul x6, x6, x7 # x6 = (a/b + d)*(c+a)

            la x7, y
            sw x6, 0(x7) #y = x6

         #z = y^2

            mul x6, x6, x6 #x6 = y^2

            la x7, z
            sw x6, 0(x7) #z = x6

                                                                      ########################################
                                                                      # Laboratório 2 -- Acomp -- LEEC 21/22 #
                                                                      ########################################

Exercicio 1:

##########################################################################################################################################################################

Exercicio 2:

.data
    A:    .word 4, -1, 5, 3, -6, -6
    N:    .word 6
    i:    .zero 4
    tmp:  .zero 4
    n_trocas:	.zero 4

.text
    la    x5, n_trocas
    la    x6, i
    lw    x7, N
    la    x8, A
    li    x5, 1
    li    x6, 1

loop1:
    beq   x5, x0, end      #if(n_trocas != 0)   
    li    x5, 0            #n_trocas = 0  
    
loop2: 
    lw    x11, 0(x8)       #A[i-1] 
    lw    x12, 4(x8)       #A[i]   
    addi  x8, x8, 4
    
    beq   x6, x7, loop1    #if(i < N)
    addi  x6, x6, 1        #i ++
    
    bge   x12, x11, loop2  #if(A[i] < A[i-1]) 
    la    x13, tmp
    mv    x13, x12         #tmp = A[i] 
    mv    x12, x11         #A[i] = A[i-1] 
    mv    x11, x13         #A[i-1] = tmp
    
    addi  x5, x5, 1        #n_trocas ++
     
    j     loop2
    
end:
    li    x17, 10
    ecall
##########################################################################################################################################################################

Exercicio 3:

.data
A:    .word 1, 2, 3, 4
B:    .word 11, 12, 13, 14
C:    .zero 16
N:    .word 4
#i:    .zero 4
#j:    .zero 4
#sum:  .zero 4

.text
    #la    x5, i
    li    x5, -1             #i = -1
    lw    x6, N
    #la    x7, sum
    #la    x8, j
    li    x9, 4
    la    x10, A
    la    x11, B
    la    x12, C
    
loop1:
    beq   x5, x6, end        #i < N
    li    x7, 0              #sum = 0
    
    addi  x5, x5, 1          #i++
    
    addi  x8, x6, -1         #j = N - 1 
loop2:
    blt    x8, x5, for       #j >= i
    
    la    x31, B 
    mul   x28, x8, x9         #j * 4
    add   x31, x31, x28   
       
    lw    x14, 0(x31)        #B[j]
    
    add    x7, x7, x14       #sum = sum + B[j]
    addi   x8, x8, -1        # j--
    
    j    loop2
    
for:    
    lw    x13, 0(x10)        #A[i]
    lw    x14, 0(x11)        #B[i]
    
    lw     x15, 0(x12)       #C[i]
    sub    x15, x14, x13     #C[i] = B[i] - A[i]
    mul    x15, x15, x7      #C[i] = C[i] * sum
    
    sw     x15, 0(x12)
    
    addi  x13, x13, 4
    addi  x14, x14, 4
    addi  x12, x12, 4
    
    j      loop1
end:
    li    x17, 10
    ecall
                                                                      ########################################
                                                                      # Laboratório 3 -- Acomp -- LEEC 21/22 #
                                                                      ########################################

Exercício 1A:

##########################################################################################################################################################################

Ecercício 1B:

##########################################################################################################################################################################

Exercício 2:

.data
vx:     .word -1, 3, 7, -2, 4, 1, 5, 9, 1, -5
vy:     .word 6, -3, 2, -2,-3, 2, 1, 0, 4, -2

.text

    jal    find_nearest
    
end:

    li     x17, 10 
    ecall
     
find_nearest:

    li     x5, 0             #k
    li     x6, 10            #N
    li     x7, 0             #index
    li     x10, 4            #Multiplicador 
    li     x23, 0            #d   
    
    jal    Distancia_P0       
    
for:

    addi   x5, x5, 1         #K++
    bge    x5, x6, end       #Se x5>=x6 então não entra
    blt    x30, x0, end      #Se dmin(x30)<=0 então não entra
    
    jal    Distancia_min
    
if:
    bge    x14, x30, for     #Se a distancia calculado nao for minima entao nao entra no if

    mv     x30, x14          #Guarda o valor da distanica minima
    mv     x31, x5           #Guarda o valor do index
    
    j      for               #Volta a entrar no for
      
Distancia_P0:
    la     x12, vx
    la     x13, vy
    lw     x14, 0(x12)       #vx[0]
    lw     x15, 0(x13)       #vy[0]
    li     x16, 3            #vxref
    li     x17, 4            #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14     #vx*vx
    mul    x15, x15, x15     #vy*vy
    
    add    x16, x14, x15     #vx*vx+vy*vy
    
    mv     x30, x16
    
    ret
    
Distancia_min:
    
    mul    x11, x10, x5      # Mutiplica o valor do K por 4.
    la     x12, vx           # Carrega o enderço do vetor vx.
    la     x13, vy           # Carrega o enderço do vetor vy.
    
    add    x12, x12, x11     #vx[]+4k
    add    x13, x13, x11     #vy[]+4k
    lw     x14, 0(x12)       #vx[k]
    lw     x15, 0(x13)       #vy[k]
    
    li     x16, 3            #vxref
    li     x17, 4            #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14     #vx*vx
    mul    x15, x15, x15     #vy*vy
    
    add    x14, x14, x15     #vx*vx+vy*vy
    
    ret

  
#########################################################################################################################################################################

Ecercício 3A:

.data
    A:        .word 4, 5, 6, 7
    Return:   .word 0, 0  
.text
    
    la    x5, A
    
    lw    x10, 0(x5)
    lw    x11, 4(x5)
    lw    x12, 8(x5)
    lw    x13, 12(x5)
    
    la    x14, Return
    lw    x15, 0(x12)
    lw    x16, 4(x12)
    
    jal   stuff
    
    sw    x10, 0(x12)
    sw    x11, 4(x12)
    
    li     x17, 10 
    ecall
    
stuff:
    
    mul    x17, x10, x11    #x = a * b
    add    x11, x10, x12   #y = a + c
    add    x11, x11, x13  #y += d
    
    add    x10, x17, x11  #x + y
    sub    x11, x11, x17  #y - x
    
    ret

##############################################################################################################################################################################

Exercicio 3B:























.data
vx:     .word -1, 3, 7, -2, 4, 1, 5, 9, 1, -5
vy:     .word 6, -3, 2, -2,-3, 2, 1, 0, 4, -2

.text

    jal    find_nearest
    
end:
    li     x17, 10 
    ecall
    
    
    
find_nearest:
    li     x5, 0             #k
    li     x6, 10            #N
    li     x7, 0             #index
    li     x10, 4            #Multiplicador 
    li     x23, 0            #d   
    
    jal    Distancia_P0       
    

for:

    addi   x5, x5, 1         #K++
    bge    x5, x6, end       #Se x5>=x6 então não entra
    blt    x30, x0, end      #Se dmin(x30)<=0 então não entra
    
    jal    Distancia_min
    
if:
    bge    x14, x30, for     #Se a distancia calculado nao for minima entao nao entra no if

    mv     x30, x14          #Guarda o valor da distanica minima
    mv     x31, x5           #Guarda o valor do index
    
    j      for               #Volta a entrar no for
    
    
Distancia_P0:
    la     x12, vx
    la     x13, vy
    lw     x14, 0(x12)       #vx[0]
    lw     x15, 0(x13)       #vy[0]
    li     x16, 3            #vxref
    li     x17, 4            #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14     #vx*vx
    mul    x15, x15, x15     #vy*vy
    
    add    x16, x14, x15     #vx*vx+vy*vy
    
    mv     x30, x16
    
    ret
    
Distancia_min:
    
    mul    x11, x10, x5      # Mutiplica o valor do K por 4.
    la     x12, vx           # Carrega o enderço do vetor vx.
    la     x13, vy           # Carrega o enderço do vetor vy.
    
    add    x12, x12, x11     #vx[]+4k
    add    x13, x13, x11     #vy[]+4k
    lw     x14, 0(x12)       #vx[k]
    lw     x15, 0(x13)       #vy[k]
    
    li     x16, 3            #vxref
    li     x17, 4            #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14     #vx*vx
    mul    x15, x15, x15     #vy*vy
    
    add    x14, x14, x15     #vx*vx+vy*vy
    
    ret
  





























































































































my na yef
