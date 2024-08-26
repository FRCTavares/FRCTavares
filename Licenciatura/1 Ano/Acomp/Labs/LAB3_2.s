.data
vx:     .word -1, 3, 7, -2, 4, 1, 5, 9, 1, -5
vy:     .word 6, -3, 2, -2,-3, 2, 1, 0, 4, -2
vx2:     .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
vy2:     .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
#find_nearest
    li        x5, 0            #k
    li        x6, 10           #N
    li        x7, 0            #index
#    li      x7, 20              #dmin==x28
    li        x10, 4           #Multiplicador 
    li        x23, 0            #d      
    
Distancia_P0:
    la    x12,    vx
    la    x13,    vy
    lw    x14,    0(x12)    #vx[0]
    lw    x15,    0(x13)    #vy[0]
    li    x16, 3            #vxref
    li    x17, 4            #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14    #vx*vx
    mul    x15, x15, x15    #vy*vy
    
    add    x16, x14, x15    #vx*vx+vy*vy
    
    mv    x30, x16
    

for:
    addi    x5, x5, 1            #K++
    bge     x5, x6, end         #Se x5>=x6 então não entra
    blt     x30, x0, end         #Se dmin(x30)<=0 então não entra
    
Distancia_min:
    
    mul    x11, x10, x5        # Mutiplica o valor do K por 4.
    la    x12, vx            # Carrega o enderço do vetor vx.
    la    x13, vy            # Carrega o enderço do vetor vy.
    
    add    x12, x12, x11     #vx[]+4k
    add    x13, x13, x11     #vy[]+4k
    lw    x14, 0(x12)        #vx[k]
    lw    x15, 0(x13)        #vy[k]
    
    li    x16, 3             #vxref
    li    x17, 4             #vyref
    
    sub    x14, x14, x16     #vx[k]-vxref=vx
    sub    x15, x15, x17     #vy[k]-vyref=vy
    
    mul    x14, x14, x14    #vx*vx
    mul    x15, x15, x15    #vy*vy
    
    add    x14, x14, x15    #vx*vx+vy*vy
    
    bge    x14, x30, for    #Se a distancia calculado nao for minima entao nao entra no if
    
if:
    mv    x30, x14        #Guarda o valor da distanica minima
    mv    x31, x5          #Guarda o valor do index
    
    j    for            #Volta a entrar no for
    
    
    
    
    
    
    
    
    
    
    
    
    
   
#    j       dist                #d = dist(xref, yref, vx[k], vy[k])
#   
#    addi   x5, x5, 1            #k++
#   
#dist:
#   li     x11, 3               #xref
#   la     x12, vx              #vx 
#    lw     x15, 4(x12)
#    sub    x15, x11, x15        #x1-x2
#    mul    x15, x15, x15        #(x1-x2)^2
#
#    li     x13, 4               #yref
#    la     x14, vy              #vy 
#    lw     x16, 4(x14)
#    sub    x16, x13, x16        #y1-y2
#    mul    x16, x16, x16        #(y1-y2)^2
#
#   add    x15, x15, x16        #(x1-x2)^2 + (y1-y2)^2
#
#   sw     x15, 0(x18)          #d = dist 
#   
#   addi   x12, x12, 4 
#    addi   x14, x14, 4
#
#if:
#    bge     x7, x18, end        #d < dmin
#    sw      x18, 0(x17)         #dmin = d
#    sw      x5, 0(x10)          #index = k
#    j      for
#
end:
    li     x17, 10 
    ecall
    