`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 08:19:44 PM
// Design Name: 
// Module Name: Chooser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Check_one_coin(
    input logic nickel,
    input logic dime,
    input logic quarter,
    output valid
    );

    assign valid = (~nickel & ~dime & quarter) | (~nickel & dime & ~quarter) | (nickel & ~dime & ~quarter);
endmodule
