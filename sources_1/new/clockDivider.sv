`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    clockDivider
//
// Description: This module takes as inputs Basys3's built in 100Mhz clock and also a 
/*              28 bit decimal number which defines by how much the clock is going to 
                be divided and then generates the new divided slower clock as an output. 
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////
module clockDivider(input logic clk,[29:0] stateToGo, 
                    output logic clk_2s);
    logic [28:0]state = 0;
    logic [29:0]nextState = 0;
    
    //State register
    always@ (posedge clk)
    begin
        state <= nextState;
    end
    
    // New CLK
    always @(posedge clk)
    begin
        if (state == stateToGo)
            clk_2s = 1;
        else
            clk_2s = 0;
    end
    
    // next State for CLK
    always @(posedge clk) 
    begin
        if (state == stateToGo)
            nextState = 0;
        else
            nextState = state + 1;
    end
endmodule
