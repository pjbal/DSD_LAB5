# LAB5
Devices and components for DSD LAB5

Lab 4- Hierarchy Design:

•	64 x 8-bit Static RAM 						(sixtyFour_by_four_SRAM)
  o	64 x 4-bit Static RAM					(sixtyFour_by_four_SRAM)
    	([1]) 3-to-8 decoder with output enable (provided)	 (three_to_eight_decoder)
    	8 x 4-bit Static RAM (provided) 			(eight_by_four_sram)
      •	3-to-8 decoder with output enable (provided) (three_to_eight_decoder)
      •	n-bit tri-state buffer (lab3) 		(nbit_tri_buff.vhd)
        o	Tri-state buffer (lab3) 		(tri_buff.vhd)
      •	m x n-bit Static RAM cell array 		(m_by_n_sram_array)
        o	Static RAM Cell			(staticRAM_cell.vhd)
          	D-latch			(dLatch.vhd)
            •	Not gate (lab1)	 (Inverter_VHDL.vhd)
            •	2- input And (lab1) (TwoInputAND_VHDL.vhd)
            •	2-input NOR	(TwoInputNOR_VHDL.vhd)
        	Tri-state buffer (lab2)	(tri_buff.vhd)
        	2- input And (lab1) 	(TwoInputAND_VHDL.vhd)

•	([2])8 x n-bit Register File					(eight_by_nbit_regFile.vhd
  o	n-bit RFC register					(nbit_RFC_reg.vhd)
    	Register File Cell (RFC)			(reg_fileCell.vhd)
      •	2-input mux (lab1) 		(TwoInputMultiplexor_VHDL.vhd)
      •	D flip-flop (lab3)			 (dFlipFlop.vhd)
      •	Tri-state buffer (lab3) 		(tri_buff.vhd)

•	([4)] TDM (time division multiplex) display circuit		(TDM_dis.vhd)
   o	T flip-flop (provided lab3) 				(T_flipflop.vhd)
   o	N-bit tristate buffer (lab3) 				(nbit_tri_buff.vhd)
     	Tri-state buffer (lab3) 			(tri_buff.vhd)
   o	([3]) 16 x 7-bit seven-segment decoder ROM (sixteen_by_sevenbit _sevSegDis_decROM)
