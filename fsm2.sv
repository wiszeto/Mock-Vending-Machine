`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Wilson Szeto
// Create Date: 08/24/2021 01:00:44 AM
//////////////////////////////////////////////////////////////////////////////////


module fsm2(
    input clk, [7:0] money, reset, [2:0] item, enter_coins,
    output output_pressed,
    output logic [2:0] Z, [7:0] moneystate, enter_out
    );
    logic enough;
    logic [3:0] NS;
    logic [3:0] PS = ST0;
    parameter [3:0] ST0 = 4'd0, ST1 = 4'd1, ST2 = 4'd2, ST3 = 4'd3, ST4 = 4'd4, ST5 = 4'd5, ST6 = 4'd6, ST7 = 4'd7, ST8 = 4'd8, ST9 = 4'd9, ST10 = 4'd10, ST11 = 4'd11, ST12 = 4'd12, ST13 = 4'd13, ST14 = 4'd14, ST15 = 4'd15;
    
    always_ff @ (posedge clk, negedge reset)
    begin
        if (reset) PS = ST0;
        else       PS = NS;
    end
    //combinatorial logic 
    
    always_comb 
    begin
    //initialze all outputs to zero 

    moneystate = 8'd0;
    enter_out = 0;
    case (PS)
        ST0://-----------------------------------------------------------------------------------------------------------------0
        //0 cents
        begin
        moneystate = 8'd0;
        if (enter_coins) NS = ST0;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST1;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST2;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST5;
                    end
            end
        else if ((item != 0) & (output_pressed)) // if they have selected a item and pressed the output
            begin
            if (item == 1)// if first item selected
            begin
            if (moneystate >= 40)// if they can buy
                begin
                    Z = 3'd1;
                end
            end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                    begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                    begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                    begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST0;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST0;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------0
        ST1://-----------------------------------------------------------------------------------------------------------------1
        //5 cents
        begin
        moneystate = 8'd5;
        if (enter_coins) NS = ST1;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST2;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST3;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST6;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST1;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST1;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------1
        ST2://-----------------------------------------------------------------------------------------------------------------2
        //10 cents
        begin
        moneystate = 8'd10;
        if (enter_coins) NS = ST2;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST3;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST4;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST7;
                    end
                end
        else if (item != 0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST2;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST2;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------2
        ST3://-----------------------------------------------------------------------------------------------------------------3
        //15 cents
        begin
        moneystate = 8'd15;
        if (enter_coins) NS = ST3;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST4;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST5;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST8;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin;
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST3;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST3;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------3
        ST4://-----------------------------------------------------------------------------------------------------------------4
        //20 cents
        begin
        moneystate = 8'd20;
        if (enter_coins) NS = ST4;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST5;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST6;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST9;
                    end
                end
        else if (item != 0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST4;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST4;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------4
        ST5://-----------------------------------------------------------------------------------------------------------------5
        //25 cents
        begin
        moneystate = 8'd25;
        if (enter_coins) NS = ST5;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST6;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST7;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST10;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
           if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST5;
                    end
             end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST5;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------5
        ST6://-----------------------------------------------------------------------------------------------------------------6
        //30 cents
        begin
        moneystate = 8'd30;
        if (enter_coins) NS = ST6;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST7;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST8;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST11;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST6;
                    end
            end
        else if (money == 0) // if the money doesn't change, stay in this state
            begin
            NS = ST6;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------6
        ST7://-----------------------------------------------------------------------------------------------------------------7
        //35 cents
        begin
        moneystate = 8'd35;
        if (enter_coins) NS = ST7;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST8;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST9;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST12;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                begin
                if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST7;
                    end
            end
        
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST7;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------7
        ST8://-----------------------------------------------------------------------------------------------------------------8
        //40 cents
        begin
        moneystate = 8'd40;
        if (enter_coins) NS = ST8;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST9;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST10;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST13;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST0;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 600)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST8;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST8;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------8
        ST9://-----------------------------------------------------------------------------------------------------------------9
        //45 cents
        begin
        moneystate = 8'd45;
        if (enter_coins) NS = ST9;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST10;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST11;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST14;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST1;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST9;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST9;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------9
        ST10://-----------------------------------------------------------------------------------------------------------------10
        //50 cents
        begin
        moneystate = 8'd50;
        if (enter_coins) NS = ST10;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST11;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST12;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST2;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST0;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST10;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST10;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------10
        ST11://-----------------------------------------------------------------------------------------------------------------11
        //55 cents
        begin
        moneystate = 8'd55;
        if (enter_coins) NS = ST11;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST12;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST13;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST3;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST1;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST11;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST11;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------11
        ST12://-----------------------------------------------------------------------------------------------------------------12
        //60 cents
        begin
        moneystate = 8'd60;
        if (enter_coins) NS = ST12;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST13;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST14;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST4;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST2;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        NS = ST0;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST12;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST12;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------12
        ST13://-----------------------------------------------------------------------------------------------------------------13
        //65 cents
        begin
        moneystate = 8'd65;
        if (enter_coins) NS = ST13;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST14;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST5;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST3;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        NS = ST1;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST13;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST13;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------13
        ST14://-----------------------------------------------------------------------------------------------------------------14
        //70 cents
        begin
        moneystate = 8'd70;
        if (enter_coins) NS = ST14;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST6;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST4;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        NS = ST2;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        NS = ST0;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST14;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST14;
            end
        end
        //----------------------------------------------------------------------------------------------------------------------14
        ST15://-----------------------------------------------------------------------------------------------------------------15
        //75 cents
        begin
        moneystate = 8'd75;
        if (enter_coins) NS = ST15;
        if (money != 0 & ~enter_coins) // if the money changes
            begin
                if (money == 8'd5)// if the money changed by 5
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                else if (money == 8'd10)// if the money changed by 10
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                else if (money == 8'd25)// if the money changed by 25
                    begin
                    enter_out = 1;
                    NS = ST15;
                    end
                end
        else if (item !=0 & (output_pressed)) // if they have selected a item
            begin
            if (item == 1)// if first item selected
                    begin
                    if (moneystate >= 40)// if they can buy
                    begin
                    Z = 3'd1;
                    NS = ST7;
                    end
                end
            else if (item == 2)// if second item selected
                    begin
                    if (moneystate >= 50)// if they can buy
                        begin
                        Z = 3'd2;
                        NS = ST5;
                        end
                    end
            else if (item == 3)// if thrid item selected
                    begin
                    if (moneystate >= 60)// if they can buy
                        begin
                        Z = 3'd3;
                        NS = ST3;
                        end
                    end
            else if (item == 4)// if fourth item selected
                    begin
                    if (moneystate >= 70)// if they can buy
                        begin
                        Z = 3'd4;
                        NS = ST1;
                        end
                    end
            else if (item == 5)// if fifth item selected
                    begin
                    if (moneystate >= 75)// if they can buy
                        begin
                        Z = 3'd5;
                        NS = ST0;
                        end
                    end
            else // else stay in state if there is not enough money
                    begin
                    NS = ST15;
                    end
            end
        else if (money == 8'd0) // if the money doesn't change, stay in this state
            begin
            NS = ST15;
            end
        end
        //---------------------------------------------------------------------------------------------------------------------15
        default:
            NS = ST0;
    endcase
    end
endmodule
