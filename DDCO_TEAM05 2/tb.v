module tb_ALU_8bit_unit_test;
reg [7:0] regA;
reg [7:0] regB;
reg [1:0] op_code;
wire [7:0] final_result;
ALU_8bit_unit alu_instance (
    .inputA(regA),
    .inputB(regB),
    .operation(op_code),
    .alu_result(final_result)
);

initial begin
    $dumpfile("alu_test_waveform.vcd");
    $dumpvars(0, tb_ALU_8bit_unit_test);
end

initial begin
    $display("Time\tregA\tregB\top_code\tfinal_result");
    $monitor("%0t\t%d\t%d\t%d\t%d", $time, regA, regB, op_code, final_result);

    regA = 8'b11001100; regB = 8'b10101010; op_code = 2'b00;
    #10;

    regA = 8'b11001100; regB = 8'b10101010; op_code = 2'b01;
    #10;

    regA = 8'b11001100; regB = 8'b10101010; op_code = 2'b10;
    #10;

    regA = 8'b11001100; regB = 8'b10101010; op_code = 2'b11;
    #10;

    #60; // Wait till 100 time units
    $finish;
end
endmodule