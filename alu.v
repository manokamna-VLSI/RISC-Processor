module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_sel,
    output reg [31:0] ALU_out
);

always @(*) begin
    case (ALU_sel)
        4'b0000: ALU_out = A + B;   // ADD
        4'b0001: ALU_out = A - B;   // SUB
        4'b0010: ALU_out = A & B;   // AND
        4'b0011: ALU_out = A | B;   // OR
        4'b0100: ALU_out = ~A;      // NOT
        4'b0101: ALU_out = A * B;   // MUL ?
        4'b0110: ALU_out = (B != 0) ? (A / B) : 32'b0; // DIV ? (safe)
        default: ALU_out = 32'b0;
    endcase
end

