module control_unit(
    input [31:0] Instruction_in_ID,

    output reg [3:0] ALU_sel,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write
);

wire [5:0] opcode;

assign opcode = Instruction_in_ID[31:26];

always @(*) begin
    ALU_sel   = 4'b0000;
    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;

    case(opcode)

        6'b000000: begin
            ALU_sel = 4'b0000;
            reg_write = 1;
        end

        6'b000001: begin
            ALU_sel = 4'b0001;
            reg_write = 1;
        end

        6'b000010: begin
            ALU_sel = 4'b0010;
            reg_write = 1;
        end

        6'b000011: begin
            ALU_sel = 4'b0011;
            reg_write = 1;
        end

        6'b000100: begin
            ALU_sel = 4'b0100;
            reg_write = 1;
        end

        6'b000101: begin
            ALU_sel = 4'b0101;
            reg_write = 1;
        end

       6'b000110: begin
            ALU_sel = 4'b0110;
            reg_write = 1;
        end

        

        // ... all cases

        default: begin
            ALU_sel = 4'b0000;  // SAFE DEFAULT
            reg_write = 0;
            mem_read = 0;
            mem_write = 0;
        end
    endcase
end

endmodule
