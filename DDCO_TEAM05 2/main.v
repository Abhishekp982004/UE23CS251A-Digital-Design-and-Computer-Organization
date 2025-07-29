module AND_block (
input [7:0] inputA, inputB,
output [7:0] and_output
);
assign and_output = inputA & inputB;
endmodule

module OR_block (
input [7:0] inputA, inputB,
output [7:0] or_output
);
assign or_output = inputA | inputB;
endmodule

module NAND_block (
input [7:0] inputA, inputB,
output [7:0] nand_output
);
assign nand_output = ~(inputA & inputB);
endmodule

module NOR_block (
input [7:0] inputA, inputB,
output [7:0] nor_output
);
assign nor_output = ~(inputA | inputB);
endmodule

module ALU_8bit_unit (
input [7:0] inputA, inputB,
input [1:0] operation,
output [7:0] alu_result
);
wire [7:0] and_res, or_res, nand_res, nor_res;
AND_block and_instance (
    .inputA(inputA), .inputB(inputB), .and_output(and_res)
);
OR_block or_instance (
    .inputA(inputA), .inputB(inputB), .or_output(or_res)
);
NAND_block nand_instance (
    .inputA(inputA), .inputB(inputB), .nand_output(nand_res)
);
NOR_block nor_instance (
    .inputA(inputA), .inputB(inputB), .nor_output(nor_res)
);
assign alu_result = (operation == 2'b00) ? and_res :
                    (operation == 2'b01) ? or_res :
                    (operation == 2'b10) ? nand_res :
                    nor_res;
endmodule

