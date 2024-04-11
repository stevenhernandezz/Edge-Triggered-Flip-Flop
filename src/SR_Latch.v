/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #4                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #4 Edge Triggered Flip Flop                                ***
***                                                                      ***
****************************************************************************
*** Filename: SR_Latch.v          Created by Steven Hernandez, 9/26/23     ***
***                                                                      ***
****************************************************************************
*** This module is for a SR Latch:                                        ***
*** Here I will be making an sr latch with delays to implement to a dff   ***  
****************************************************************************/

`timescale 1 ns/ 100 ps
`define PRIMARY_OUT	2	//ns (primary outputs)
`define TIME_DELAY_1	3	//ns (one input gates)
`define TIME_DELAY_2	4	//ns (two input gates)
`define TIME_DELAY_3	5	//ns (three input gates)
`define FAN_OUT_1	0.5	//ns (one output fanout)
`define FAN_OUT_2	0.8	//ns (two output fanout)
`define FAN_OUT_3	1	//ns (one output fanout)

module SR_Latch(Q, Qnot, s0, s1, r0, r1);
	output Q, Qnot;			//input for circuit
	input s0, s1, r0, r1;		//output for circuit

	nand #(`TIME_DELAY_3 + `PRIMARY_OUT + `FAN_OUT_2)  NAND1(Q,s0,s1,Qnot);	//first nand gate
	nand #(`TIME_DELAY_3 + `FAN_OUT_2 + `PRIMARY_OUT)  NAND2(Qnot,r0,r1,Q); //seconds nand gate

endmodule
