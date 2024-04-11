/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #4                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #4 Edge Triggered Flip Flop                               ***
***                                                                      ***
****************************************************************************
*** Filename: dff.v          Created by Steven Hernandez, 9/26/23        ***
***                                                                      ***
****************************************************************************
*** This module is for a dff:                                            ***
*** Here I am making a dff using my sr latch file with specific delays   ***  
****************************************************************************/

`timescale 1 ns/ 100 ps
`define PRIMARY_OUT	2	//ns (primary outputs)
`define TIME_DELAY_1	3	//ns (one input gates)
`define TIME_DELAY_2	4	//ns (two input gates)
`define TIME_DELAY_3	5	//ns (three input gates)
`define FAN_OUT_1	0.5	//ns (one output fanout)
`define FAN_OUT_2	0.8	//ns (two output fanout)
`define FAN_OUT_3	1	//ns (one output fanout)

module dff(q, qbar, clock, data, clear);
	output q, qbar;			//input for circuit
	input clock, data, clear;		//output for circuit

	wire cbar, clkbar, dbar, clr, clk, d, sbar, s, r, rbar, q, qbar;

    not #(`TIME_DELAY_1 + `FAN_OUT_1) n1(cbar,clear);  //1 in, 1 out
    not #(`TIME_DELAY_1 + `FAN_OUT_3) n2(clr, cbar);  //1 in, 3 out
    not #(`TIME_DELAY_1 + `FAN_OUT_1) n3(clkbar,clock); //1 in, 1 out
    not #(`TIME_DELAY_1 + `FAN_OUT_2) n4(clk, clkbar); //1 in, 2 out
    not #(`TIME_DELAY_1 + `FAN_OUT_1) n5(dbar, data); //1 in, 1 out
    not #(`TIME_DELAY_1 + `FAN_OUT_1) n6(d, dbar); //1 in, 1 out
	
	SR_Latch SRL1(sbar, s, rbar, 1'b1, clr, clk); 
	SR_Latch SRL2(r, rbar, s, clk, clr, d);
	SR_Latch SRL3(q, qbar, s, 1'b1, clr, r);

endmodule
