`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Description : This module takes as inputs the newState from the DriverController and also the destination defined by a 4 bit
/*               input which is generated from the KeypadController. In order to observe the flow of states and to make the motor
                 rotate for a period of  2 seconds per floor this module also uses a clock divider which generates a slower clock
                 used to update the state on each positive edge. According to these inputs this module also defines when and 
                 where the elevator should go by using a queue logic block implemented by using a part which adds a button pressed
                 and another part which checks if current state matches the request button. 
*/

// Module Name:    QUEUE
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////
module QUEUE(input logic clk,
            input logic clk_2s,
            input logic enable, 
            input logic [3:0] keyCode, // From KeyboarController Module
            input logic [3:0] newState, // From DriverController Module 
            output logic go, // to DriverController Module
            output logic [3:0] cState, // To DriverController & SegmentDisplay Modules
            output logic[3:0] des // To DriverController Module
           );
   	
	logic[3:0] currSt = 4'b0001,	FirstChoice = 4'b1111,	SecondChoice = 4'b1111,	ThirdChoice = 4'b1111,	FourthChoice = 4'b1111;
	logic check;
	//continuous assignment
	assign cState = currSt; // set to first floor 4'b1
	assign des = FirstChoice; // initially 4'b1111

	always@(negedge clk)
	 begin
		// adds the new choice to Queue (button pressed)
		if( (keyCode == 4'b0010 || keyCode == 4'b0100 || keyCode == 4'b1000 || keyCode == 4'b0001 ) && (enable ==1'b1)  )
		    begin
                if(FirstChoice != keyCode && SecondChoice != keyCode && ThirdChoice != keyCode && FourthChoice != keyCode)
                    begin
                     // if choices are unchanged give them all keyCode values 
                        if(FirstChoice == 4'b1111 && SecondChoice == 4'b1111 && ThirdChoice == 4'b1111 && FourthChoice ==4'b1111)
                            FirstChoice <= keyCode; // des gets queeItem1
                        else if(FirstChoice != 4'b1111 && SecondChoice == 4'b1111 && ThirdChoice == 4'b1111 && FourthChoice == 4'b1111)
                            SecondChoice <= keyCode;
                        else if(FirstChoice != 4'b1111 && SecondChoice != 4'b1111 && ThirdChoice ==4'b1111 && FourthChoice ==4'b1111)
                            ThirdChoice <= keyCode;
                        else if(FirstChoice != 4'b1111 && SecondChoice != 4'b1111 && ThirdChoice != 4'b1111 && FourthChoice ==4'b1111)
                            FourthChoice <= keyCode;
                    end
			// Don't add a new choice if slots of the Queue are already taken
	       end

	
        // Compare current state with Elevator Call 
        if(currSt == 4'b1000 || currSt == 4'b0100 || currSt == 4'b0010 || currSt == 4'b0001)
                        begin
                            if(FirstChoice == currSt)
                                begin
                                    FirstChoice <= SecondChoice;
                                    SecondChoice <= ThirdChoice;
                                    ThirdChoice <= FourthChoice;
                                    FourthChoice <= 4'b1111;
                                  //  go = 0;
                                   check = 0;
                                end
                            else if (SecondChoice == currSt)
                                begin
                                    SecondChoice <= ThirdChoice;
                                    ThirdChoice <= FourthChoice;
                                    FourthChoice <= 4'b1111;
                                   // go = 0;
                                    check = 0;
                                end
                            else if (ThirdChoice == currSt)
                                begin
                                    ThirdChoice <= FourthChoice;
                                    FourthChoice <= 4'b1111;
                                   // go = 0;
                                    check = 0;
                                end
                            else if(FourthChoice == currSt)
                                begin
                                    FourthChoice <= 4'b1111;
                                   // go = 0;
                                    check = 0;
                                end
                                
                            //if current state is not in the request queue
                            else if ((FourthChoice != currSt || ThirdChoice != currSt || SecondChoice != currSt || FirstChoice != currSt) )
                                begin
                                    //go = 1;
                                    check = 1;
                                end
                            else 
                                    check = 0;
                     end
       end    
    always@*
        begin	     
             if (check ==0)
                go = 0;
             else if (check == 1'b1 )
                go = 1;
        end
    
        
    always@(negedge clk_2s)
        begin
             currSt <= newState; // every 3 seconds state must change 
        end

endmodule
