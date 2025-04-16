//Factory Registration
class apb_env extends uvm_env;
`uvm_component_utils(apb_env)	
//instance
apb_agent apb_agent_h;
apb_scoreboard apb_scoreboard_h;

//Constructor
function new(string name,uvm_component parent);
super.new(name,parent);
$display("ENV");
endfunction
//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);	
$display("BENV");
apb_scoreboard_h=apb_scoreboard::type_id::create("apb_scoreboard_h",this);
apb_agent_h=apb_agent::type_id::create("apb_agent_h",this);
endfunction

function void connect_phase(uvm_phase phase);
apb_agent_h.apb_monitor_h.monitor_port.connect(apb_scoreboard_h.scoreboard_import);
endfunction

endclass 
