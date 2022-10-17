format PE CONSOLE
include 'include/win32ax.inc'
entry start
 ;entry scane
section '.data' data  readable writeable
%d     db "%d",0
x      dd 0

n      dd 10
clear  dd "cls",0

section '.code' code readable executable
inf:
    add [x], 1
    invoke printf, "%d", [x]
    invoke printf, n

    jmp start

start:
    invoke sleep, 250
    invoke system, clear
    jmp inf

    
section '.idata' import data readable writeable
      library kernel,'KERNEL32.DLL', msvcrt, 'msvcrt.dll'
     import kernel, ExitProcess,'ExitProcess', sleep,'Sleep'
  import msvcrt,\
           printf,'printf',\
               system, 'system', \
               getch, '_getch', \
                    scanf, 'scanf'