main:
	li $a0,8
	jal fibo

	add $t4,$v0,$zero    #t4=v0+0
	li $v0,10            #v0 <- 10
	syscall



fibo:
	sub $sp,$sp,12      # $sp=$sp-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	
	add $s0,$a0,$zero     #s0=a0+0
        
	addi $t0,$0,1        #t0 <- 1
	beq $s0,$0,exit1     # branches if the two registers are equal 
	beq $s0,$t0,exit2    # branches if the two registers are equal 

	sub $a0,$a0,1        # a0=a0-1
	jal fibo             # Jumps to the address in fibo and stores the return address 

	add $s1,$0,$v0       #s1=0+v0
	sub $a0,$s0,2        #a0=s0-2
	jal fibo             # Jumps to the address in fibo and stores the return address 

	add $v0,$v0,$s1     #v0=v0+s1


exit1:
	li $v0,0       # v0 <- 0
	j last      # jumps to the address 
exit2: 
	li $v0,1       # v0 <- 1
        j last      # jumps to the address



last:
        lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12   #sp =sp+12
	jr $ra
