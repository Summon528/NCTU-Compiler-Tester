.class public output
.super java/lang/Object

.field public static _sc Ljava/util/Scanner;
; L1
.field public static mySeed I

; L2

; L3

; L4

; L5

; L6

; L7
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 100
new java/util/Scanner
dup
getstatic java/lang/System/in Ljava/io/InputStream;
invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
putstatic output/_sc Ljava/util/Scanner;

; L8
ldc 1
istore 0

; L9

; L10
ldc 123456789
istore 2
iload 2
invokestatic output/srand(I)V

; L11

; L12

; L13
G0:
iload 0
ldc 10
isub
ifle G1
iconst_0
goto G2
G1:
iconst_1
G2:
ifeq G3

; L14
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "student "
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L15
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 0
invokevirtual java/io/PrintStream/print(I)V

; L16
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc " "
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L17
invokestatic output/rand()I
ldc 71
irem
ldc 30
iadd
istore 1

; L18
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 1
invokevirtual java/io/PrintStream/print(I)V

; L19
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc " "
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L20

; L21
iload 1
ldc 60
isub
ifge G4
iconst_0
goto G5
G4:
iconst_1
G5:
ifeq G6

; L22
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "pass
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L23

; L24

; L25
goto G7
G6:

; L26
getstatic java/lang/System/out Ljava/io/PrintStream;
ldc "fail
"
invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

; L27
G7:

; L28

; L29
iload 0
ldc 1
iadd
istore 0

; L30
goto G0
G3:

; L31

; L32
ldc 0
return

; L33
.end method


; L34

; L35
.method public static srand(I)V
.limit stack 50
.limit locals 100

; L36
iload 0
putstatic output/mySeed I

; L37
return
.end method


; L38

; L39
.method public static rand()I
.limit stack 50
.limit locals 100

; L40
getstatic output/mySeed I
ldc 234
imul
ldc 123
iadd
putstatic output/mySeed I

; L41

; L42
getstatic output/mySeed I
ldc 0
isub
ifge G8
iconst_0
goto G9
G8:
iconst_1
G9:
ifeq G10

; L43
getstatic output/mySeed I
ireturn

; L44

; L45

; L46
goto G11
G10:

; L47
getstatic output/mySeed I
ineg
ireturn

; L48
G11:

; L49
ldc 0
ireturn

; L50
.end method


; L51

; L67
