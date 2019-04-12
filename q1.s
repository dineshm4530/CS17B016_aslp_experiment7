main:
	li $a0,3 	   #l = 2
	li $a1,4	   #m = 6

	jal multi
	li $s1,2	   #k = 2
	li $s2,2	   #n = 2
	div $v1,$s2
	mflo $s3
	add $t0,$s1,$s3	   # j = k+(l*m)/n
        
        j end

multi:
	mul $v1,$a0,$a1	   #v1 = l * m
	j $ra
exit:
      li $v0, 10
      syscall

