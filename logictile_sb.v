//design modules
module logic_tile(out, clock, in1, in2, in3, in4, in5);
  output out;
  input clock, in1, in2, in3, in4, in5;
  //reg out;
  wire d;
  reg  q, qbar;
  reg [32:0] mem;
  //look up table
  assign d = mem[{in5, in4, in3, in2, in1}]; 
  
 //designing flipflop
  always@(posedge clock) 
  	begin
  	  q <= d; 
  	  qbar = !d; 
  	end   
  //2 to 1 MUX
  assign out = (d & ~mem[32]) | (q & mem[32]);	//mem[32] is the control bit
  
endmodule

module switch_box_4x4(out, in);
  output [3:0] out;
  //reg [3:0] out;
  input [3:0] in;
  reg [15:0] configure;
  
  assign out[0] = (configure[0] & in[0]) | (configure[1] & in[1]) | (configure[2] & in[2]) | (configure[3] & in[3]);
  
  assign out[1] = (configure[4] & in[0]) | (configure[5] & in[1]) | (configure[6] & in[2]) | (configure[7] & in[3]);
  
  assign out[2] = (configure[8] & in[0]) | (configure[9] & in[1]) | (configure[10] & in[2]) | (configure[11] & in[3]);
  
  assign out[3] = (configure[12] & in[0]) | (configure[13] & in[1]) | (configure[14] & in[2]) | (configure[15] & in[3]);
  
endmodule
