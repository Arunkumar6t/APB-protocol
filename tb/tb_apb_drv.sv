//Factory Registration
class apb_driver extends uvm_driver#(apb_sequence_item);
`uvm_component_utils(apb_driver)

//v.interface
virtual apb_interface apb_interface_h;//dynamic

//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("DRV");
endfunction
//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BDRV");
//if congig_db_not set then if youtry to do get then fatal need to occur
if(!uvm_config_db#(virtual apb_interface)::get(this,"","apb_intf",apb_interface_h))
`uvm_fatal("APB"," please set the interface to get  the interface");
endfunction

virtual task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(req);
req.print();
driver_logic();
seq_item_port.item_done();
end
endtask 

task driver_logic();//apb_interface_h.paddr=req.paddr
	@(posedge apb_interface_h.pclk);begin//thread mill or road run
apb_interface_h.driver_cb.paddr		<=req.paddr;
apb_interface_h.driver_cb.pwrite	<=req.pwrite;
if(req.pwrite==1)begin
apb_interface_h.driver_cb.pwdata	<=req.pwdata;
@(posedge apb_interface_h.pclk);
apb_interface_h.driver_cb.penable	<=1;
end
if(req.pwrite==0)begin
req.prdata		<=apb_interface_h.driver_cb.prdata;
end
apb_interface_h.driver_cb.penable	<=0;
apb_interface_h.driver_cb.pselx		<=req.pselx;
req.pready		<=apb_interface_h.driver_cb.pready;
req.pslave_error	<=apb_interface_h.driver_cb.pslave_error;
end
endtask
endclass 
