/////////////////////////////////////////////////////////////////////////
//wr_seq
/////////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_wr_sequence extends uvm_sequence#(apb_sequence_item);
`uvm_object_utils(apb_wr_sequence)

//Constructor
function new(string name="apb_wr_sequence");
super.new(name);
endfunction

task body();
	repeat(10) begin
	req=apb_sequence_item::type_id::create("req");//its object so 1 argument
	wait_for_grant();
	req.randomize() with {pwrite==1;};
	req.print();
	send_request(req);
	wait_for_item_done();
	end	
endtask

endclass 

/////////////////////////////////////////////////////////////////////////
//rd_seq
/////////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_rd_sequence extends uvm_sequence#(apb_sequence_item);
`uvm_object_utils(apb_rd_sequence)

//Constructor
function new(string name="apb_rd_sequence");
super.new(name);
endfunction

task body();
	repeat(10) begin
	req=apb_sequence_item::type_id::create("req");//its object so 1 argument
	wait_for_grant();
	req.randomize() with {pwrite==0;};
	send_request(req);
	wait_for_item_done();
	end	
endtask

endclass 

/////////////////////////////////////////////////////////////////////////
//wr_rd_seq
/////////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_wr_rd_sequence extends uvm_sequence#(apb_sequence_item);
`uvm_object_utils(apb_wr_rd_sequence)

//Constructor
function new(string name="apb_wr_rd_sequence");
super.new(name);
endfunction

task body();
	repeat(10) begin
	req=apb_sequence_item::type_id::create("req");//its object so 1 argument
	wait_for_grant();
	req.randomize() with {pwrite==1;};
	send_request(req);
	wait_for_item_done();

	req=apb_sequence_item::type_id::create("req");//its object so 1 argument
	wait_for_grant();
	req.randomize() with {pwrite==0;};
	send_request(req);
	wait_for_item_done();
	end	
endtask

endclass 

/////////////////////////////////////////////////////////////////////////
//RAND_seq
/////////////////////////////////////////////////////////////////////////

//Factory Registration
class apb_random_sequence extends uvm_sequence#(apb_sequence_item);
`uvm_object_utils(apb_random_sequence)

//Constructor
function new(string name="apb_random_sequence");
super.new(name);
endfunction

task body();
	repeat(10) begin
	req=apb_sequence_item::type_id::create("req");//its object so 1 argument
	wait_for_grant();
	req.randomize();
	send_request(req);
	wait_for_item_done();
	end	
endtask

endclass 














