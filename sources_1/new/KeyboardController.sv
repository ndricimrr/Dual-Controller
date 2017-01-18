`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    Keyboard Scanner
//
// Description: This module takes as inputs one Basys3 button in order to call the elevator  to come at the person's location. 
//              Besides this it also gets inputs from the 4x4 KeyBoard on BetiBoard as a 4 bit signal. Using this 4 bit input and another
//              4 bit output going into the 4x4 KeyBoard it generates the destination of the elevator as a 4 bit keyCode. The KeyBoard
//              buttons are supposed to be the interior buttons of the elevator as in real life. While the exterior request button is 
//              implemented by using the button in Basys3 (callElevator)  which means that the user might request for the elevator to 
//              come at his location only if he is outside of the elevator. 
//
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////
module KeyboardController (input  logic clk,  
                           input  logic [1:0] enableRows,
                           input  logic [3:0] JB_in, kCodeInternal,
                           input  logic       callElevator,  
                           output logic [3:0] JB_out,   
                           output logic [3:0] keyCode  );
    
    logic stop;
	logic [16:0] count = 6'b0;
	logic[16:0] nextcount = 6'b0;
	logic [3:0] row;
    //reg [3:0] internalJBO;
    
    // increment counter
	always @(posedge clk)
	begin
        if (~stop) // stop counter when button pressed
            begin
               count <= nextcount; 
            end
    end

	always@(posedge clk)
		nextcount = count + 1;
			
	always@(posedge clk)
        begin//------------------Logic Block1
          if ( callElevator == 1'b1)
                keyCode <= kCodeInternal;
          else if (callElevator ==1'b0)
              begin
                  case (count[16:15])
                    2'b00:  JB_out <= 4'b0001; 	
                    2'b01:  JB_out <= 4'b0010; 		
                    2'b10:  JB_out <= 4'b0100; 	
                    2'b11:  JB_out <= 4'b1000; 		
                  endcase	
                  if((JB_in == row)) 
                      begin
                           stop <= 1;
                           keyCode <= {JB_out};
                      end 
                  else 
                      begin 
                           stop = 0;
                           keyCode <= 4'b1111; 
                      end
              end
         end//------------------Logic Block1 END
	   
	  //Switch between first and second row of 4x4 Field Buttons
	  always@*
          begin
             if (enableRows == 2'b01)
                row <= 4'b0001;
             else if (enableRows == 2'b10) 
                row <= 4'b0010;  
          end 	   
endmodule
