.class public code
.super java/lang/Object

; L1
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 100

; L2
ldc 0
istore 0

; L3
G0:
iload 0
ldc 5
isub
iflt G1
iconst_0
goto G2
G1:
iconst_1
G2:
ifeq G3

; L4
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 0
invokevirtual java/io/PrintStream/print(I)V

; L5
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L6
iload 0
ldc 1
iadd
istore 0

; L7
goto G0
G3:

; L8
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "end1
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L9
G4:

; L10
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 0
invokevirtual java/io/PrintStream/print(I)V

; L11
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L12
iload 0
ldc 1
iadd
istore 0

; L13
iload 0
ldc 10
isub
iflt G5
iconst_0
goto G6
G5:
iconst_1
G6:
ifne G4

; L14
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "end2
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L15

; L16

; L17
ldc 10
istore 1
G7:
iload 1
ldc 15
isub
iflt G8
iconst_0
goto G9
G8:
iconst_1
G9:
ifeq G10
iload 1
ldc 1
iadd
istore 1

; L18
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 1
invokevirtual java/io/PrintStream/print(I)V

; L19
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L20
goto G7
G10:

; L21
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "end3
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L22
ldc 0
return

; L23
.end method


; L24
