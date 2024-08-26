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