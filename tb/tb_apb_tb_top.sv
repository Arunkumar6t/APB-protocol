module apb_tb_top;
//clk and reset declaration 
bit pclk;
bit presetn;
//clk generation(v,sv,uvm)
always#5 pclk=~pclk;
//reset generation(v,sv,uvm)
initial begin
presetn=1'b1;
#5 presetn=0;
end
apb_interface intf(pclk,presetn);//instance

//code related to the dut 
apb_slave dut(
	.pclk			(intf.pclk      ),
	.presetn		(intf.presetn   ),
	.paddr		 	(intf.paddr	),
	.pwdata			(intf.pwdata	),
	.prdata			(intf.prdata	),
	.pwrite			(intf.pwdata	),
	.pselx			(intf.pselx	),
	.penable	        (intf.penable	),
	.pslave_error	        (intf.pslave_error),
	.pready			(intf.pready	)
	);
//run test
initial begin//triggering and termination of test
	$display("#######################TB_TOP#####################");
	run_test("apb_wr_test");
end
//config_db we will create and use
initial begin
uvm_config_db#(virtual apb_interface)::set(uvm_root::get(),"*","apb_intf",intf);

end
endmodule
