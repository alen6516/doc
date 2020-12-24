# Register
## General Register
+--------------------------------+
| RAX           | EAX  | AH | AL | 	(AX = AH + AL)
| RBX           |      |    |    |
| RCX           |      |    |    |
| RDX           |      |    |    |
| RBP           |      |    |    |
| RSI           |      |    |    |
| RDI           |      |    |    |
| RSP           |      |    |    |
+--------------------------------+
<-64------------<-32---<-16-bits->

* RAX (Accumulator)
* RBX (Base address)
* RCX (Counter)
* RDX (Data)
* RBP (Base pointer)
* RDI (dst address)
* RSI (src address)

## Addressing
* absolute/direct addressing
    * mov [0x9487], %AX

* immediate addressing
    * mov 0x9487, %AX

* indirect addressing
    * mov -0x14[%rbp], %EAX


# Difference between AT&T syntax and Intel syntax
## order
Intel Syntax             | AT&T Syntax
-------------------------|----------------------
instr    dest, source    | instr    source, dest
mov      eax , [ecx]     | mov1     (%ecx), %eax

## register naming
(add % before register in AT&T syntax)

## imme operand
(add $ before imme in AT&T syntax)

Intel Syntax             | AT&T Syntax
-------------------------|----------------------
mov    eax, 1            | mov1    $1, %eax
mov    ebx, 0ffh         | mov1    $0xff, %ebx
int    80h               | int     $0x80

## memory reference (間接定址)
```
Intel Syntax                                  | AT&T Syntax
----------------------------------------------|--------------------------------------------
instr   foo, segreg:[base+index*scale+disp]   | instr   %segreg:disp(base,index,scale), foo
mov     eax, [ebx+20h]                        | movl    0x20(%ebx),                     %eax
add     eax, [ebx+ecx*2h]                     | addl    (%ebx,%ecx,0x2),                %eax
lea     eax, [ebx+ecx]                        | leal    (%ebx,%ecx),                    %eax
sub     eax, [ebx+ecx*4h-20h]                 | subl    -0x20(%ebx,%ecx,0x4),           %eax
```

## opecode naming (指令命名)
b : byte
w : word
l : long

Intel Syntax                          | AT&T Syntax
--------------------------------------|---------------------
mov     al,bl                         | movb    %bl,%al
mov     ax,bx                         | movw    %bx,%ax
mov     eax,ebx                       | movl    %ebx,%eax
mov     eax, dword ptr [ebx]          | movl    (%ebx),%eax

## type casting
s  (signed)
z  (zero)
 
bl (from byte to long) 
bw (from byte to word) 
wl (from word to long)

movsbl %al, %edx

## long jump, call and ret
```
Intel Syntax                            AT&T Syntax

jmp far seg:offsetljmp seg, offset

jmp far  INITSEG:GO                     ljmp $INITSEG, $GO
call far INITSEG:GO                     lcall $INITSEG, $GO
ret far	 STACK_ADJUS                    lret $STACK_ADJUST
```
