/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #4                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #4 Edge Triggered Flip Flop                               ***
***                                                                      ***
****************************************************************************
*** Filename: dff_tb.v          Created by Steven Hernandez, 9/26/23     ***
***                                                                      ***
****************************************************************************
*** This module is a testbench for a dff:                                ***
*** Here I will be testing all possible inputs for the dff                ***
*** I will also be using $monitor, $write, $strobe, and $display to show ***
*** how to implement these different commands                             ***
****************************************************************************/


`timescale 1 ns / 100 ps

`define MONITOR_STR_1 "%d: data = %b, clear = %b, clock = %b | q = %b qbar = %b"

module dff_tb;
  reg clock, data, clear;
  wire q, qbar;

  // Instantiate D flip-flop module
  dff UUT(.q(q), .qbar(qbar), .clock(clock), .data(data), .clear(clear));

  initial begin
    $monitor(`MONITOR_STR_1, $time, data, clear, clock, q, qbar);
    end

  initial begin
  $vcdpluson;
  $display("                               Lab 4 Simulation Outputs "); 
  $write("                                 data = %b at the start of simulation", data);
  
  #100 data = 0; clear = 0; clock = 0;
  #100 data = 1'b0; clear = 1'b0; clock = 1'b0;
  #100 data = 1'b0; clear = 1'b0; clock = 1'b1;
  $strobe("strobe:       q=%b, qbar=%b", q, qbar);
  #100 data = 1'bx; clear = 1'b0; clock = 1'bx;
  #100 data = 1'b0; clear = 1'b1; clock = 1'b0;
  $strobe("strobe:       q=%b, qbar=%b", q, qbar);
  #100 data = 1'b1; clear = 1'b1; clock = 1'b1;
  #100 data = 1'bx; clear = 1'b1; clock = 1'b0;
  #100 data = 1'bx; clear = 1'b1; clock = 1'b1;
  $strobe("strobe:        q=%b, qbar=%b", q, qbar);
  #100 data = 1'b1; clear = 1'b1; clock = 1'b1;
  #100 data = 1'bx; clear = 1'b1; clock = 1'b0;
  $strobe("strobe:        q=%b, qbar=%b", q, qbar);
  
  #100 $finish;
  end

endmodule
