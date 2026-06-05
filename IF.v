module IF(
    input [31:0] PC_initializing_address,
    input [31:0] branch_PC,
    input is_branch_taken,
    input start,
    input clk,
    output [31:0] PC_out_IF
);

reg [31:0] PC;
wire [31:0] PC_wire;
wire [31:0] Psum;

initial begin
    PC = 0;
end

assign Psum = PC + 32'd4;

assign PC_wire = start ? 
                 PC_initializing_address :
                 (is_branch_taken ? branch_PC : Psum);

assign PC_out_IF = PC;

always @(posedge clk) begin
    if (PC >= 24)
        PC <= 0;
    else
        PC <= PC_wire;
end

endmodule
