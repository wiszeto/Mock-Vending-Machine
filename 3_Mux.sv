`timescale 1ns / 1ps

module MuxChooser(
    input N,
    input D,
    input Q,
    input logic sel,
    output logic [7:0] out
    );

    always_comb
    begin
        if(sel == 0)
            begin
                out=8'd0; //rejects if not valid
            end
        else
            begin
                if (N)
                begin
                    out = 8'd5; //outputs 5 cents
                end
                else if (D)
                begin
                    out = 8'd10; //outputs 10 cents
                end
                else if (Q)
                begin
                    out = 8'd25; //outputs 25 cents
                end
            end
    end

endmodule 