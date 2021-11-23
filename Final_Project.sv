`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Wilson Szeto
// Create Date: 08/18/2021 08:14:09 PM
// Description: Vending Machine
//////////////////////////////////////////////////////////////////////////////////

module Final_Project(
    input clk,
    input nickel,
    input dime,
    input quarter,
    input return_coins,
    input enter_output,
    input enter_coins,
    input [2:0] choice,
    output [7:0] seg,
    output [3:0] an,
    output [4:0] LEDS
    );
    logic [2:0] item;
    logic t1;
    logic [7:0] t2;
    logic [7:0] t3;
    logic t4;
    logic [7:0] t6;
    
    Check_one_coin coin_check(.nickel(nickel), .dime(dime), .quarter(quarter), .valid(t1));
    MuxChooser Mux1(.N(nickel), .D(dime), .Q(quarter), .sel(t1), .out(t2[7:0]));
    register #(8) register1(.Clk(clk), .Enter(enter_coins), .Clr(0), .D(t2[7:0]), .Q(t3[7:0]), .enter_in(t4));
    fsm2 FSM1(.clk(clk), .money(t3[7:0]), .reset(return_coins), .item(choice[2:0]), .Z(item[2:0]), .moneystate(t6[7:0]), .enter_coins(enter_coins), .enter_out(t4), .output_pressed(enter_output));
    ItemOutput out( .item_in(item[2:0]), .LEDS(LEDS[4:0])   );
    univ_sseg univ_sseg(.clk(clk), .cnt1(t6[7:0]), .cnt2(0), .dp_en(0), .dp_sel(0), .mod_sel(0), .sign(0), .valid(1), .ssegs(seg), .disp_en(an));
endmodule
