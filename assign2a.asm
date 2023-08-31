// Name: Nam Nguyen Vu
// UCID: 30154892
// Tutorial 1
// TA: Akram
// CPSC 355 Assignment 1 (Part a)

fmt:    .string "original: 0x%08X	reversed: 0x%08X\n"	// Format the print statement	 
      
        .global main						// The first 2 lines to start the program
        .balign 4

main:   stp     x29, x30, [sp, -16]!            		// The first 2 lines in main
        mov     x29, sp

	define(x, w19)						// Define x as w19
	define(y, w20)						// Define y as w20
	define(t1, w21)						// Define t1 as w21
	define(t2, w22)						// Define t2 as w22
	define(t3, w23)						// Define t3 as w23
	define(t4, w24)						// Define t4 as w24

	// Initialize variable
	mov	x, 0x07FC07FC					// Initialize value for x

	// Step 1
	and 	t1, x, 0x55555555				// t1 = x & 0x55555555
	lsl	t1, t1, 1					// t1 = t1 << 1
	lsr	t2, x, 1					// t2 = x >> 1
	and 	t2, t2, 0x55555555				// t2 = t2 & 0x55555555
	orr 	y, t1, t2					// y = t1 | t2

	// Step 2
	and     t1, y, 0x33333333				// t1 = y & 0x33333333
        lsl     t1, t1, 2					// t1 = t1 << 2
        lsr     t2, y, 2					// t2 = y >> 2
        and     t2, t2, 0x33333333				// t2 = t2 & 0x33333333
	orr	y, t1, t2					// y = t1 | t2

	// Step 3
        and     t1, y, 0x0F0F0F0F				// t1 = y & 0x0F0F0F0F
        lsl     t1, t1, 4					// t1 = t1 << 4
        lsr     t2, y, 4					// t2 = y >> 4
        and     t2, t2, 0x0F0F0F0F				// t2 = t2 & 0x0F0F0F0F
	orr	y, t1, t2					// y = t1 | t2

	// Step 4
        lsl     t1, y, 24					// t1 = y << 24
	and	t2, y, 0xFF00					// t2 = y & 0xFF00
	lsl	t2, t2, 8					// t2 = t2 << 8
        lsr     t3, y, 8					// t3 = y >> 8
	and	t3, t3, 0xFF00					// t3 = t3 & 0xFF00
        lsr	t4, y, 24					// t4 = y >> 24
	orr 	y, t1, t2					// y = t1 | t2
	orr	y, y, t3					// y = y | t3 = (t1 | t2) | t3
	orr	y, y, t4					// y = y | t4 = (t1 | t2 | t3) | t4

print:	ldr	w0, =fmt					// Store the print statement to w0
	mov	w1, x						// Store the value of x to w1
	mov	w2, y						// Store the value of y to w2
	bl	printf 						// Print the statement

exit:	mov	x0, 0						// The last 3 line to exit the program
	ldp	x29, x30, [sp], 16
	ret	
