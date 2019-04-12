main:
	li $a1,3
	jal fact
	li  $v0,10
	syscall
	
fact:	
	addi $sp,$sp,8   #sp=sp+8
	sw  $ra,0($sp)
	sw  $s0,4($sp)
	sw  $s1,8($sp)
	
	add $s0,$a1,$zero  #s0=a1+0
	li  $t0,1
	beq  $s0,$t0,end  # branches if two registers are equal
	addi $a1,$s0,-1   #a1=s0+(-1)
	jal fact          # jumps to the address and store the return address
	
	add  $s1,$v1,$zero  #s1=v1+0
        mul  $v1,$s1,$s0    #v1=s1*s0
	
	
exit:	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12  #sp=sp+12
	j $ra
	
end:	
	li $v1,1
	j exit
