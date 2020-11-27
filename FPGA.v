// Code your design here
module logic_tile(out, clock, in1, in2, in3, in4, in5);
  output out;
  input clock, in1, in2, in3, in4, in5;
  //reg out;
  wire d;
  reg  q, qbar;
  initial begin
    q = 0;
  end
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

module FPGA(out, clock, in0, in1, in2, in3, in4, in5, in6, in7);
  output [2:0] out;
  input clock, in0, in1, in2, in3, in4, in5, in6, in7;
  wire b0, b1, c0, c1, d0, d1;
  
  logic_tile a0_l0(b0, clock, in0, in1, in2, in3, in4);
  logic_tile a0_l1(out[0], clock, in5, in6, in7, b0, 0);
  
  logic_tile a1_l0(c0, clock, in0, in1, in2, in3, in4);
  logic_tile a1_l1(out[1], clock, in5, in6, in7, c0, 0);
  
  logic_tile a2_l0(d0, clock, in0, in1, in2, in3, in4);
  logic_tile a2_l1(out[2], clock, in5, in6, in7, d0, 0);

  
endmodule