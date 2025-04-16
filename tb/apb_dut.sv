module apb_slave #(parameter addr_width=2,parameter data_width=2)(
input pclk,preset_n,
input [addr_width-1:0]paddr,
input [data_width-1:0]pwdata,
output reg [data_width-1:0]prdata,
input pwrite,pselx,penable,pslave_error,ptransfer=0,
output reg pready=0);

reg[2:0]state;
reg[2:0]next_state;
reg [data_width-1:0] mem [2**addr_width];
//reg [data_width-1:0]prdata;

parameter [2:0] IDLE=2'b00;
parameter [2:0] SETUP=2'b01;
parameter [2:0] ACCESS=2'b10;

always @(posedge preset_n) 
for(int i=0;i<2**addr_width;i++) mem[i]=8'h00;

always @(posedge pclk) 
if (pwrite==1)    
mem[paddr] <= pwdata;

always @(posedge pclk)
if (pwrite==0) prdata <= mem[paddr];
    
always @(posedge pclk, posedge preset_n)
	begin
	if (preset_n)
   		state=IDLE;
  	else
   		state=next_state;
        end

always @(state, next_state)
	begin
	case(state)
	IDLE:
	    if(penable ==0 && pready ==0)  
   		begin
			if (pselx==1)
			begin
    			next_state=SETUP;
    			pready<=0;
			prdata<=0;
   			end
			else begin
			if(ptransfer==0)	
			begin
			next_state=IDLE;
    			pready<=0;
			prdata<=0;
			end
		end
		end
   	    
	SETUP:

         	if(pselx ==1 && pready==0)  
		begin
			if (penable==1)
			begin
    			next_state=ACCESS;
	  		pready<=0;
	 		prdata<=0;
   			end
		end
  	ACCESS:
   		if(pselx ==1 && penable ==1 )  
		begin
			if (pready==0)
			begin
    			next_state=ACCESS;
	  		pready<=0;
	 		prdata<=0;
			end
			else
			begin	
			if (ptransfer==0)
			begin
			next_state=IDLE;
			pready<=1;
	 		prdata<=pwdata;
   			end
			else 
			begin
			next_state=SETUP;
			pready<=0;
	 		prdata<=0;
			end
			end
		end
  	default:
   		begin
        		next_state=IDLE;
			pready<=0;
	 		prdata<=0;

           		
   		end
  		endcase
 	end
endmodule
