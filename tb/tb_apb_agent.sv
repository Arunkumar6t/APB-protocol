//Factory Registration
class apb_agent extends uvm_agent;
`uvm_component_utils(apb_agent)
//instance
apb_sequencer apb_sequencer_h;
apb_driver    apb_driver_h;
apb_monitor   apb_monitor_h;
	
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("AGENT");
endfunction
//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BAGENT");
apb_sequencer_h=apb_sequencer::type_id::create("apb_seqeuncer_h",this);
apb_driver_h   =apb_driver::type_id::create("apb_driver",this);
apb_monitor_h  =apb_monitor::type_id::create("apb_monitor",this);
endfunction
//agent.sv
function void connect_phase(uvm_phase phase);
apb_driver_h.seq_item_port.connect(apb_sequencer_h.seq_item_export);//correct
endfunction

endclass



