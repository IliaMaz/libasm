.section __TEXT,__text
    .globl _ft_strlen

_ft_strlen:
    mov x1, #0 ; Initialize x1 to 0, this will be our index

loop:
    /**
        * Load the current char from x0 into w2 and increments x0 by 1.
        * Initially tried to load into x2 but there is a size mismatch,
        * the w registers are 8 bits and as such are perfect for normal
        * chars.
        *
        * Note that x0 is the pointer and [x0] is the dereference of that
        * pointer
    **/
    ldrb w2, [x0], #1
    
    /**
     * The zr, wzr, and xzr are special registers hardwired to the value
     * 0. It seems proper to just compare with them instead of a temporary
     * and fuckupable number #0.
    **/
    cmp w2, wzr ; compare the char against the null term

    beq terminate ; branch equal -> jump to terminate

    /**
        * Increment the character counter, the following is the syntax
        * <source register> <destination register> <value or register>
    **/
    add x1, x1, #1

    b loop ; continue the loop via label

terminate:

    /**
     * Moves the string length counter from x1 to x0. Moved to x0 because
     * it is both the return register and the first parameter register that
     * is typically used.
    **/
    mov x0, x1
    
    ret


