// Code your testbench here
// or browse Examples
module tb_ALU_4bit;
  
  //input
  reg [3:0] a;
  reg [3:0] b;
  reg [2:0] sel;
  
  //output
  wire [3:0] q;
  
  //instantiate DUT-to Connect the declared reg and wire signals to it using .port(signal) syntax.
  ALU_4bit uut(
    .a(a),
    .b(b),
    .sel(sel),
    .q(q)
  );
  
  //Stimulus Block-Use an initial begin ... end block to:
  //Optionally end with $finish to stop simulation.
  initial begin
    
    //monitor output for debug
    $monitor("Time=%0t | sel=%b | a=%b | b=%b | q=%b", $time, sel, a, b, q);
    
    //Case 1: Additional
    a=4'b0000; b=4'b1111; sel=3'b000; #10;
    //expected output=1111
    
     //Case 2: Subtraction
    a=4'b1111; b=4'b1111; sel=3'b001; #10;
    //expected output=0000
    
    //Case 3: Subtraction
    a=4'b0000; b=4'b1111; sel=3'b010; #10;
    //expected output=1111
    
     //Case 4: AND
    a=4'b0100; b=4'b1111; sel=3'b011; #10;
    //expected output=0100
    
    //Case 5: OR
    a=4'b0000; b=4'b0011; sel=3'b100; #10;
    //expected output=0011
    
     //Case 2: inverted
    a=4'b1111; sel=3'b101; #10;
    //expected output=0000
    
    //Case 1:  Right shift
    a=4'b0100; sel=3'b110; #10;
    //expected output=0010
    
     //Case 2:  Left shift
    a=4'b1111; sel=3'b111;#10;
    //expected output=1110
    
    //End simulation
    $finish;
    
  end
endmodule
