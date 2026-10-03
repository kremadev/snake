; Disassembly of file: main
; Sat Oct  3 17:53:46 2026
; Type: ELF64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global main: function
global score
global segments

extern endwin                                           ; near
extern usleep                                           ; near
extern mvprintw                                         ; near
extern waddch                                           ; near
extern wmove                                            ; near
extern werase                                           ; near
extern stdscr                                           ; qword
extern wgetch                                           ; near
extern getmaxx                                          ; near
extern getmaxy                                          ; near
extern rand                                             ; near
extern curs_set                                         ; near
extern nodelay                                          ; near
extern keypad                                           ; near
extern initscr                                          ; near


SECTION .text   align=1 exec                            ; section number 1, code

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 64                                 ; 0004 _ 48: 83. EC, 40
        mov     dword [rbp-2CH], 40                     ; 0008 _ C7. 45, D4, 00000028
        mov     dword [rbp-28H], 20                     ; 000F _ C7. 45, D8, 00000014
        call    initscr                                 ; 0016 _ E8, 00000000(PLT r)
        mov     qword [rbp-20H], rax                    ; 001B _ 48: 89. 45, E0
        mov     rax, qword [rbp-20H]                    ; 001F _ 48: 8B. 45, E0
        mov     esi, 1                                  ; 0023 _ BE, 00000001
        mov     rdi, rax                                ; 0028 _ 48: 89. C7
        call    keypad                                  ; 002B _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-20H]                    ; 0030 _ 48: 8B. 45, E0
        mov     esi, 1                                  ; 0034 _ BE, 00000001
        mov     rdi, rax                                ; 0039 _ 48: 89. C7
        call    nodelay                                 ; 003C _ E8, 00000000(PLT r)
        mov     edi, 0                                  ; 0041 _ BF, 00000000
        call    curs_set                                ; 0046 _ E8, 00000000(PLT r)
        mov     dword [rbp-18H], 0                      ; 004B _ C7. 45, E8, 00000000
        mov     dword [rbp-14H], 0                      ; 0052 _ C7. 45, EC, 00000000
        mov     dword [rbp-10H], 1                      ; 0059 _ C7. 45, F0, 00000001
        mov     dword [rbp-0CH], 0                      ; 0060 _ C7. 45, F4, 00000000
        call    rand                                    ; 0067 _ E8, 00000000(PLT r)
        cdq                                             ; 006C _ 99
        idiv    dword [rbp-2CH]                         ; 006D _ F7. 7D, D4
        mov     eax, edx                                ; 0070 _ 89. D0
        mov     dword [rbp-8H], eax                     ; 0072 _ 89. 45, F8
        call    rand                                    ; 0075 _ E8, 00000000(PLT r)
        cdq                                             ; 007A _ 99
        idiv    dword [rbp-28H]                         ; 007B _ F7. 7D, D8
        mov     eax, edx                                ; 007E _ 89. D0
        mov     dword [rbp-4H], eax                     ; 0080 _ 89. 45, FC
?_001:  mov     rax, qword [rbp-20H]                    ; 0083 _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 0087 _ 48: 89. C7
        call    getmaxy                                 ; 008A _ E8, 00000000(PLT r)
        mov     dword [rbp-28H], eax                    ; 008F _ 89. 45, D8
        mov     rax, qword [rbp-20H]                    ; 0092 _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 0096 _ 48: 89. C7
        call    getmaxx                                 ; 0099 _ E8, 00000000(PLT r)
        mov     dword [rbp-2CH], eax                    ; 009E _ 89. 45, D4
        mov     rax, qword [rbp-20H]                    ; 00A1 _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 00A5 _ 48: 89. C7
        call    wgetch                                  ; 00A8 _ E8, 00000000(PLT r)
        mov     dword [rbp-24H], eax                    ; 00AD _ 89. 45, DC
        cmp     dword [rbp-24H], 260                    ; 00B0 _ 81. 7D, DC, 00000104
        jnz     ?_002                                   ; 00B7 _ 75, 1A
        mov     eax, dword [rbp-10H]                    ; 00B9 _ 8B. 45, F0
        cmp     eax, 1                                  ; 00BC _ 83. F8, 01
        je      ?_014                                   ; 00BF _ 0F 84, 00000250
        mov     dword [rbp-10H], -1                     ; 00C5 _ C7. 45, F0, FFFFFFFF
        mov     dword [rbp-0CH], 0                      ; 00CC _ C7. 45, F4, 00000000
?_002:  cmp     dword [rbp-24H], 261                    ; 00D3 _ 81. 7D, DC, 00000105
        jnz     ?_003                                   ; 00DA _ 75, 1A
        mov     eax, dword [rbp-10H]                    ; 00DC _ 8B. 45, F0
        cmp     eax, -1                                 ; 00DF _ 83. F8, FF
        je      ?_015                                   ; 00E2 _ 0F 84, 00000233
        mov     dword [rbp-10H], 1                      ; 00E8 _ C7. 45, F0, 00000001
        mov     dword [rbp-0CH], 0                      ; 00EF _ C7. 45, F4, 00000000
?_003:  cmp     dword [rbp-24H], 259                    ; 00F6 _ 81. 7D, DC, 00000103
        jnz     ?_004                                   ; 00FD _ 75, 1A
        mov     eax, dword [rbp-0CH]                    ; 00FF _ 8B. 45, F4
        cmp     eax, 1                                  ; 0102 _ 83. F8, 01
        je      ?_016                                   ; 0105 _ 0F 84, 00000216
        mov     dword [rbp-10H], 0                      ; 010B _ C7. 45, F0, 00000000
        mov     dword [rbp-0CH], -1                     ; 0112 _ C7. 45, F4, FFFFFFFF
?_004:  cmp     dword [rbp-24H], 258                    ; 0119 _ 81. 7D, DC, 00000102
        jnz     ?_005                                   ; 0120 _ 75, 1A
        mov     eax, dword [rbp-0CH]                    ; 0122 _ 8B. 45, F4
        cmp     eax, -1                                 ; 0125 _ 83. F8, FF
        je      ?_017                                   ; 0128 _ 0F 84, 000001F9
        mov     dword [rbp-10H], 0                      ; 012E _ C7. 45, F0, 00000000
        mov     dword [rbp-0CH], 1                      ; 0135 _ C7. 45, F4, 00000001
?_005:  cmp     dword [rbp-24H], 27                     ; 013C _ 83. 7D, DC, 1B
        je      ?_018                                   ; 0140 _ 0F 84, 000001E7
        mov     eax, dword [rel score]                  ; 0146 _ 8B. 05, 00000000(rel)
        mov     dword [rbp-34H], eax                    ; 014C _ 89. 45, CC
        jmp     ?_007                                   ; 014F _ EB, 38

?_006:  mov     eax, dword [rbp-34H]                    ; 0151 _ 8B. 45, CC
        lea     esi, [rax-1H]                           ; 0154 _ 8D. 70, FF
        mov     eax, dword [rbp-34H]                    ; 0157 _ 8B. 45, CC
        cdqe                                            ; 015A _ 48: 98
        lea     rcx, [rax*8]                            ; 015C _ 48: 8D. 0C C5, 00000000
        lea     rdx, [rel segments]                     ; 0164 _ 48: 8D. 15, 00000000(rel)
        movsxd  rax, esi                                ; 016B _ 48: 63. C6
        lea     rsi, [rax*8]                            ; 016E _ 48: 8D. 34 C5, 00000000
        lea     rax, [rel segments]                     ; 0176 _ 48: 8D. 05, 00000000(rel)
        mov     rax, qword [rsi+rax]                    ; 017D _ 48: 8B. 04 06
        mov     qword [rcx+rdx], rax                    ; 0181 _ 48: 89. 04 11
        sub     dword [rbp-34H], 1                      ; 0185 _ 83. 6D, CC, 01
?_007:  cmp     dword [rbp-34H], 0                      ; 0189 _ 83. 7D, CC, 00
        jg      ?_006                                   ; 018D _ 7F, C2
        mov     rax, qword [rbp-18H]                    ; 018F _ 48: 8B. 45, E8
        mov     qword [rel segments], rax               ; 0193 _ 48: 89. 05, 00000000(rel)
        mov     edx, dword [rbp-10H]                    ; 019A _ 8B. 55, F0
        mov     eax, dword [rbp-18H]                    ; 019D _ 8B. 45, E8
        add     eax, edx                                ; 01A0 _ 01. D0
        mov     dword [rbp-18H], eax                    ; 01A2 _ 89. 45, E8
        mov     edx, dword [rbp-0CH]                    ; 01A5 _ 8B. 55, F4
        mov     eax, dword [rbp-14H]                    ; 01A8 _ 8B. 45, EC
        add     eax, edx                                ; 01AB _ 01. D0
        mov     dword [rbp-14H], eax                    ; 01AD _ 89. 45, EC
        mov     edx, dword [rbp-18H]                    ; 01B0 _ 8B. 55, E8
        mov     eax, dword [rbp-8H]                     ; 01B3 _ 8B. 45, F8
        cmp     edx, eax                                ; 01B6 _ 39. C2
        jnz     ?_008                                   ; 01B8 _ 75, 35
        mov     edx, dword [rbp-14H]                    ; 01BA _ 8B. 55, EC
        mov     eax, dword [rbp-4H]                     ; 01BD _ 8B. 45, FC
        cmp     edx, eax                                ; 01C0 _ 39. C2
        jnz     ?_008                                   ; 01C2 _ 75, 2B
        mov     eax, dword [rel score]                  ; 01C4 _ 8B. 05, 00000000(rel)
        add     eax, 1                                  ; 01CA _ 83. C0, 01
        mov     dword [rel score], eax                  ; 01CD _ 89. 05, 00000000(rel)
        call    rand                                    ; 01D3 _ E8, 00000000(PLT r)
        cdq                                             ; 01D8 _ 99
        idiv    dword [rbp-2CH]                         ; 01D9 _ F7. 7D, D4
        mov     eax, edx                                ; 01DC _ 89. D0
        mov     dword [rbp-8H], eax                     ; 01DE _ 89. 45, F8
        call    rand                                    ; 01E1 _ E8, 00000000(PLT r)
        cdq                                             ; 01E6 _ 99
        idiv    dword [rbp-28H]                         ; 01E7 _ F7. 7D, D8
        mov     eax, edx                                ; 01EA _ 89. D0
        mov     dword [rbp-4H], eax                     ; 01EC _ 89. 45, FC
?_008:  mov     rax, qword [rel stdscr]                 ; 01EF _ 48: 8B. 05, 00000000(rel)
        mov     rdi, rax                                ; 01F6 _ 48: 89. C7
        call    werase                                  ; 01F9 _ E8, 00000000(PLT r)
        mov     eax, dword [rbp-8H]                     ; 01FE _ 8B. 45, F8
        lea     edx, [rax+rax]                          ; 0201 _ 8D. 14 00
        mov     ecx, dword [rbp-4H]                     ; 0204 _ 8B. 4D, FC
        mov     rax, qword [rel stdscr]                 ; 0207 _ 48: 8B. 05, 00000000(rel)
        mov     esi, ecx                                ; 020E _ 89. CE
        mov     rdi, rax                                ; 0210 _ 48: 89. C7
        call    wmove                                   ; 0213 _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 0218 _ 83. F8, FF
        jz      ?_009                                   ; 021B _ 74, 14
        mov     rax, qword [rel stdscr]                 ; 021D _ 48: 8B. 05, 00000000(rel)
        mov     esi, 77                                 ; 0224 _ BE, 0000004D
        mov     rdi, rax                                ; 0229 _ 48: 89. C7
        call    waddch                                  ; 022C _ E8, 00000000(PLT r)
?_009:  mov     dword [rbp-30H], 0                      ; 0231 _ C7. 45, D0, 00000000
        jmp     ?_012                                   ; 0238 _ EB, 5F

?_010:  mov     eax, dword [rbp-30H]                    ; 023A _ 8B. 45, D0
        cdqe                                            ; 023D _ 48: 98
        lea     rdx, [rax*8]                            ; 023F _ 48: 8D. 14 C5, 00000000
        lea     rax, [rel segments]                     ; 0247 _ 48: 8D. 05, 00000000(rel)
        mov     eax, dword [rdx+rax]                    ; 024E _ 8B. 04 02
        lea     edx, [rax+rax]                          ; 0251 _ 8D. 14 00
        mov     eax, dword [rbp-30H]                    ; 0254 _ 8B. 45, D0
        cdqe                                            ; 0257 _ 48: 98
        lea     rcx, [rax*8]                            ; 0259 _ 48: 8D. 0C C5, 00000000
        lea     rax, [rel segments+4H]                  ; 0261 _ 48: 8D. 05, 00000000(rel)
        mov     ecx, dword [rcx+rax]                    ; 0268 _ 8B. 0C 01
        mov     rax, qword [rel stdscr]                 ; 026B _ 48: 8B. 05, 00000000(rel)
        mov     esi, ecx                                ; 0272 _ 89. CE
        mov     rdi, rax                                ; 0274 _ 48: 89. C7
        call    wmove                                   ; 0277 _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 027C _ 83. F8, FF
        jz      ?_011                                   ; 027F _ 74, 14
        mov     rax, qword [rel stdscr]                 ; 0281 _ 48: 8B. 05, 00000000(rel)
        mov     esi, 67                                 ; 0288 _ BE, 00000043
        mov     rdi, rax                                ; 028D _ 48: 89. C7
        call    waddch                                  ; 0290 _ E8, 00000000(PLT r)
?_011:  add     dword [rbp-30H], 1                      ; 0295 _ 83. 45, D0, 01
?_012:  mov     eax, dword [rel score]                  ; 0299 _ 8B. 05, 00000000(rel)
        cmp     dword [rbp-30H], eax                    ; 029F _ 39. 45, D0
        jl      ?_010                                   ; 02A2 _ 7C, 96
        mov     eax, dword [rbp-18H]                    ; 02A4 _ 8B. 45, E8
        lea     edx, [rax+rax]                          ; 02A7 _ 8D. 14 00
        mov     ecx, dword [rbp-14H]                    ; 02AA _ 8B. 4D, EC
        mov     rax, qword [rel stdscr]                 ; 02AD _ 48: 8B. 05, 00000000(rel)
        mov     esi, ecx                                ; 02B4 _ 89. CE
        mov     rdi, rax                                ; 02B6 _ 48: 89. C7
        call    wmove                                   ; 02B9 _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 02BE _ 83. F8, FF
        jz      ?_013                                   ; 02C1 _ 74, 14
        mov     rax, qword [rel stdscr]                 ; 02C3 _ 48: 8B. 05, 00000000(rel)
        mov     esi, 82                                 ; 02CA _ BE, 00000052
        mov     rdi, rax                                ; 02CF _ 48: 89. C7
        call    waddch                                  ; 02D2 _ E8, 00000000(PLT r)
?_013:  mov     edx, dword [rel score]                  ; 02D7 _ 8B. 15, 00000000(rel)
        mov     eax, dword [rbp-2CH]                    ; 02DD _ 8B. 45, D4
        mov     ecx, eax                                ; 02E0 _ 89. C1
        shr     ecx, 31                                 ; 02E2 _ C1. E9, 1F
        add     eax, ecx                                ; 02E5 _ 01. C8
        sar     eax, 1                                  ; 02E7 _ D1. F8
        mov     esi, eax                                ; 02E9 _ 89. C6
        lea     rax, [rel ?_019]                        ; 02EB _ 48: 8D. 05, 00000000(rel)
        mov     ecx, edx                                ; 02F2 _ 89. D1
        mov     rdx, rax                                ; 02F4 _ 48: 89. C2
        mov     edi, 0                                  ; 02F7 _ BF, 00000000
        mov     eax, 0                                  ; 02FC _ B8, 00000000
        call    mvprintw                                ; 0301 _ E8, 00000000(PLT r)
        mov     edi, 125000                             ; 0306 _ BF, 0001E848
        call    usleep                                  ; 030B _ E8, 00000000(PLT r)
        jmp     ?_001                                   ; 0310 _ E9, FFFFFD6E

?_014:  nop                                             ; 0315 _ 90
        jmp     ?_001                                   ; 0316 _ E9, FFFFFD68

?_015:  nop                                             ; 031B _ 90
        jmp     ?_001                                   ; 031C _ E9, FFFFFD62

?_016:  nop                                             ; 0321 _ 90
        jmp     ?_001                                   ; 0322 _ E9, FFFFFD5C

?_017:  nop                                             ; 0327 _ 90
        jmp     ?_001                                   ; 0328 _ E9, FFFFFD56
; main End of function

?_018:  ; Local function
        nop                                             ; 032D _ 90
        call    endwin                                  ; 032E _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0333 _ B8, 00000000
        leave                                           ; 0338 _ C9
        ret                                             ; 0339 _ C3


SECTION .data   align=1 noexec                          ; section number 2, data


SECTION .bss    align=32 noexec                         ; section number 3, bss

score:  resd    8                                       ; 0000

segments:                                               ; byte
        resq    256                                     ; 0020


SECTION .rodata align=1 noexec                          ; section number 4, const

?_019:                                                  ; byte
        db 25H, 64H, 00H                                ; 0000 _ %d.


SECTION .note.gnu.property align=8 noexec               ; section number 5, const

        db 04H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 0000 _ .... ...
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........
        db 01H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0020 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0028 _ ........


SECTION .eh_frame align=8 noexec                        ; section number 6, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd main-$-20H                                   ; 0020 _ 00000000 (rel)
        dd 0000033AH, 100E4100H                         ; 0024 _ 826 269369600 
        dd 0D430286H, 03350306H                         ; 002C _ 222495366 53805830 
        dd 0008070CH                                    ; 0034 _ 526092 


