# Clock signal 
set_property PACKAGE_PIN W5 [get_ports clk]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports clk] 
# create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 

#Pmod Header JA --Motors
#Motor Beti -1 
#Sch name = JA1 
set_property PACKAGE_PIN J1 [get_ports {out[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out[0]}] 
#Sch name = JA2 
set_property PACKAGE_PIN L2 [get_ports {out[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out[2]}] 
#Sch name = JA3 
set_property PACKAGE_PIN J2 [get_ports {out[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out[1]}] 
#Sch name = JA4 
set_property PACKAGE_PIN G2 [get_ports {out[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out[3]}] 

#Motor External -2
#Sch name = JA7 
set_property PACKAGE_PIN H1 [get_ports {out2[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out2[0]}] 
#Sch name = JA8 
set_property PACKAGE_PIN K2 [get_ports {out2[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out2[1]}] 
#Sch name = JA9 
set_property PACKAGE_PIN H2 [get_ports {out2[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out2[2]}] 
#Sch name = JA10 
set_property PACKAGE_PIN G3 [get_ports {out2[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {out2[3]}] 


##Pmod Header JB -- 4X4 BUTTONS
##Sch name = JB1 
set_property PACKAGE_PIN A14 [get_ports {JB_out[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_out[0]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {JB_out[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_out[1]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {JB_out[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_out[2]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {JB_out[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_out[3]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {JB_in[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_in[0]}]
	set_property PULLDOWN true [get_ports JB_in[0]]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {JB_in[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_in[1]}]
    set_property PULLDOWN true [get_ports JB_in[1]]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {JB_in[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_in[2]}]
	set_property PULLDOWN true [get_ports JB_in[2]]
#Sch name = JB10 
set_property PACKAGE_PIN C16 [get_ports {JB_in[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JB_in[3]}]
	set_property PULLDOWN true [get_ports JB_in[3]]
     

# #7segment	
set_property PACKAGE_PIN W7 [get_ports {a}] 	 	 	 	 	 
      set_property IOSTANDARD LVCMOS33 [get_ports {a}] 
 set_property PACKAGE_PIN W6 [get_ports {b}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {b}] 
 set_property PACKAGE_PIN U8 [get_ports {c}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {c}] 
 set_property PACKAGE_PIN V8 [get_ports {d}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {d}] 
 set_property PACKAGE_PIN U5 [get_ports {e}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {e}] 
 set_property PACKAGE_PIN V5 [get_ports {f}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {f}] 
 set_property PACKAGE_PIN U7 [get_ports {g}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {g}] 
 set_property PACKAGE_PIN U2 [get_ports {an[0]}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
 set_property PACKAGE_PIN U4 [get_ports {an[1]}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
 set_property PACKAGE_PIN V4 [get_ports {an[2]}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
 set_property PACKAGE_PIN W4 [get_ports {an[3]}]                          
      set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}] 


#8x8 RGB
set_property PACKAGE_PIN K17 [get_ports row[0]]                      
      set_property IOSTANDARD LVCMOS33 [get_ports row[0]] 
 ##Sch name = JC2 
 set_property PACKAGE_PIN M18 [get_ports row[1] ]                      
      set_property IOSTANDARD LVCMOS33 [get_ports row[1]] 
 ##Sch name = JC3 
 set_property PACKAGE_PIN N17 [get_ports data]                      
      set_property IOSTANDARD LVCMOS33 [get_ports data] 
 ##Sch name = JC4 
 set_property PACKAGE_PIN P18 [get_ports OE]                      
      set_property IOSTANDARD LVCMOS33 [get_ports OE] 
 ##Sch name = JC7 
 set_property PACKAGE_PIN L17 [get_ports ST_CP]                      
      set_property IOSTANDARD LVCMOS33 [get_ports ST_CP]
 #Sch name = JC8 
 set_property PACKAGE_PIN M19 [get_ports SH_CP]                      
     set_property IOSTANDARD LVCMOS33 [get_ports SH_CP ]
 #Sch name = JC9 
 set_property PACKAGE_PIN P17 [get_ports MR]                      
      set_property IOSTANDARD LVCMOS33 [get_ports MR ] 

##leds 
## LEDs 
#des1
set_property PACKAGE_PIN U16 [get_ports {des1[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des1[0]}] 
set_property PACKAGE_PIN E19 [get_ports {des1[1]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des1[1]}] 
set_property PACKAGE_PIN U19 [get_ports {des1[2]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des1[2]}] 
set_property PACKAGE_PIN V19 [get_ports {des1[3]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des1[3]}] 
 	
#keycode 	
set_property PACKAGE_PIN W18 [get_ports {keyCode[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {keyCode[0]}] 
set_property PACKAGE_PIN U15 [get_ports {keyCode[1]}  ]	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {keyCode[1]}] 
set_property PACKAGE_PIN U14 [get_ports {keyCode[2]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {keyCode[2]}] 
set_property PACKAGE_PIN V14 [get_ports {keyCode[3]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {keyCode[3]}] 

#des2---------------------------------------------------------
set_property PACKAGE_PIN V13 [get_ports {des2[0]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des2[0]}] 
set_property PACKAGE_PIN V3 [get_ports {des2[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des2[1]}] 
set_property PACKAGE_PIN W3 [get_ports {des2[2]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des2[2]}] 
set_property PACKAGE_PIN U3 [get_ports {des2[3]}]  	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {des2[3]}] 
 	
##BASYS Switches
set_property PACKAGE_PIN R2 [get_ports {callElevator}] 	 	 	 	 	 
          set_property IOSTANDARD LVCMOS33 [get_ports {callElevator}] 

set_property PACKAGE_PIN V17 [get_ports {floor[0]}]                          
   set_property IOSTANDARD LVCMOS33 [get_ports {floor[0]}] 
set_property PACKAGE_PIN V16 [get_ports {floor[1]}]                          
   set_property IOSTANDARD LVCMOS33 [get_ports {floor[1]}] 
set_property PACKAGE_PIN W16 [get_ports {floor[2]}]                          
   set_property IOSTANDARD LVCMOS33 [get_ports {floor[2]}] 
set_property PACKAGE_PIN W17 [get_ports {floor[3]}]                          
   set_property IOSTANDARD LVCMOS33 [get_ports {floor[3]}] 
   
#Pmod Header JXADC -- Elevator Leds
   #Sch name = XA1_P 
   set_property PACKAGE_PIN J3 [get_ports {on1}]                 
        set_property IOSTANDARD LVCMOS33 [get_ports {on1}] 
   #Sch name = XA2_P 
   set_property PACKAGE_PIN L3 [get_ports {on2}]                 
        set_property IOSTANDARD LVCMOS33 [get_ports {on2}] 
  
          

