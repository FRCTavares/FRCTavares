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
  


