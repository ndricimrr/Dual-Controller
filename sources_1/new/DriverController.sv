`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    DriverController
//
// Description: This module takes as inputs  a slower 2Hz clock used to check the state of the motor, 
/*              it's destination floor and set the motor on move depending on the enable input (go1 / go2) 
                taken from the Queue module. This check is made under the positive edge of the 2Hz slower clock. 
                Moreover this module has an instance of MotorController module to which it gives the enable and
                direction signal, respectively (on and dir) in order for it to generate the output for the motor 
                (4 bit out ). In this project we will be using two instances of this module respectively one for 
                the first and the other for the second elevator which is why we have indicated in the block diagram 
                inputs and outputs consisting of a seprating slash  '/' sign. 
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////

module DriverController(input logic clk, clk_2s, go, en, [3:0] cState, des, 
                        output logic [3:0] newSt, out, output logic on);
	
	logic  dir,en2;
	
	// Initialize firs values
	initial begin
        on <= 0;
        dir <= 0;
        newSt <= cState;
   	end
   	
   	always@*
   	begin
   	  en2 <= en;
   	end
	
	always @ ( posedge clk_2s )
	begin	
        if(go==1'b1 && en2 == 1'b1 && des != 4'b1111) 
        begin
        if(des > cState && des != 4'b1111) 
            begin
                case ( cState ) 
                    4'b0001: newSt <= 4'b0010;
                    4'b0010: newSt <= 4'b0100;
                    4'b0100: newSt <= 4'b1000;
                endcase
                on <= 1;
                dir <= 1;
            end
        else if (cState > des && des != 4'b1111)
            begin
                case ( cState ) 					
                    4'b0010: newSt <= 4'b0001;
                    4'b0100: newSt <= 4'b0010;
                    4'b1000: newSt <= 4'b0100;
                endcase
                on <= 1;
                dir <= 0;
            end
        else
            on <= 0;
        end
        else
            begin
                newSt <= cState;
                on <= 0;
            end 
        end
		
	MotorController motorController (clk,on,dir,out);
endmodule
