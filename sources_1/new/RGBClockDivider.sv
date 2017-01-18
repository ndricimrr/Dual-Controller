`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    clockDivider
//
// Description: This module takes as inputs basys3 built in 100Mhz clk and generates a new clock SH_CP for the RGB 
//              display to take as an internal input.
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module RGBClockDivider(input logic clk,
                       output logic SH_CP);
                       
   logic [26:0] count, nextcount;
   logic [26:0] size; 
   
   initial
   begin
    size <= 27'b000000000000000000110100011;
   end
   
   always_ff @(posedge clk)
   begin
       if(count == size)begin
           count <= 0;
           SH_CP <= ~SH_CP;
           end
       else if(count == size / 2)begin
           count <= nextcount;
           SH_CP <= ~SH_CP;
           end
       else
           count <= nextcount;        
   end  
      
   always_comb
       nextcount = count + 1;
endmodule
