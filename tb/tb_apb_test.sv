//Factory Registration
class apb_base_test extends uvm_test;
`uvm_component_utils(apb_base_test)
//apb_sequence apb_sequence_h;	
apb_env   apb_env_h;
		
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("TEST");
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BTEST");
//apb_sequence_h=apb_sequence::type_id::create("apb_sequence_h");//object 1 argument
apb_env_h     =apb_env     ::type_id::create("apb_env_h",this);//component 2 argument 
endfunction

//SOS or EOE :
function void start_of_simulation();
$display("EOETEST");
print();
endfunction

//task run_phase(uvm_phase phase);
//phase.raise_objection(this);
//apb_sequence_h.start(apb_env_h.apb_agent_h.apb_sequencer_h);//correct
//phase.drop_objection(this);
//phase.phase_done.set_drain_time(this,50);
//endtask

endclass 

///////////////////////////////////////////////////////////////////////
//wr_test
///////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_wr_test extends apb_base_test;
`uvm_component_utils(apb_wr_test)
apb_wr_sequence apb_sequence_h;	
//apb_env   apb_env_h;
		
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("TEST");
endfunction
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BTEST");
apb_sequence_h=apb_wr_sequence::type_id::create("apb_sequence_h");//object 1 argument
//apb_env_h     =apb_env     ::type_id::create("apb_env_h",this);//component 2 argument 
endfunction

//SOS or EOE :
//function void start_of_simulation();
//$display("EOETEST");
//print();
//endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_sequence_h.start(apb_env_h.apb_agent_h.apb_sequencer_h);//correct
phase.drop_objection(this);
phase.phase_done.set_drain_time(this,50);
endtask

endclass 

///////////////////////////////////////////////////////////////////////
//rd_test
///////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_rd_test extends apb_base_test;
`uvm_component_utils(apb_rd_test)
apb_rd_sequence apb_sequence_h;	
//apb_env   apb_env_h;
		
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("TEST");
endfunction
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BTEST");
apb_sequence_h=apb_rd_sequence::type_id::create("apb_sequence_h");//object 1 argument
//apb_env_h     =apb_env     ::type_id::create("apb_env_h",this);//component 2 argument 
endfunction

//SOS or EOE :
//function void start_of_simulation();
//$display("EOETEST");
//print();
//endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_sequence_h.start(apb_env_h.apb_agent_h.apb_sequencer_h);//correct
phase.drop_objection(this);
phase.phase_done.set_drain_time(this,50);
endtask

endclass 

///////////////////////////////////////////////////////////////////////
//wr_rd_test
///////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_wr_rd_test extends apb_base_test;
`uvm_component_utils(apb_wr_rd_test)
apb_wr_rd_sequence apb_sequence_h;	
//apb_env   apb_env_h;
		
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("TEST");
endfunction
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BTEST");
apb_sequence_h=apb_wr_rd_sequence::type_id::create("apb_sequence_h");//object 1 argument
//apb_env_h     =apb_env     ::type_id::create("apb_env_h",this);//component 2 argument 
endfunction

//SOS or EOE :
//function void start_of_simulation();
//$display("EOETEST");
//print();
//endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_sequence_h.start(apb_env_h.apb_agent_h.apb_sequencer_h);//correct
phase.drop_objection(this);
phase.phase_done.set_drain_time(this,50);
endtask

endclass 

///////////////////////////////////////////////////////////////////////
//random_test
///////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_random_test extends apb_base_test;
`uvm_component_utils(apb_random_test)
apb_random_sequence apb_sequence_h;	
//apb_env   apb_env_h;
		
//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("TEST");
endfunction
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display("BTEST");
apb_sequence_h=apb_random_sequence::type_id::create("apb_sequence_h");//object 1 argument
//apb_env_h     =apb_env     ::type_id::create("apb_env_h",this);//component 2 argument 
endfunction

//SOS or EOE :
//function void start_of_simulation();
//$display("EOETEST");
//print();
//endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
apb_sequence_h.start(apb_env_h.apb_agent_h.apb_sequencer_h);//correct
phase.drop_objection(this);
phase.phase_done.set_drain_time(this,50);
endtask

endclass 


































