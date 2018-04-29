# Single-Cycle-Microprocessor
MIPS based limited instruction set single-cycle Microprocessor.

In the ISE Project Navigator, hierarchy should be as follows:
<b>
1. Processor_tb
  a. SCP - Single_Cycle_Processor
    I. CU00 - Control Unit
      i. MD00 - CU_MainDecoder
     ii. AD00 - CU_ALUDecoder
   II. IM00 - instruction_memory
  III. RF00 - WFRegisterFile
   IV. A00 -  ALU
      i. AU00 - Arithmetic_unit
     ii. LU00 - Logic_unit
    iii. MX00 - ALmux_unit
    V. SE00 - SignExtend
   VI. DM00 - data_memory
  VII. PC00 - PC_ProgramCounter
</b>    
The naming of some files is not standard, apologies.
Make sure to have the "prog.dat" file in a local directory.
This file contains instructions that are loaded into the instruction memory.

-------------------------------------------------------------------------------------
Limited Instruction set. Instructions include:
<b>  R-type </b>
      add
      sub
      and
      or
      mult 
      sll
      srl
      slt
 <b> I-type </b>
      lw
      sw
      addi
      beq
 <b> J-type <b>
      j
------------------------------------------------------------------------------------------
Click "Simulate Behavorial Model" when the "Processor_tb" is selected.
An output waveform should be produced.

If you desire to see a specific modules waveforms (ex. Register_File):
<b>
  1. Click the drop-down arrow in the "Processor_tb"
  2. Click the drop-down arrow in the "SCP"
  3. Click and drag the module (in this case RF00) into the waveform window.
  4. On the navigation bar at the top, click Simulation > Restart, then Simulation > Run All.
  5. WaveForms should be produced. Click "Zoom to full view" to have the full waveform shown.
</b>
  
