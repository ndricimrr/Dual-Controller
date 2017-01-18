`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    MotorController
//
// Description: This module takes as inputs an enable signal for the motor and the direction of the motor 
/*              ('on' and 'dir') .  These inputs are taken from the DriverController module.  This module 
                has also an internal logic block which is used to define the speed of the elevator, which we 
                thought to be static since the user shouldn't be allowed to change the speed of the elevator.
                However we used this module in order to make this project usable even by other implmenters 
                who might need to use the same project with a different speed. This module also calls an 
                internal instance of the MotorStarter module.
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module MotorController(input logic clk, on, dir,
                       output logic [3:0] out
                       );
	 
	 logic countReached = 0;
	 int counter = 0;
	 logic [25:0] speed ;
	 initial
	 begin
	   speed <= 26'd230000;
	 end 
	 //Counter Loop
	 	always @ ( posedge clk ) 
		if ( counter == speed) 
		begin
            counter <= 26'b0;
            countReached <= 1'b1;
        end
		else
        begin
		    counter <= counter +1;
			countReached <= 0;			
		end
		
		//Start MotorDriver
		MotorStarter motor ( countReached, ~on, dir, out );
endmodule
