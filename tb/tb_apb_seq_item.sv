//Factory Registration
class apb_sequence_item extends uvm_sequence_item;
//declare all the signals with rand/non rand keyword
rand bit [1:0] paddr;
rand bit [1:0] pwdata;
     bit [1:0] prdata;
rand bit 	pwrite;
rand bit 	penable;
rand bit	pselx;
     bit 	pslave_error;
     bit 	pready;

 //factory registration for object with field
 //do hooks i.e.., copy/print/compare/clone/pack/unpack
`uvm_object_utils_begin(apb_sequence_item)
`uvm_field_int(paddr,UVM_ALL_ON)
`uvm_field_int(pwdata,UVM_ALL_ON)
`uvm_field_int(pwrite,UVM_ALL_ON)
`uvm_field_int(prdata,UVM_ALL_ON)
`uvm_field_int(penable,UVM_ALL_ON)
`uvm_field_int(pselx,UVM_ALL_ON)
`uvm_field_int(pslave_error,UVM_ALL_ON)
`uvm_field_int(pready,UVM_ALL_ON)
`uvm_object_utils_end

//Constructor
function new(string name="apb_sequence_item");
super.new(name);
endfunction

endclass 
