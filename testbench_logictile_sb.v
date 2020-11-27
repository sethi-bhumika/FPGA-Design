// Code your testbench here
// or browse Examples
module Testbench_logic();
  reg [31:0] tb_mem[0:2];
  reg [3:0] sbin;
  reg rin1, rin2, rin3, rin4, rin5, clk;
  wire wout;
  wire [3:0] sbout;
  
  initial clk = 0; 
	always #10 clk = ~clk;
    
   logic_tile inst_logic_tile(
     .in1(rin1),
     .in2(rin2),
     .in3(rin3),
     .in4(rin4),
     .in5(rin5),
     .out(wout),
     .clock(clk)
   );
  
  switch_box_4x4 switch_box_inst(
    .out(sbout),
    .in(sbin)
  );
  
  initial begin
    $readmemh("a.bin", tb_mem); 
    inst_logic_tile.mem[31:0] = tb_mem[0];
    inst_logic_tile.mem[32] = tb_mem[1][0];
    switch_box_inst.configure[15:0] = tb_mem[2][15:0];
    end
  
  
  
  initial
    begin
      
      rin1 = 1'b0;
      rin2 = 1'b0;
      rin3 = 1'b0;
      rin4 = 1'b0;
      rin5 = 1'b0;
      sbin = 4'b0000;
      #15
      $display("logic tile : in1 = %b, in2 = %b, in3 = %b, in4 = %b, in5 = %b, out = %b, switch box : in = %b, out = %b", rin1, rin2, rin3, rin4, rin5, wout, sbin, sbout);
      
      rin1 = 1'b1;
      rin2 = 1'b1;
      rin3 = 1'b1;
      rin4 = 1'b1;
      rin5 = 1'b1;
      sbin = 4'b0001;
      #15
      $display("logic tile : in1 = %b, in2 = %b, in3 = %b, in4 = %b, in5 = %b, out = %b, switch box : in = %b, out = %b", rin1, rin2, rin3, rin4, rin5, wout, sbin, sbout);
      
      rin1 = 1'b1;
      rin2 = 1'b1;
      rin3 = 1'b0;
      rin4 = 1'b0;
      rin5 = 1'b0;
      sbin = 4'b1111;
      #15
      $display("logic tile : in1 = %b, in2 = %b, in3 = %b, in4 = %b, in5 = %b, out = %b, switch box : in = %b, out = %b", rin1, rin2, rin3, rin4, rin5, wout, sbin, sbout);
      
      rin1 = 1'b0;
      rin2 = 1'b1;
      rin3 = 1'b0;
      rin4 = 1'b0;
      rin5 = 1'b1;
      sbin = 4'b0101;
      #15
      $display("logic tile : in1 = %b, in2 = %b, in3 = %b, in4 = %b, in5 = %b, out = %b, switch box : in = %b, out = %b", rin1, rin2, rin3, rin4, rin5, wout, sbin, sbout);
    
    end
  initial
    begin
      #100 $finish;
    end
  

  initial
    begin
      $dumpfile("lab4.vcd");
      $dumpvars;
      
    end
  
  
endmodule
