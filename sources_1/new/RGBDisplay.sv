`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    RGBDisplay
//
// Description: This module takes as inputs the current state of each elevator and displays it on the the two last 
/*              columns on the right of the 8x8 RGB field. The first four rows are used for displaying the state 
                of the first elevator whilst the second four rows are used for the second elevators. The display 
                is bottom to top respectively first floor to fourth floor. The main part of this code was based 
                on a code given to us through UNILICA.
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module RGBDisplay( input logic clk,  [3:0] elevator1, elevator2,
                   output logic [1:0]row, 
                   output logic ST_CP, SH_CP, OE, MR, data);
                   
       logic [23:0] out;
       logic [7:0]count;
       logic in;

       initial begin
           row <= 8'b11;
           out <= 24'b00000000_00000000_00000000;
           ST_CP <= 1'b0;
           OE <= 1'b0;
           MR <= 1'b1;
           data <= 1'b0;
           count = 8'd1;
           in <= 1'b0;
       end
       
       always @*
           begin
                // elevator 1 : first floor / elevator 2 moves 
                if (elevator1 == 4'b0001 && elevator2 ==4'b0001)
                     out <= 24'b00010000_00000001_00000000;
                else if (elevator1 == 4'b0001 && elevator2 ==4'b0010)  
                     out <= 24'b00010000_00000010_00000000;
                else if (elevator1 == 4'b0001 && elevator2 ==4'b0100)  
                     out <= 24'b00010000_00000100_00000000;                 
                else if (elevator1 == 4'b0001 && elevator2 ==4'b1000)  
                     out <= 24'b00010000_00001000_00000000;      
                     
                 // elevator 1 : second floor / elevator 2 moves                      
                else if (elevator1 == 4'b0010 && elevator2 ==4'b0001)  
                    out <= 24'b00100000_00000001_00000000;
                else if (elevator1 == 4'b0010 && elevator2 ==4'b0010)  
                    out <= 24'b00100000_00000010_00000000;
               else if (elevator1 == 4'b0010 && elevator2 ==4'b0100)  
                    out <= 24'b00100000_00000100_00000000;                    
               else if (elevator1 == 4'b0010 && elevator2 ==4'b1000)  
                    out <= 24'b00100000_00001000_00000000;
               
               // elevator 1 : third floor / elevator 2 moves                                       
               else if (elevator1 == 4'b0100 && elevator2 ==4'b0001)  
                    out <= 24'b01000000_00000001_00000000;  
                else if (elevator1 == 4'b0100 && elevator2 ==4'b0010)  
                    out <= 24'b01000000_00000010_00000000;
                else if (elevator1 == 4'b0100 && elevator2 ==4'b0100)  
                    out <= 24'b01000000_00000100_00000000;
                else if (elevator1 == 4'b0100 && elevator2 ==4'b1000)  
                    out <= 24'b01000000_00001000_00000000;
                    
                 // elevator 1 : fourth floor / elevator 2 moves                                         
                else if (elevator1 == 4'b1000 && elevator2 ==4'b0001)  
                    out <= 24'b10000000_00000001_00000000;
                else if (elevator1 == 4'b1000 && elevator2 ==4'b0010)  
                    out <= 24'b10000000_00000010_00000000;
                else if (elevator1 == 4'b1000 && elevator2 ==4'b0100)  
                    out <= 24'b10000000_00000100_00000000;
                else if (elevator1 == 4'b1000 && elevator2 ==4'b1000)  
                    out <= 24'b10000000_00001000_00000000;
                                                                                                     
                else  
                     out[7:0] <= 24'b00000000;  row <= 8'b00000011;                              
           end
        
       always @(posedge SH_CP) 
            begin
                if (count >= 1'b0 || count <=23)
                    in <= out[count];
                else 
                     in <= 1'b1;
                     
               if(count <= 8'd24) 
                   begin
                        ST_CP <= 1'b0;
                        count <= count + 1;       
                   end          
               else
                   begin
                        ST_CP <= 1'b1;
                        count <= 8'd0;
                    end    
           data <= in;
       end
       
RGBClockDivider clockDiv (clk, SH_CP);
endmodule