// Code your design here
module ALU_4bit (
  input [3:0] a,
  input [3:0] b,
  input [2:0] sel,
  output reg [3:0] q);
  
  always@(*)
    begin
      case (sel)
        3'b000: q= a + b;
        3'b001: q= a - b;
        3'b010: q= b - a;
        3'b011: q= a & b;
        3'b100: q= a | b;
        3'b101: q= ~a;
        3'b110: q= a >> 1;
        3'b111: q= a << 1;
        default: q=4'b0000;
      endcase
    end
   endmodule        
