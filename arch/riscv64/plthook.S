/*
 * Based on glibc/ports/sysdeps/riscv/dl-trampoline.S
 */

#include "utils/asm.h"

.text

.macro save_args
	sd a7, 56(sp)
	sd a6, 48(sp)
	sd a5, 40(sp)
	sd a4, 32(sp)
	sd a3, 24(sp)
	sd a2, 16(sp)
	sd a1, 8(sp)
	sd a0, 0(sp)
.endm

.macro restore_args
	ld a0, 0(sp)
	ld a1, 8(sp)
	ld a2, 16(sp)
	ld a3, 24(sp)
	ld a4, 32(sp)
	ld a5, 40(sp)
	ld a6, 48(sp)
	ld a7, 56(sp)
.endm

/* TODO: not implemented yet (Start) */
ENTRY(plt_hooker)
	sd t1, 72(sp)
	sd t0, 64(sp)

	/* save arguments */
	save_args

	/* ret_addr argument */
	addi a0, sp, 80

	/* child_idx argument */
	ld a1, 72(sp)
	sub a1, a1, t3
	srli a1, a1, 3
	addi a1, a1, -1

	/* module_id argument */
	ld a2, t3
	addi a2, a2, -8

	/* mcount_regs argument */
	//mv a3, sp

	/* call plthook_entry func */
	//call plthook_entry


END(plt_hooker)

ENTRY(plthook_return)
END(plthook_return)
/* TODO: not implemented yet (End) */
