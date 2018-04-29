# Single-Cycle-Microprocessor
MIPS based limited instruction set single-cycle Microprocessor.

<b>In the ISE Project Navigator, hierarchy should be as follows:</b>
 <p>
>Processor_tb <br/>
->SCP - Single_Cycle_Processor <br/>
--->CU00 - Control Unit <br/>
----->MD00 - CU_MainDecoder <br/>
----->AD00 - CU_ALUDecoder <br/>
--->IM00 - instruction_memory <br/>
--->RF00 - WFRegisterFile <br/>
--->A00 -  ALU <br/>
----->AU00 - Arithmetic_unit <br/>
----->LU00 - Logic_unit <br/>
----->MX00 - ALmux_unit <br/>
--->SE00 - SignExtend <br/>
--->DM00 - data_memory <br/>
--->PC00 - PC_ProgramCounter <br/>
  
  //I can't HTML, so doing indents like this to show hiearchy was my only simple way.
</p>    
The naming of some files is not standard, apologies.
Make sure to have the "prog.dat" file in a local directory.
This file contains instructions that are loaded into the instruction memory.

Limited Instruction set.
------------------------------
Instructions include: <br/>

<b>  R-type </b> <br/>
      add <br/>
      sub<br/>
      and<br/>
      or<br/>
      mult <br/>
      sll<br/>
      srl<br/>
      slt<br/>
 <b> I-type </b><br/>
      lw<br/>
      sw<br/>
      addi<br/>
      beq<br/>
 <b> J-type </b> <br/>
      j<br/>

Simulating
-----------------
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
  
