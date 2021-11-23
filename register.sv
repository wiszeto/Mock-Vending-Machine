`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Wilson Szeto
// 
// Create Date: 08/04/2021 01:26:18 PM
// Module Name: register
//////////////////////////////////////////////////////////////////////////////////


module register #(parameter Width = 8)(
    input Clk,
    input Enter,
    input Clr,
    input [Width:0] D,
    input enter_in,
    output logic [Width:0] Q = 0
    );
    
    always_ff @ (posedge Clk)
    begin
    if (Clr)
       begin
          Q = 8'd0;
       end
    else if (enter_in)
        Q = 8'd0;
    else if (Enter)
        Q = D;
    end
endmodule
