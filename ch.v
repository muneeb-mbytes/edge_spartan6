module upordown(
    Clk,
    reset,
    UpOrDown, //high for UP counter and low for Down counter
    Count,load,stop,start
    );
  
  input Clk,reset,UpOrDown,load,stop,start;
    //output ports and their size
    output [6 : 0] Count;
    //Internal variables
    reg [6 : 0] Count = 0;
  
 // reg [31:0] clkdiv ;
 //@(posedge Clk)
//clkdiv=clkdiv + 1;

  
   always @(posedge Clk or posedge reset or posedge load or posedge stop)
     begin
        
         
           
            if(UpOrDown == 1 && start==1 ) //Up mode selected
                
      if(Count == 99)
                    Count <= 0;
         else if (reset == 1)
       Count=00;
       else if(load==1)
       Count<=90;
       else if(stop==1)
       Count<=Count;
       else
                    Count <= Count + 1; //Incremend Counter
                     
    
    
    else if(UpOrDown == 0 && start==1 )//Down mode selected
               
     if(Count == 0)
                    Count <= 99;
        
        else if (reset == 1)
       Count <= 99;
       else if(load == 1)
       Count <= 10;
       else if(stop == 1)
       Count <= Count;
                else
                    Count <= Count - 1; //Decrement counter
     end    
endmodule
