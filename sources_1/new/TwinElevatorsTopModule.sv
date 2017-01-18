`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Ndricim Rrapi & Argert Boja
// 
// Module Name:    Top Module
//
// Description: Interacts all modules together! 
// Project Name: Twin Elevator
//////////////////////////////////////////////////////////////////////////////////


module TwinElevatorsTopModule(  input logic clk, callElevator, [3:0]floor, JB_in,output [3:0] JB_out,
                                output logic  a,b,c,d,e,f,g,ST_CP, SH_CP, OE, MR, data,
                                output logic [3:0]an, keyCode,out,des1, des2, out2,
                                output logic [1:0]row , output logic on1 ,on2 
                              );
	logic clk_2s;
	reg [3:0]newSt1, cState1, newSt2, cState2;
    logic [3:0] keyCodeInternal ;
    logic [1:0]enablerows;
    logic enableElev1, enableElev2;
  
  
  
   
   
	always@*
	begin 
        if (floor == cState1)
           enablerows <= 2'b01;
        else if (floor == cState2)
           enablerows <= 2'b10;
           
        if (floor == 4'b0001 && callElevator== 1'b1)
          keyCodeInternal <= floor;
        else if (floor == 4'b0010 && callElevator== 1'b1)
          keyCodeInternal <= floor;
        else if (floor == 4'b0100 && callElevator== 1'b1)
           keyCodeInternal <= floor;
        else if (floor == 4'b1000 && callElevator== 1'b1)
            keyCodeInternal <= floor; 
        else if (floor == 4'b0000 && callElevator == 1'b1)        
            keyCodeInternal <= keyCode;
	end   
	
    RGBDisplay rgb (clk, cState1, cState2, row, ST_CP, SH_CP, OE, MR, data);
	
	clockDivider clkDiv(clk,30'd450000000, clk_2s);

    SegmentDisplay segDisplay(clk, cState1, cState2, des1, des2,  a, b, c, d, e, f, g, dp, an);

	Comparator E1vsE2 (cState1, cState2, floor,  enableElev1, enableElev2   );
	// FIRST ELEVATOR
    DriverController elev1 (clk, clk_2s, go, enableElev1, cState1, des1, newSt1, out, on1); // generate nsWire and out Signal
	QUEUE queue1 (clk, clk_2s, enableElev1, keyCode, newSt1, go, cState1, des1);// genereates csWire, destination and triggers go 1 or 0
    
    KeyboardController  keyboard(clk, enablerows, JB_in, keyCodeInternal, callElevator,  JB_out , keyCode); //generates keyCode
    
    //SECOND ELEBATOR
    DriverController elev2 (clk, clk_2s, go2, enableElev2, cState2, des2,  newSt2, out2, on2); // generate nsWire and out Signal
	QUEUE queue2 (clk, clk_2s, enableElev2, keyCode, newSt2, go2, cState2, des2);
	

	
	//           input  [3:0] JBI, output  reg [3:0] JBO,
endmodule
