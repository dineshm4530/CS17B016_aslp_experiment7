main:
	li	$a1,1     # m
y:
	addi	$sp,$sp,-4
	sw	$ra,0($sp)
	jal	x

	mul	$s0,$s0,$s0  # s0 = x*x
	mul	$s0,$s0,$s0  # s0=x^2 * x^2
	addi	$a1,$s0,3    #a1= x^4+3
	addi	$sp,$sp,4
	lw	$ra,0($sp)
	j	$ra
	
x:
	addi	$sp,$sp,-4 
	sw	$ra,0($sp)
	jal	z

	mul	$t1,$s1,$s1   # t1=z*z
	mul	$s1,$s1,$t1   #s1=z*z^2
	addi	$s0,$s1,2    # s0 = z^3+2
	addi	$sp,$sp,4    
	lw	$ra,0($sp)
	j	$ra
z:
	addi	$sp,$sp,-4
	sw	$ra,0($sp)
	jal	p

	mul	$t1,$s2,$s2  # t1=p*p
	mul	$t2,$t1,$s2  # t2=p^2 * p
	add	$s1,$t1,$t2  # s1= p^2 + p^3
	addi	$sp,$sp,4  
	lw	$ra,0($sp)
	j	$ra
p:	
	addi	$sp,$sp,-4  
	sw	$ra,0($sp)
	mul	$s2,$a1,6    # s2=6*m
	j	$ra
	
