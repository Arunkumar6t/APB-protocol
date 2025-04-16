
//FR
class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard)

uvm_analysis_imp#(apb_sequence_item,apb_scoreboard) scoreboard_import;
int queue[$];

function new(string name,uvm_component parent);
super.new(name,parent);
scoreboard_import=new("scoreboard_import",this);
endfunction

function write(apb_sequence_item tx);
queue.push_front(tx);
endfunction

task run_phase(uvm_phase phase);
endtask

endclass
