//Factory Registration
class apb_sequencer extends uvm_sequencer#(apb_sequence_item);
	`uvm_component_utils(apb_sequencer)

	//Constructor
	function new(string name,uvm_component parent);
		super.new(name,parent);
		$display("SEQR");
	endfunction
//no build phase coz we don't have component
//no connect phase coz sqr-drv we do connection in agent
//no EOE or SOS is optional coz test is the proper place
//no run coz default FIFO arbitration is been taken care by the uvm lib
//no extract, no check no report no final coz we will take care in scb file
endclass 

//or
//typedef uvm_sequencer#(apb_sequence_item)apb_sequencer;
