`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2021 12:43:32 AM
// Design Name: 
// Module Name: ItemOutput
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


module ItemOutput(
    input [2:0] item_in,
    output logic enter_out,
    output logic [4:0] LEDS
    
    );
        always_comb
    begin
        if (item_in == 3'd0) 
            begin
                LEDS = 5'b00000; //if first item is inputted, first LED will light
            end
        else if (item_in == 3'd1) 
            begin
                LEDS = 5'b00001; //if first item is inputted, first LED will light
            end
        else if (item_in == 3'd2) 
            begin
                LEDS = 5'b00010; //if second item is inputted, second LED will light
            end
        else if (item_in == 3'd3) 
            begin
                LEDS = 5'b00100; //and so on
            end
        else if (item_in == 3'd4) 
            begin
                LEDS = 5'b01000;
            end
        else if (item_in == 3'd5) 
            begin
                LEDS = 5'b10000;
            end
        
            
    end
endmodule
