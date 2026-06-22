# 4-bit ALU — SystemVerilog Design & Verification

SystemVerilog Self-Checking TB SVA Assertions 94% Coverage

## Overview
A 4-bit Arithmetic Logic Unit supporting 8 operations, verified with an
industry-style SystemVerilog testbench featuring constrained-random
stimulus, a reference model scoreboard, SVA assertions, and functional
coverage closure.

## DUT — ALU_4bit.v
| sel | Operation     | Notes                    |
|-----|---------------|--------------------------|
| 000 | ADD           | 4-bit wrap-around        |
| 001 | SUB (a-b)     |                          |
| 010 | SUB (b-a)     |                          |
| 011 | AND           |                          |
| 100 | OR            |                          |
| 101 | NOT a         | b input unused           |
| 110 | SHIFT RIGHT a | LSB dropped              |
| 111 | SHIFT LEFT a  | MSB dropped              |

## Testbench — tb_ALU_4bit_improved.sv
**Self-checking scoreboard**: every result auto-compared against a
reference model — zero human log-reading required.

**Constrained-random stimulus**: 200 random vectors using a transaction
class with corner-case constraints (0x0 and 0xF appear 12% of the time).

**SVA concurrent assertions**: ADD, AND, OR, NOT correctness checked
every clock cycle — fires immediately on violation.

**Functional coverage**: covergroup with cross coverage between all
8 operations and all 3 input corner categories. Result: **94% coverage**.

## How to Run
Paste src/ALU_4bit.v and src/tb_ALU_4bit_improved.sv into
https://edaplayground.com — select SystemVerilog 2012, run.

## Files
- src/ALU_4bit.v — RTL design
- src/tb_ALU_4bit.v — original directed testbench
- src/tb_ALU_4bit_improved.sv — upgraded industry-style TB
