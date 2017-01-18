`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    Comparator
//
// Description: This module takes as inputs a the state of the person making the request. Later by comparing 
/*              the state of the person with the state of the elevators, this module defines which of the elevators 
                will come to the user. This decision is made by comparing which of the elevators is closer 
                to the user.  
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module Comparator(  input logic [3:0] stateElev1, stateElev2, statePerson, 
                    output logic enableElev1, enableElev2   );
    // elevator 1 has priority because why not
    logic [1:0] en;
    
    // Initialization
    initial 
    begin
        enableElev1 <= 1'b0;
        enableElev2 <= 1'b0;
    end
    
    // Decide which of the elevators should be enabled
    always@(*)
    begin
    if ( statePerson != 4'b0000)
        begin 
            case({stateElev1, stateElev2, statePerson})
            12'b0001_0001_0001: en <= 	  2'b10;
            12'b0001_0001_0010: en <=     2'b10;
            12'b0001_0001_0100: en <=     2'b10;
            12'b0001_0001_1000: en <=     2'b10;
            12'b0001_0010_0001: en <=     2'b10;
            12'b0001_0010_0010: en <=     2'b01;
            12'b0001_0010_0100: en <=     2'b01;
            12'b0001_0010_1000: en <=     2'b01;
            12'b0001_0100_0001: en <=     2'b10;
            12'b0001_0100_0010: en <=     2'b10;
            12'b0001_0100_0100: en <=     2'b01;
            12'b0001_0100_1000: en <=     2'b01;
            12'b0001_1000_0001: en <=     2'b10;
            12'b0001_1000_0010: en <=     2'b10;
            12'b0001_1000_0100: en <=     2'b01;
            12'b0001_1000_1000: en <=     2'b01;
            12'b0010_0001_0001: en <=     2'b01;
            12'b0010_0001_0010: en <=     2'b10;
            12'b0010_0001_0100: en <=     2'b10;
            12'b0010_0001_1000: en <=     2'b10;
            12'b0010_0010_0001: en <=     2'b10;
            12'b0010_0010_0010: en <=     2'b10;
            12'b0010_0010_0100: en <=     2'b10;
            12'b0010_0010_1000: en <=     2'b10;
            12'b0010_0100_0001: en <=     2'b10;
            12'b0010_0100_0010: en <=     2'b10;
            12'b0010_0100_0100: en <=     2'b01;
            12'b0010_0100_1000: en <=     2'b01;
            12'b0010_1000_0001: en <=     2'b10;
            12'b0010_1000_0010: en <=     2'b10;
            12'b0010_1000_0100: en <=     2'b10;
            12'b0010_1000_1000: en <=     2'b01;
            12'b0100_0001_0001: en <=     2'b01;
            12'b0100_0001_0010: en <=     2'b10;
            12'b0100_0001_0100: en <=     2'b10;
            12'b0100_0001_1000: en <=     2'b10;
            12'b0100_0010_0001: en <=     2'b01;
            12'b0100_0010_0010: en <=     2'b01;
            12'b0100_0010_0100: en <=     2'b10;
            12'b0100_0010_1000: en <=     2'b10;
            12'b0100_0100_0001: en <=     2'b10;
            12'b0100_0100_0010: en <=     2'b10;
            12'b0100_0100_0100: en <=     2'b10;
            12'b0100_0100_1000: en <=     2'b10;
            12'b0100_1000_0001: en <=     2'b10;
            12'b0100_1000_0010: en <=     2'b10;
            12'b0100_1000_0100: en <=     2'b10;
            12'b0100_1000_1000: en <=     2'b01;
            12'b1000_0001_0001: en <=     2'b01;
            12'b1000_0001_0010: en <=     2'b01;
            12'b1000_0001_0100: en <=     2'b10;
            12'b1000_0001_1000: en <=     2'b10;
            12'b1000_0010_0001: en <=     2'b01;
            12'b1000_0010_0010: en <=     2'b01;
            12'b1000_0010_0100: en <=     2'b10;
            12'b1000_0010_1000: en <=     2'b10;
            12'b1000_0100_0001: en <=     2'b01;
            12'b1000_0100_0010: en <=     2'b01;
            12'b1000_0100_0100: en <=     2'b01;
            12'b1000_0100_1000: en <=     2'b10;
            12'b1000_1000_0001: en <=     2'b10;
            12'b1000_1000_0010: en <=     2'b10;
            12'b1000_1000_0100: en <=     2'b10;
            12'b1000_1000_1000: en <=     2'b10;
            endcase
        end         
    end
  
    // Translate 'en' to enable signals for each elevator
    always@*
    begin
        case(en)
            2'b01 : begin
                enableElev1 <= 1'b0;
                enableElev2 <= 1'b1;
            end
            2'b10 : begin
                enableElev1 <= 1'b1;
                enableElev2 <= 1'b0;
            end 
        endcase
    end  
endmodule
