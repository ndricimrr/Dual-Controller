`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    MotorStarter
//
// Description: This module takes as inputs an enable and a direction signal ('on' and 'dir') from 
/*              the upper module MotorController and defines the output signals for the motor. 
                Subsequently these output signals are sent to the highest module on this hiearchy 
                of instantiations (DriverController module) resulting in a 4 bit signal which will 
                be transimitted to the motors. 
*/
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module MotorStarter(input logic clk, on, dir, // 1 will stand for clockwise, 0 for CC
                    output logic [3:0] out );
	 
	 //Parameters 
	 typedef enum logic [1:0] {S0,S1,S2,S3} statetype ;
     statetype state, nextState;
	 
	 //State Register
	 always @(posedge clk, posedge on)
       if (on) state <= S0;
       else state <= nextState;
	 
	 //next State Logic:  Move to next upper state ( S0 -> S1 ) if clockwise, next lower state (S1 -> S0) if CC
	 always @ (*) 
		case ( state )
			S0: if (dir) nextState = S1;
				 else nextState = S3;
			S1: if (dir) nextState = S2;
				 else nextState = S0;
			S2: if (dir) nextState = S3;
				 else nextState = S1;
			S3: if (dir) nextState = S0;
				 else nextState = S2;				 
			default: nextState = S0;
		endcase
			
	//output logic 
	// Outputs the respective signal for each state as follwing
	// S0: 1010   S1: 0110   S2: 0101   S3: 1001
	always @ (*) 
		case (state) 
			S0: out = 4'b1010;
			S1: out = 4'b0110;
			S2: out = 4'b0101;
			S3: out = 4'b1001;
			default: out = 4'b1010;
		endcase
endmodule
