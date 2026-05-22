; Interface tables: 0/0 (NaN%)
; Virtual methods: 0 / 0
; generated code sizes (bytes): 5452 (incl. 3290 user, 728 helpers, 14 vtables, 1420 lits); src size 0
; assembly: 3274 lines; density: 47.68 bytes/stmt; (69 stmts)
; total bytes: 221516 (91.3% of 237.0k flash with 21172 free)
; peep hole pass: 29 instructions removed and 128 updated
; peep hole pass: 13 instructions removed and 0 updated
; peep hole pass: 0 instructions removed and 0 updated


; start
    .startaddr 0x34c00
    .hex 708E3B92C615A841C49866C975EE5197 ; magic number
    .hex B54C2D92C33F0678 ; hex template hash
    .hex 873266330af9dbdb ; replaced in binary by program hash
    .short 4   ; num. globals
    .short 0 ; patched with number of 64 bit words resulting from assembly
    .word _pxt_config_data
    .short 0 ; patched with comm section size
    .short 1 ; number of globals that are not pointers (they come first)
    .word _pxt_iface_member_names
    .word _pxt_lambda_trampoline@fn
    .word _pxt_perf_counters
    .word _pxt_restore_exception_state@fn
    .word _str46 ; name
    ;
; Function main.ts(1,1): <main>
    ;
    .object _main___P1 "main.ts(1,1): <main>"
_main___P1_pre:
    .section code
    .balign 4
_main___P1_Lit:
    .word pxt::RefAction_vtable
    .short 0, 0 ; no captured vars
    .word _main___P1_args@fn
_main___P1_args:
    .section code
_main___P1:
_main___P1_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
_main___P1_locals:
    movs r0, #0
    ldr r7, [r6, #0]
    str r0, [r7, #4]
    @stackempty locals
    movs r0, #0
    ldr r7, [r6, #0]
    str r0, [r7, #8]
    @stackempty locals
    bl towerBridge_trafficGreen__P837
_proccall47:
    @stackempty locals
    ldr r0, _ldlit_2 ; inline__P840_Lit      
    push {r0} ; proc-arg
    bl _conv_1
    mov r7, sp
    str r7, [r6, #4]
    bl basic::forever
    add sp, #4*1 ; pop locals 1
    @stackempty locals
    movs r0, #3
    ldr r7, [r6, #0]
    str r0, [r7, #12]
    @stackempty locals
.ret.1:
    @stackempty locals
    movs r0, #0
.final_0_1:
_main___P1_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function test.ts(3,15): inline
    ;
    .object inline__P840 "test.ts(3,15): inline"
inline__P840_pre:
    .section code
    .balign 4
inline__P840_Lit:
    .word pxt::RefAction_vtable
    .short 0, 0 ; no captured vars
    .word inline__P840_args@fn
inline__P840_args:
    .section code
inline__P840:
inline__P840_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
inline__P840_locals:
    bl towerBridge_boatDetected__P842
_proccall49:
    mov r7, sp
    str r7, [r6, #4]
    bl numops::toBoolDecr
    cmp r0, #0
    beq .else_0_2      
.jmpz48:
    bl towerBridge_trafficRed__P844
_proccall50:
    @stackempty locals
    bl towerBridge_raiseBridge__P846
_proccall51:
    @stackempty locals
    b .afterif_1_2      
.else_0_2:
    bl towerBridge_lowerBridge__P848
_proccall52:
    @stackempty locals
    bl towerBridge_trafficGreen__P837
_proccall53:
    @stackempty locals
.afterif_1_2:
.ret.840:
    @stackempty locals
    movs r0, #0
.final_2_2:
inline__P840_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(63,5): towerBridge.lowerBridge
    ;
    .object towerBridge_lowerBridge__P848 "main.ts(63,5): towerBridge.lowerBridge"
towerBridge_lowerBridge__P848_pre:
    .section code
    .balign 4
    .section code
towerBridge_lowerBridge__P848:
towerBridge_lowerBridge__P848_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_lowerBridge__P848_locals:
    movs r0, #3
    push {r0} ; proc-arg
    bl towerBridge_setBridgePosition__P854
_proccall54:
    add sp, #4*1 ; pop locals 1
    @stackempty locals
.ret.848:
    @stackempty locals
    movs r0, #0
.final_0_3:
towerBridge_lowerBridge__P848_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(40,5): towerBridge.setBridgePosition
    ;
    .object towerBridge_setBridgePosition__P854 "main.ts(40,5): towerBridge.setBridgePosition"
towerBridge_setBridgePosition__P854_pre:
    .section code
    .balign 4
    .section code
towerBridge_setBridgePosition__P854:
towerBridge_setBridgePosition__P854_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_setBridgePosition__P854_locals:
    ldr r0, [sp, args@0]
    ldr r7, [r6, #0]
    str r0, [r7, #12]
    @stackempty locals
    ldr r0, [sp, args@0]
    push {r0} ; proc-arg
    bl towerBridge_showPosition__P853
_proccall55:
    add sp, #4*1 ; pop locals 1
    @stackempty locals
.ret.854:
    @stackempty locals
    movs r0, #0
.final_0_4:
towerBridge_setBridgePosition__P854_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(20,5): towerBridge.showPosition
    ;
    .object towerBridge_showPosition__P853 "main.ts(20,5): towerBridge.showPosition"
towerBridge_showPosition__P853_pre:
    .section code
    .balign 4
    .section code
towerBridge_showPosition__P853:
towerBridge_showPosition__P853_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_showPosition__P853_locals:
    ldr r0, [sp, args@0]
    movs r1, #1
    bl _cmp_eq
    beq .else_0_5      
.jmpz56:
    ldr r0, _ldlit_3 ; _str42      
    movs r1, #150
    mov r7, sp
    str r7, [r6, #4]
    bl basic::showString
    @stackempty locals
    b .afterif_1_5      
.else_0_5:
    ldr r0, [sp, args@0]
    movs r1, #3
    bl _cmp_eq
    beq .else_2_5      
.jmpz57:
    ldr r0, _ldlit_4 ; _str43      
    movs r1, #150
    mov r7, sp
    str r7, [r6, #4]
    bl basic::showString
    @stackempty locals
    b .afterif_3_5      
.else_2_5:
    ldr r0, [sp, args@0]
    movs r1, #5
    bl _cmp_eq
    beq .else_4_5      
.jmpz58:
    ldr r0, _ldlit_5 ; _str44      
    movs r1, #150
    mov r7, sp
    str r7, [r6, #4]
    bl basic::showString
    @stackempty locals
    b .afterif_5_5      
.else_4_5:
    ldr r0, _ldlit_6 ; _str45      
    movs r1, #150
    mov r7, sp
    str r7, [r6, #4]
    bl basic::showString
    @stackempty locals
.afterif_5_5:
.afterif_3_5:
.afterif_1_5:
.ret.853:
    @stackempty locals
    movs r0, #0
.final_6_5:
towerBridge_showPosition__P853_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(52,5): towerBridge.raiseBridge
    ;
    .object towerBridge_raiseBridge__P846 "main.ts(52,5): towerBridge.raiseBridge"
towerBridge_raiseBridge__P846_pre:
    .section code
    .balign 4
    .section code
towerBridge_raiseBridge__P846:
towerBridge_raiseBridge__P846_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_raiseBridge__P846_locals:
    movs r0, #7
    push {r0} ; proc-arg
    bl towerBridge_setBridgePosition__P854
_proccall59:
    add sp, #4*1 ; pop locals 1
    @stackempty locals
.ret.846:
    @stackempty locals
    movs r0, #0
.final_0_6:
towerBridge_raiseBridge__P846_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(86,5): towerBridge.trafficRed
    ;
    .object towerBridge_trafficRed__P844 "main.ts(86,5): towerBridge.trafficRed"
towerBridge_trafficRed__P844_pre:
    .section code
    .balign 4
    .section code
towerBridge_trafficRed__P844:
towerBridge_trafficRed__P844_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_trafficRed__P844_locals:
    movs r0, #4
    lsls r0, r0, #8
    adds r0, #177
    push {r0} ; proc-arg
    movs r0, #7
    push {r0} ; proc-arg
    bl basic_showIcon__P383
_proccall60:
    add sp, #4*2 ; pop locals 2
    @stackempty locals
.ret.844:
    @stackempty locals
    movs r0, #0
.final_0_7:
towerBridge_trafficRed__P844_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function core/icons.ts(190,5): basic.showIcon
    ;
    .object basic_showIcon__P383 "core/icons.ts(190,5): basic.showIcon"
basic_showIcon__P383_pre:
    .section code
    .balign 4
    .section code
basic_showIcon__P383:
basic_showIcon__P383_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    movs r0, #0
    push {r0} ;loc
    @stackmark locals
basic_showIcon__P383_locals:
    ldr r0, [sp, args@0]
    push {r0} ; proc-arg
    bl images_iconImage__P386
_proccall61:
    add sp, #4*1 ; pop locals 1
    str r0, [sp, locals@0]
    @stackempty locals
    ldr r0, [sp, locals@0]
    push {r0} ; proc-arg
    ldr r0, [sp, args@1]
    push {r0} ; proc-arg
    bl _conv_3
    movs r1, #0
    mov r7, sp
    str r7, [r6, #4]
    bl ImageMethods::showImage
    add sp, #4*2 ; pop locals 2
    @stackempty locals
.ret.383:
    @stackempty locals
    movs r0, #0
.final_0_8:
    add sp, #4*1 ; pop locals 1
basic_showIcon__P383_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function core/icons.ts(285,5): images.iconImage
    ;
    .object images_iconImage__P386 "core/icons.ts(285,5): images.iconImage"
images_iconImage__P386_pre:
    .section code
    .balign 4
    .section code
images_iconImage__P386:
images_iconImage__P386_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
images_iconImage__P386_locals:
    ldr r0, [sp, args@0]
    push {r0}; tmpstore @1
    mov r1, r0
    movs r0, #1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz62
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_0_9      
.jmpz62:
    movs r0, #3
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz63
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_1_9      
.jmpz63:
    movs r0, #9
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz64
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_2_9      
.jmpz64:
    movs r0, #11
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz65
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_3_9      
.jmpz65:
    movs r0, #13
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz66
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_4_9      
.jmpz66:
    movs r0, #15
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz67
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_5_9      
.jmpz67:
    movs r0, #17
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz68
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_6_9      
.jmpz68:
    movs r0, #19
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz69
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_7_9      
.jmpz69:
    movs r0, #21
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz70
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_8_9      
.jmpz70:
    movs r0, #23
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz71
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_9_9      
.jmpz71:
    movs r0, #25
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz72
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_10_9      
.jmpz72:
    movs r0, #5
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz73
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_11_9      
.jmpz73:
    movs r0, #7
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz74
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_12_9      
.jmpz74:
    movs r0, #67
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz75
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_13_9      
.jmpz75:
    movs r0, #69
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz76
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_14_9      
.jmpz76:
    movs r0, #71
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz77
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_15_9      
.jmpz77:
    movs r0, #73
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz78
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_16_9      
.jmpz78:
    movs r0, #75
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz79
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_17_9      
.jmpz79:
    movs r0, #77
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz80
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_18_9      
.jmpz80:
    movs r0, #79
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz81
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_19_9      
.jmpz81:
    movs r0, #81
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz82
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_20_9      
.jmpz82:
    movs r0, #27
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz83
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_21_9      
.jmpz83:
    movs r0, #29
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz84
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_22_9      
.jmpz84:
    movs r0, #31
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz85
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_23_9      
.object PUSH
.balign 4
_ldlit_2:
 .word inline__P840_Lit
_ldlit_3:
 .word _str42
_ldlit_4:
 .word _str43
_ldlit_5:
 .word _str44
_ldlit_6:
 .word _str45
.object POP
.jmpz85:
    movs r0, #33
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz86
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_24_9      
.jmpz86:
    movs r0, #35
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz87
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_25_9      
.jmpz87:
    movs r0, #37
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz88
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_26_9      
.jmpz88:
    movs r0, #39
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz89
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_27_9      
.jmpz89:
    movs r0, #41
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz90
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_28_9      
.jmpz90:
    movs r0, #43
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz91
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_29_9      
.jmpz91:
    movs r0, #45
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz92
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_30_9      
.jmpz92:
    movs r0, #47
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz93
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_31_9      
.jmpz93:
    movs r0, #49
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz94
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_32_9      
.jmpz94:
    movs r0, #51
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz95
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_33_9      
.jmpz95:
    movs r0, #53
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz96
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_34_9      
.jmpz96:
    movs r0, #55
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz97
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_35_9      
.jmpz97:
    movs r0, #57
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz98
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_36_9      
.jmpz98:
    movs r0, #61
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz99
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_37_9      
.jmpz99:
    movs r0, #59
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz100
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_38_9      
.jmpz100:
    movs r0, #63
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz101
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_39_9      
.jmpz101:
    movs r0, #65
    ldr r1, [sp, #4*0] ; tmpref @1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::switch_eq
    cmp r0, #0
    beq .jmpz102
    @dummystack 1
    add sp, #4*1 ; pop locals 1
    b .switch_40_9      
.jmpz102:
    pop {r0} ; tmpref @1
    b .switch_41_9      
.switch_0_9:
    ldr r0, _ldlit_8 ; _img0      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_1_9:
    ldr r0, _ldlit_9 ; _img1      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_2_9:
    ldr r0, _ldlit_10 ; _img2      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_3_9:
    ldr r0, _ldlit_11 ; _img3      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_4_9:
    ldr r0, _ldlit_12 ; _img4      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_5_9:
    ldr r0, _ldlit_13 ; _img5      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_6_9:
    ldr r0, _ldlit_14 ; _img6      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_7_9:
    ldr r0, _ldlit_15 ; _img7      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_8_9:
    ldr r0, _ldlit_16 ; _img8      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_9_9:
    ldr r0, _ldlit_17 ; _img9      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_10_9:
    ldr r0, _ldlit_18 ; _img10      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_11_9:
    ldr r0, _ldlit_19 ; _img11      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_12_9:
    ldr r0, _ldlit_20 ; _img12      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_13_9:
    ldr r0, _ldlit_21 ; _img13      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_14_9:
    ldr r0, _ldlit_22 ; _img14      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_15_9:
    ldr r0, _ldlit_23 ; _img15      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_16_9:
    ldr r0, _ldlit_24 ; _img16      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_17_9:
    ldr r0, _ldlit_25 ; _img17      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_18_9:
    ldr r0, _ldlit_26 ; _img18      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_19_9:
    ldr r0, _ldlit_27 ; _img19      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_20_9:
    ldr r0, _ldlit_28 ; _img20      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_21_9:
    ldr r0, _ldlit_29 ; _img21      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_22_9:
    ldr r0, _ldlit_30 ; _img22      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_23_9:
    ldr r0, _ldlit_31 ; _img23      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_24_9:
    ldr r0, _ldlit_32 ; _img24      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_25_9:
    ldr r0, _ldlit_33 ; _img25      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_26_9:
    ldr r0, _ldlit_34 ; _img26      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_27_9:
    ldr r0, _ldlit_35 ; _img27      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_28_9:
    ldr r0, _ldlit_36 ; _img28      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_29_9:
    ldr r0, _ldlit_37 ; _img29      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_30_9:
    ldr r0, _ldlit_38 ; _img30      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_31_9:
    ldr r0, _ldlit_39 ; _img31      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_32_9:
    ldr r0, _ldlit_40 ; _img32      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_33_9:
    ldr r0, _ldlit_41 ; _img33      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_34_9:
    ldr r0, _ldlit_42 ; _img34      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_35_9:
    ldr r0, _ldlit_43 ; _img35      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_36_9:
    ldr r0, _ldlit_44 ; _img36      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_37_9:
    ldr r0, _ldlit_45 ; _img37      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_38_9:
    ldr r0, _ldlit_46 ; _img38      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_39_9:
    ldr r0, _ldlit_47 ; _img39      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.object PUSH
.balign 4
_ldlit_8:
 .word _img0
_ldlit_9:
 .word _img1
_ldlit_10:
 .word _img2
_ldlit_11:
 .word _img3
_ldlit_12:
 .word _img4
_ldlit_13:
 .word _img5
_ldlit_14:
 .word _img6
_ldlit_15:
 .word _img7
_ldlit_16:
 .word _img8
_ldlit_17:
 .word _img9
_ldlit_18:
 .word _img10
_ldlit_19:
 .word _img11
_ldlit_20:
 .word _img12
_ldlit_21:
 .word _img13
_ldlit_22:
 .word _img14
_ldlit_23:
 .word _img15
_ldlit_24:
 .word _img16
_ldlit_25:
 .word _img17
_ldlit_26:
 .word _img18
_ldlit_27:
 .word _img19
_ldlit_28:
 .word _img20
_ldlit_29:
 .word _img21
_ldlit_30:
 .word _img22
_ldlit_31:
 .word _img23
_ldlit_32:
 .word _img24
_ldlit_33:
 .word _img25
_ldlit_34:
 .word _img26
_ldlit_35:
 .word _img27
_ldlit_36:
 .word _img28
_ldlit_37:
 .word _img29
_ldlit_38:
 .word _img30
_ldlit_39:
 .word _img31
_ldlit_40:
 .word _img32
_ldlit_41:
 .word _img33
_ldlit_42:
 .word _img34
_ldlit_43:
 .word _img35
_ldlit_44:
 .word _img36
_ldlit_45:
 .word _img37
_ldlit_46:
 .word _img38
_ldlit_47:
 .word _img39
.object POP
.switch_40_9:
    ldr r0, _ldlit_49 ; _img40      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.switch_41_9:
    ldr r0, _ldlit_50 ; _img41      
    mov r7, sp
    str r7, [r6, #4]
    bl images::createImage
    b .ret.386      
.brk.906:
    movs r0, #0
.ret.386:
    @stackempty locals
.final_42_9:
images_iconImage__P386_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(75,5): towerBridge.boatDetected
    ;
    .object towerBridge_boatDetected__P842 "main.ts(75,5): towerBridge.boatDetected"
towerBridge_boatDetected__P842_pre:
    .section code
    .balign 4
    .section code
towerBridge_boatDetected__P842:
towerBridge_boatDetected__P842_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_boatDetected__P842_locals:
    movs r0, #1
    mov r7, sp
    str r7, [r6, #4]
    bl input::buttonIsPressed
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::fromBool
.ret.842:
    @stackempty locals
.final_0_10:
towerBridge_boatDetected__P842_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    ;
; Function main.ts(97,5): towerBridge.trafficGreen
    ;
    .object towerBridge_trafficGreen__P837 "main.ts(97,5): towerBridge.trafficGreen"
towerBridge_trafficGreen__P837_pre:
    .section code
    .balign 4
    .section code
towerBridge_trafficGreen__P837:
towerBridge_trafficGreen__P837_nochk:
    @stackmark func
    @stackmark args
    push {lr}
.locals:
    @stackmark locals
towerBridge_trafficGreen__P837_locals:
    movs r0, #4
    lsls r0, r0, #8
    adds r0, #177
    push {r0} ; proc-arg
    movs r0, #5
    push {r0} ; proc-arg
    bl basic_showIcon__P383
_proccall103:
    add sp, #4*2 ; pop locals 2
    @stackempty locals
.ret.837:
    @stackempty locals
    movs r0, #0
.final_0_11:
towerBridge_trafficGreen__P837_end:
    pop {pc}
    @stackempty func
    @stackempty args
; endfun
    .object _pxt_helper_trampoline "helper: trampoline"
    .section code
_pxt_lambda_trampoline:
    push { r4, r5, r6, r7, lr}
    mov r4, r8
    mov r5, r9
    mov r6, r10
    mov r7, r11
    push {r4, r5, r6, r7} ; save high registers
    mov r4, r1
    mov r5, r2
    mov r6, r3
    mov r7, r0
    bl _inst_builtin4_validate_0
    mov r0, sp
    push {r4, r5, r6, r7} ; push args and the lambda
    mov r1, sp
    bl pxt::pushThreadContext
    mov r6, r0          ; save ctx or globals
    mov r5, r7          ; save lambda for closure
    mov r0, r5          ; also save lambda pointer in r0 - needed by pxt::bindMethod
    ldr r1, [r5, #8]    ; ld fnptr
    movs r4, #3         ; 3 args
    blx r1              ; execute the actual lambda
    mov r7, r0          ; save result
    @dummystack 4
    add sp, #4*4        ; remove arguments and lambda
    mov r0, r6   ; or pop the thread context
    bl pxt::popThreadContext
    mov r0, r7 ; restore result
    pop {r4, r5, r6, r7} ; restore high registers
    mov r8, r4
    mov r9, r5
    mov r10, r6
    mov r11, r7
    pop { r4, r5, r6, r7, pc}
    .object _pxt_helper_exn "helper: exn"
    .section code
; r0 - try frame
; r1 - handler PC
_pxt_save_exception_state:
    push {r0, lr}
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::beginTry
    pop {r1, r4}
    str r1, [r0, #1*4] ; PC
    mov r1, sp
    str r1, [r0, #2*4] ; SP
    str r5, [r0, #3*4] ; lambda ptr
    bx r4
    .section code
; r0 - try frame
; r1 - thread context
_pxt_restore_exception_state:
    mov r6, r1
    ldr r1, [r0, #2*4] ; SP
    mov sp, r1
    ldr r5, [r0, #3*4] ; lambda ptr
    ldr r1, [r0, #1*4] ; PC
    movs r0, #1
    orrs r1, r0
    bx r1
    .object _pxt_helper_stringconv "helper: stringconv"
    .section code
_pxt_stringConv:
    lsls r2, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r2, [r3, #8]
    cmp r2, #1
    bne .notstring
    bx lr
.notstring:
    ldr r7, [r3, #4*8]
    cmp r7, #0
    beq .fail
    push {r0, lr}
    movs r4, #1
    blx r7
    str r0, [sp, #0]
    b .numops
.fail:
    push {r0, lr}
.numops:
    mov r7, sp
    str r7, [r6, #4]
    bl numops::toString
    pop {r1, pc}      
    .object _pxt_helper_get_buffer "helper: get buffer"
    .section code
_pxt_buffer_get:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #3
    bne .fail
    asrs r1, r1, #1
    bcc .notint
    ldr r4, [r0, #4]
    cmp r1, r4
    bhs .oob
    adds r4, r0, r1
    ldrb r0, [r4, #8]
    lsls r0, r0, #1
    adds r0, #1
    bx lr
.notint:
    lsls r1, r1, #1
    push {lr, r0, r2}      
    mov r0, r1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::toInt
    mov r1, r0
    pop {r0, r2}
.doop:
    mov r7, sp
    str r7, [r6, #4]
    bl Array_::getAt
    lsls r0, r0, #1
    adds r0, #1
    pop {pc}
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.oob:
    movs r0, #1 ; 0 or undefined
    bx lr
    .object _pxt_helper_get_array "helper: get array"
    .section code
_pxt_array_get:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #6
    bne .fail
    asrs r1, r1, #1
    bcc .notint
    ldrh r4, [r0, #8]
    cmp r1, r4
    bhs .oob
    lsls r1, r1, #2
    ldr r4, [r0, #4]
    ldr r0, [r4, r1]
    bx lr
.notint:
    lsls r1, r1, #1
    push {lr, r0, r2}      
    mov r0, r1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::toInt
    mov r1, r0
    pop {r0, r2}
.doop:
    mov r7, sp
    str r7, [r6, #4]
    bl Array_::getAt
    pop {pc}
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.oob:
    movs r0, #0 ; 0 or undefined
    bx lr
    .object _pxt_helper_set_buffer "helper: set buffer"
    .section code
_pxt_buffer_set:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #3
    bne .fail
    asrs r1, r1, #1
    bcc .notint
    ldr r4, [r0, #4]
    cmp r1, r4
    bhs .oob
    adds r4, r0, r1
    strb r2, [r4, #8]
    bx lr
.notint:
    lsls r1, r1, #1
    push {lr, r0, r2}      
    mov r0, r1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::toInt
    mov r1, r0
    pop {r0, r2}
.doop:
    mov r7, sp
    str r7, [r6, #4]
    bl Array_::setAt
    pop {pc}
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.oob:
    push {lr}
    b .doop
    .object _pxt_helper_set_array "helper: set array"
    .section code
_pxt_array_set:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #6
    bne .fail
    asrs r1, r1, #1
    bcc .notint
    ldrh r4, [r0, #8]
    cmp r1, r4
    bhs .oob
    lsls r1, r1, #2
    ldr r4, [r0, #4]
    str r2, [r4, r1]
    bx lr
.notint:
    lsls r1, r1, #1
    push {lr, r0, r2}      
    mov r0, r1
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::toInt
    mov r1, r0
    pop {r0, r2}
.doop:
    mov r7, sp
    str r7, [r6, #4]
    bl Array_::setAt
    pop {pc}
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.oob:
    push {lr}
    b .doop
    .object _pxt_helper_get "helper: get"
    .section code
_pxt_map_get:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #8
    bne .notmap
    push {lr}
    mov r7, sp
    str r7, [r6, #4]
    bl pxtrt::mapGetByString
    pop {pc}
.notmap:
    mov r4, r3 ; save VT
    push {r0, lr}
    mov r0, r1
    bl pxtrt::lookupMapKey
    mov r1, r0 ; put key index in r1
    ldr r0, [sp, #0] ; restore obj pointer
    mov r3, r4 ; restore vt
    bl .dowork
    add sp, #4*1 ; pop locals 1
    pop {pc}
.dowork:
    ldr r2, [r3, #12] ; load mult
    movs r7, r2
    beq .objlit ; built-in types have mult=0
    muls r7, r1
    lsrs r7, r2
    lsls r7, r7, #1 ; r7 - hash offset
    ldr r3, [r3, #4] ; iface table
    adds r3, r3, r7
; r0-this, r1-method idx, r2-free, r3-hash entry, r4-num args, r7-free
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    adds r3, #2
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    adds r3, #2
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    movs r0, #0 ; undefined
    bx lr
.hit:
    adds r3, r3, r2 ; r3-descriptor
    ldr r2, [r3, #4]
    lsls r7, r2, #31
    beq .field
; check if it's getter
    ldrh r7, [r3, #2]
    cmp r7, #1
    bne .bind
    movs r4, #1
    bx r2
.bind:
    mov r4, lr
    bl _pxt_bind_helper
.field:
    ldr r0, [r0, r2] ; load field
    bx lr
.objlit:
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.fail2:
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::missingProperty
    .object _pxt_helper_set "helper: set"
    .section code
_pxt_map_set:
    lsls r4, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r4, [r3, #8]
    cmp r4, #8
    bne .notmap
    push {lr}
    mov r7, sp
    str r7, [r6, #4]
    bl pxtrt::mapSetByString
    pop {pc}
.notmap:
    mov r4, r3 ; save VT
    push {r0, r2, lr}
    mov r0, r1
    bl pxtrt::lookupMapKey
    mov r1, r0 ; put key index in r1
    ldr r0, [sp, #0] ; restore obj pointer
    mov r3, r4 ; restore vt
    bl .dowork
    add sp, #4*2 ; pop locals 2
    pop {pc}
.dowork:
    ldr r2, [r3, #12] ; load mult
    movs r7, r2
    beq .objlit ; built-in types have mult=0
    muls r7, r1
    lsrs r7, r2
    lsls r7, r7, #1 ; r7 - hash offset
    ldr r3, [r3, #4] ; iface table
    adds r3, r3, r7
; r0-this, r1-method idx, r2-free, r3-hash entry, r4-num args, r7-free
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    adds r3, #2
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    adds r3, #2
    ldrh r2, [r3, #0] ; r2-offset of descriptor
    ldrh r7, [r2, r3] ; r7-method idx
    cmp r7, r1
    beq .hit
    b .fail2
.object PUSH
.balign 4
_ldlit_49:
 .word _img40
_ldlit_50:
 .word _img41
.object POP
.hit:
    adds r3, r3, r2 ; r3-descriptor
    ldr r2, [r3, #4]
    lsls r7, r2, #31
    beq .field
; check for next descriptor
    ldrh r7, [r3, #8]
    cmp r7, r1
    bne .fail2 ; no setter!
    ldr r2, [r3, #12]
    movs r4, #2
    bx r2
.field:
    ldr r3, [sp, #4] ; ld-val
    str r3, [r0, r2] ; store field
    bx lr
.objlit:
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
.fail2:
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::missingProperty
    .object _pxt_helper_bind "helper: bind"
    .section code
_pxt_bind_helper:
    push {r0, r2}
    movs r0, #2
    ldr r1, _ldlit_52 ; _pxt_bind_lit      
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::mkAction
    pop {r1, r2}
    str r1, [r0, #12]
    str r2, [r0, #16]
    bx r4 ; return
_pxt_bind_lit:
    .word pxt::RefAction_vtable
    .short 0, 0 ; no captured vars
    .word .bindCode@fn
.bindCode:
; r0-bind object, r4-#args
    cmp r4, #12
    bge .fail
    lsls r3, r4, #2
    ldr r2, _ldlit_53 ; _pxt_copy_list      
    ldr r1, [r2, r3]
    ldr r3, [r0, #12]
    ldr r2, [r0, #16]
    adds r4, r4, #1
    bx r1
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
_pxt_copy_list:
    .word _pxt_bind_0@fn
    .word _pxt_bind_1@fn
    .word _pxt_bind_2@fn
    .word _pxt_bind_3@fn
    .word _pxt_bind_4@fn
    .word _pxt_bind_5@fn
    .word _pxt_bind_6@fn
    .word _pxt_bind_7@fn
    .word _pxt_bind_8@fn
    .word _pxt_bind_9@fn
    .word _pxt_bind_10@fn
    .word _pxt_bind_11@fn
_pxt_bind_0:
    sub sp, #4
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*1] ; store LR
    blx r2
    ldr r1, [sp, #4*1]
    add sp, #8
    bx r1
_pxt_bind_1:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*2] ; store LR
    blx r2
    ldr r1, [sp, #4*2]
    add sp, #8
    bx r1
_pxt_bind_2:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*3] ; store LR
    blx r2
    ldr r1, [sp, #4*3]
    add sp, #8
    bx r1
_pxt_bind_3:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*4] ; store LR
    blx r2
    ldr r1, [sp, #4*4]
    add sp, #8
    bx r1
_pxt_bind_4:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*5] ; store LR
    blx r2
    ldr r1, [sp, #4*5]
    add sp, #8
    bx r1
_pxt_bind_5:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*6] ; store LR
    blx r2
    ldr r1, [sp, #4*6]
    add sp, #8
    bx r1
_pxt_bind_6:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*7] ; store LR
    blx r2
    ldr r1, [sp, #4*7]
    add sp, #8
    bx r1
_pxt_bind_7:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    ldr r1, [sp, #4*7]
    str r1, [sp, #4*6]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*8] ; store LR
    blx r2
    ldr r1, [sp, #4*8]
    add sp, #8
    bx r1
_pxt_bind_8:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    ldr r1, [sp, #4*7]
    str r1, [sp, #4*6]
    ldr r1, [sp, #4*8]
    str r1, [sp, #4*7]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*9] ; store LR
    blx r2
    ldr r1, [sp, #4*9]
    add sp, #8
    bx r1
_pxt_bind_9:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    ldr r1, [sp, #4*7]
    str r1, [sp, #4*6]
    ldr r1, [sp, #4*8]
    str r1, [sp, #4*7]
    ldr r1, [sp, #4*9]
    str r1, [sp, #4*8]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*10] ; store LR
    blx r2
    ldr r1, [sp, #4*10]
    add sp, #8
    bx r1
_pxt_bind_10:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    ldr r1, [sp, #4*7]
    str r1, [sp, #4*6]
    ldr r1, [sp, #4*8]
    str r1, [sp, #4*7]
    ldr r1, [sp, #4*9]
    str r1, [sp, #4*8]
    ldr r1, [sp, #4*10]
    str r1, [sp, #4*9]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*11] ; store LR
    blx r2
    ldr r1, [sp, #4*11]
    add sp, #8
    bx r1
_pxt_bind_11:
    sub sp, #4
    ldr r1, [sp, #4*1]
    str r1, [sp, #4*0]
    ldr r1, [sp, #4*2]
    str r1, [sp, #4*1]
    ldr r1, [sp, #4*3]
    str r1, [sp, #4*2]
    ldr r1, [sp, #4*4]
    str r1, [sp, #4*3]
    ldr r1, [sp, #4*5]
    str r1, [sp, #4*4]
    ldr r1, [sp, #4*6]
    str r1, [sp, #4*5]
    ldr r1, [sp, #4*7]
    str r1, [sp, #4*6]
    ldr r1, [sp, #4*8]
    str r1, [sp, #4*7]
    ldr r1, [sp, #4*9]
    str r1, [sp, #4*8]
    ldr r1, [sp, #4*10]
    str r1, [sp, #4*9]
    ldr r1, [sp, #4*11]
    str r1, [sp, #4*10]
    push {r3} ; this-ptr
    mov r1, lr
    str r1, [sp, #4*12] ; store LR
    blx r2
    ldr r1, [sp, #4*12]
    add sp, #8
    bx r1
_code_end:
    .section code
    .object _code_helper__inst_builtin4_validate_0
_inst_builtin4_validate_0:
    lsls r2, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r2, [r3, #8]
    cmp r2, #4
    bne .fail
    bx lr
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
    .section code
    .object _code_helper__conv_1
_conv_1:
    @stackmark args
    push {lr}
    ldr r0, [sp, #4*1] ; estack
    bl _inst_builtin4_validate_0
    pop {pc}
    @stackempty args
    .section code
    .object _code_helper__inst_builtin9_validate_2
_inst_builtin9_validate_2:
    lsls r2, r0, #30
    bne .fail
    cmp r0, #0
    beq .fail
    ldr r3, [r0, #0]
; vtable in R3
    ldrh r2, [r3, #8]
    cmp r2, #9
    bne .fail
    bx lr
.fail:
    mov r1, lr
    mov r7, sp
    str r7, [r6, #4]
    bl pxt::failedCast
    .section code
    .object _code_helper__conv_3
_conv_3:
    @stackmark args
    push {lr}
    ldr r0, [sp, #4*2] ; estack
    bl _inst_builtin9_validate_2
    push {r0}
    ldr r0, [sp, #4*2] ; estack
    asrs r0, r0, #1
    bcs .isint2
    lsls r0, r0, #1
    bl _numops_toInt
.isint2:
    mov r2, r0      
    pop {r0, pc}      
    @stackempty args
_numops_adds:
    @scope _numops_adds
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r2, r1, #1
    adds r2, r0, r2
    bvs .boxed
    movs r0, r2
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::adds
                    add sp, #8
                    pop {pc}
_numops_subs:
    @scope _numops_subs
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r2, r1, #1
    subs r2, r0, r2
    bvs .boxed
    movs r0, r2
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::subs
                    add sp, #8
                    pop {pc}
_numops_ands:
    @scope _numops_ands
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    ands r0, r1
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::ands
                    add sp, #8
                    pop {pc}
_numops_orrs:
    @scope _numops_orrs
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    orrs r0, r1
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::orrs
                    add sp, #8
                    pop {pc}
_numops_eors:
    @scope _numops_eors
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    eors r0, r1
    adds r0, r0, #1
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::eors
                    add sp, #8
                    pop {pc}
_numops_lsls:
    @scope _numops_lsls
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    ; r3 := (r1 >> 1) & 0x1f
    lsls r3, r1, #26
    lsrs r3, r3, #27
    asrs r2, r0, #1
    lsls r2, r3
    lsrs r3, r2, #30
    beq .ok
    cmp r3, #3
    bne .boxed
.ok:
    lsls r0, r2, #1
    adds r0, r0, #1
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::lsls
                    add sp, #8
                    pop {pc}
.object PUSH
.balign 4
_ldlit_52:
 .word _pxt_bind_lit
_ldlit_53:
 .word _pxt_copy_list
.object POP
_numops_lsrs:
    @scope _numops_lsrs
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    ; r3 := (r1 >> 1) & 0x1f
    lsls r3, r1, #26
    lsrs r3, r3, #27
    asrs r2, r0, #1
    lsrs r2, r3
    lsrs r3, r2, #30
    bne .boxed
    lsls r0, r2, #1
    adds r0, r0, #1
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::lsrs
                    add sp, #8
                    pop {pc}
_numops_asrs:
    @scope _numops_asrs
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    ; r3 := (r1 >> 1) & 0x1f
    lsls r3, r1, #26
    lsrs r3, r3, #27
    asrs r0, r3
    movs r2, #1
    orrs r0, r2
    blx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                    bl numops::asrs
                    add sp, #8
                    pop {pc}
@scope _numops_toInt
_numops_toInt:
    asrs r0, r0, #1
    bcc .over
    blx lr
.over:
    lsls r0, r0, #1
    push {lr}
mov r7, sp
    str r7, [r6, #4]
bl pxt::toInt
pop {pc}
_numops_fromInt:
    lsls r2, r0, #1
    asrs r1, r2, #1
    cmp r0, r1
    bne .over2
    adds r0, r2, #1
    blx lr
.over2:
    push {lr}
mov r7, sp
    str r7, [r6, #4]
bl pxt::fromInt
pop {pc}
.section code
.object _pxt_helper_cmp_lt
_cmp_lt:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    blt .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::lt
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_gt
_cmp_gt:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    bgt .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::gt
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_le
_cmp_le:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    ble .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::le
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_ge
_cmp_ge:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    bge .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::ge
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_eq
_cmp_eq:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    beq .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::eq
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_eqq
_cmp_eqq:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    beq .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::eqq
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_neq
_cmp_neq:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    bne .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::neq
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
.section code
.object _pxt_helper_cmp_neqq
_cmp_neqq:
    lsls r2, r0, #31
    beq .boxed
    lsls r2, r1, #31
    beq .boxed
    subs r0, r1
    bne .true
.false:
    movs r0, #0
    bx lr
.true:
    movs r0, #1
    bx lr
.boxed:
    push {lr, r0, r1}      
                    mov r7, sp
    str r7, [r6, #4]
                        bl numops::neqq
                        bl numops::toBoolDecr
                        cmp r0, #0
                    add sp, #8
                    pop {pc}
_helpers_end:
.balign 4
.object _pxt_iface_member_names
_pxt_iface_member_names:
    .word 1
    .word _str104  ; 0 .
    .word 0
_vtables_end:
.balign 4
.object _pxt_config_data
_pxt_config_data:
    .word 0
.balign 4
_img0:
 .short 0xffff
        .short 5, 5
        .byte 0,255,0,255,0,255,255,255,255,255,255,255,255,255,255,0,255,255,255,0,0,0,255,0,0,0
.balign 4
_img1:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,0,255,0,0,255,255,255,0,0,0,255,0,0,0,0,0,0,0,0
.balign 4
_img2:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,0,255,0,0,0,0,0,0,255,0,0,0,255,0,255,255,255,0,0
.balign 4
_img3:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,0,255,0,0,0,0,0,0,0,255,255,255,0,255,0,0,0,255,0
.balign 4
_img4:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,0,255,0,0,0,0,0,0,0,255,0,255,0,255,0,255,0,255,0
.balign 4
_img5:
 .short 0xffff
        .short 5, 5
        .byte 255,0,0,0,255,0,255,0,255,0,0,0,0,0,0,255,255,255,255,255,255,0,255,0,255,0
.balign 4
_img6:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,255,255,0,255,255,0,0,0,0,0,0,255,255,255,0,0,0,0,0,0,0
.balign 4
_img7:
 .short 0xffff
        .short 5, 5
        .byte 0,255,0,255,0,0,0,0,0,0,0,0,255,0,0,0,255,0,255,0,0,0,255,0,0,0
.balign 4
_img8:
 .short 0xffff
        .short 5, 5
        .byte 255,0,0,0,255,0,0,0,0,0,255,255,255,255,255,0,0,0,255,255,0,0,0,255,255,0
.balign 4
_img9:
 .short 0xffff
        .short 5, 5
        .byte 255,255,255,255,255,255,255,0,255,255,0,0,0,0,0,0,255,0,255,0,0,255,255,255,0,0
.balign 4
_img10:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,255,255,0,0,0,0,0,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,0
.balign 4
_img11:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,0,0,0,255,0,0,0,255,0,255,0,255,0,0,0,255,0,0,0,0
.balign 4
_img12:
 .short 0xffff
        .short 5, 5
        .byte 255,0,0,0,255,0,255,0,255,0,0,0,255,0,0,0,255,0,255,0,255,0,0,0,255,0
.balign 4
_img13:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,0,255,0,0,0,255,0,255,0,255,255,255,255,255,0,0,0,0,0,0
.balign 4
_img14:
 .short 0xffff
        .short 5, 5
        .byte 255,0,0,0,0,255,255,0,0,0,255,0,255,0,0,255,0,0,255,0,255,255,255,255,255,0
.balign 4
_img15:
 .short 0xffff
        .short 5, 5
        .byte 0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,0
.balign 4
_img16:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,255,0,255,0,255,0,0,0,255,0,255,0,255,0,0,0,255,0,0,0
.balign 4
_img17:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,0,255,0,0,0,255,0,255,0,0,0,255,0,0,0,0,0,0,0,0
.balign 4
_img18:
 .short 0xffff
        .short 5, 5
        .byte 255,255,255,255,255,255,0,0,0,255,255,0,0,0,255,255,0,0,0,255,255,255,255,255,255,0
.balign 4
_img19:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,255,255,0,0,255,0,255,0,0,255,255,255,0,0,0,0,0,0,0
.balign 4
_img20:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,0,255,255,255,0,255,0,0,0,255,0,0,255,255,0,255,0,255,255,0,0,255,0
.balign 4
_img21:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,255,255,255,255,255,255,255,0,255,255,255,0,0,255,255,255,0,0,255,255,255,0,0
.balign 4
_img22:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,255,255,0,0,0,255,255,255,255,255,255,255,255,255,255,255,255,0,255,0,255,0,0
.balign 4
_img23:
 .short 0xffff
        .short 5, 5
        .byte 0,255,255,0,0,255,255,255,0,0,0,255,255,255,255,0,255,255,255,0,0,0,0,0,0,0
.balign 4
_img24:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,255,255,255,0,255,255,255,255,255,0,255,255,255,0,0,255,0,255,0,0
.balign 4
_img25:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,255,255,255,0,255,255,255,255,255,0,255,0,255,0,0,0,0,0,0,0
.balign 4
_img26:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,255,255,255,255,255,255,255,0,0,255,0,0,255,255,255,255,255,255,255,0,255,255,0
.balign 4
_img27:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,255,255,255,255,255,0,0,255,0,0,0,255,0,255,0,255,0,0,0,255,0
.balign 4
_img28:
 .short 0xffff
        .short 5, 5
        .byte 0,255,255,255,0,255,0,255,0,255,255,255,255,255,255,255,255,255,255,255,255,0,255,0,255,0
.balign 4
_img29:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,0,255,255,255,0,0,0,255,0,0,0
.balign 4
_img30:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,255,255,0,0,255,0,255,0,0
.balign 4
_img31:
 .short 0xffff
        .short 5, 5
        .byte 0,255,255,255,0,255,0,255,0,255,255,255,255,255,255,0,255,255,255,0,0,255,255,255,0,0
.balign 4
_img32:
 .short 0xffff
        .short 5, 5
        .byte 0,255,255,255,0,255,255,255,255,255,0,0,255,0,0,255,0,255,0,0,255,255,255,0,0,0
.balign 4
_img33:
 .short 0xffff
        .short 5, 5
        .byte 255,255,0,0,0,255,255,0,255,255,0,255,0,255,0,0,255,255,255,0,0,0,0,0,0,0
.balign 4
_img34:
 .short 0xffff
        .short 5, 5
        .byte 255,0,255,0,0,255,0,255,0,0,255,255,255,255,0,255,255,0,255,0,255,255,255,255,0,0
.balign 4
_img35:
 .short 0xffff
        .short 5, 5
        .byte 255,0,0,0,255,255,0,0,0,255,255,255,255,255,255,0,255,255,255,0,0,0,255,0,0,0
.balign 4
_img36:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,0,255,0,0,0,0,255,0,0,255,255,255,0,0,255,255,255,0,0,0
.balign 4
_img37:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,0,255,255,0,0,0,255,0,255,255,255,255,0,0,255,255,255,0,0,0
.balign 4
_img38:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,0,255,255,0,0,0,255,0,255,255,255,255,0,0,255,255,255,0,0,0
.balign 4
_img39:
 .short 0xffff
        .short 5, 5
        .byte 255,0,255,0,255,255,0,255,0,255,255,255,255,255,255,0,0,255,0,0,0,0,255,0,0,0
.balign 4
_img40:
 .short 0xffff
        .short 5, 5
        .byte 0,0,255,0,0,0,255,255,255,0,255,255,0,255,255,0,255,255,255,0,0,0,255,0,0,0
.balign 4
_img41:
 .short 0xffff
        .short 5, 5
        .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
            .balign 4
            .object _str104
_str104:
 .word pxt::string_inline_ascii_vt
    .short 0
    .string ""
            .balign 4
            .object _str42
_str42:
 .word pxt::string_inline_ascii_vt
    .short 1
    .string "D"
            .balign 4
            .object _str43
_str43:
 .word pxt::string_inline_ascii_vt
    .short 1
    .string "F"
            .balign 4
            .object _str44
_str44:
 .word pxt::string_inline_ascii_vt
    .short 1
    .string "M"
            .balign 4
            .object _str45
_str45:
 .word pxt::string_inline_ascii_vt
    .short 1
    .string "U"
            .balign 4
            .object _str46
_str46:
 .word pxt::string_inline_ascii_vt
    .short 18
    .string "raise-tower-bridge"
.balign 4
.section code
.object _perf_counters
_pxt_perf_counters:
    .word 0
_literals_end:
