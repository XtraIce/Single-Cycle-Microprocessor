# Single-Cycle-Microprocessor
MIPS based limited instruction set single-cycle Microprocessor.

In the ISE Project Navigator, hierarchy should be as follows:
<b>
Processor_tb
  SCP - Single_Cycle_Processor
    CU00 - Control Unit
      MD00 - CU_MainDecoder
      AD00 - CU_ALUDecoder
    IM00 - instruction_memory
    RF00 - WFRegisterFile
    A00 -  ALU
      AU00 - Arithmetic_unit
      LU00 - Logic_unit
      MX00 - ALmux_unit
    SE00 - SignExtend
    DM00 - data_memory
    PC00 - PC_ProgramCounter
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
  
