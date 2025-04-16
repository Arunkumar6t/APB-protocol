//Factory Registration
class apb_monitor extends uvm_monitor;
`uvm_component_utils(apb_monitor)

virtual apb_interface apb_interface_h;//dynamic
apb_sequence_item req;

uvm_analysis_port #(apb_sequence_item) monitor_port;

//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
monitor_port=new("monitor_port",this);
$display("MON");
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BMON");
//if congig_db_not set then if youtry to do get
if(!uvm_config_db#(virtual apb_interface)::get (this,"","apb_intf",apb_interface_h))
`uvm_fatal("apb","please set the interface to get it")
endfunction 

//task run_phase(uvm_phase phase);
//monitor_logic();
//endtask 

task monitor_logic();//req.paddr=apb_interface_h.paddr
req.paddr       =apb_interface_h.monitor_cb.paddr;
req.pwrite      =apb_interface_h.monitor_cb.pwrite;
req.pwdata      =apb_interface_h.monitor_cb.pwdata;
req.penable     =apb_interface_h.monitor_cb.penable;
req.prdata      =apb_interface_h.monitor_cb.prdata;
req.pready      =apb_interface_h.monitor_cb.pready;
req.pslave_error=apb_interface_h.monitor_cb.pslave_error;
monitor_port.write(req);//write calling in the monitor from scoreboard
endtask
endclass 
