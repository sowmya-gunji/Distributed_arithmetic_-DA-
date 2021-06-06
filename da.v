`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 11:55:51 AM
// Design Name: 
// Module Name: da
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


module da(clk,X1,X2,X3,X4,A1,A2,A3,A4,y);
    input [31:0]A1,A2,A3,A4;
    input [7:0]X1,X2,X3,X4;
    input clk;
    output reg [31:0]y;
    reg [31:0]lout;
    reg [31:0]ACC_shift,ACC;
    reg w;
    reg [2:0]i;
    initial
    begin 
       ACC=0;ACC_shift=0;i=0;
    end 
    always@(posedge clk)
    begin  
        case({X1[i],X2[i],X3[i],X4[i]})
           0:lout=0;
           1:lout=A4;
           2:lout=A3;
           3:lout= A4+A3;
           4:lout=A2;
           5:lout=A2+A4;
           6:lout=A2+A3;
           7:lout=A2+A3+A4;
           8:lout=A1;
           9:lout=A1+A4;
           10:lout=A1+A3;
           11:lout=A1+A3+A4;
           12:lout=A1+A2;
           13:lout=A1+A2+A4;
           14:lout=A1+A2+A3;
           15:lout=A1+A2+A3+A4;
       endcase
       if(i==7)
        begin
          ACC=(ACC_shift)-lout;
          y=ACC;
          ACC_shift=0;
          ACC=0;i=0;
          end
        else if(i<7)
        begin
         ACC=(ACC_shift)+lout;
         w=ACC[31];
         ACC_shift=(ACC>>1);
         ACC_shift[31]=w;
         end
         i=i+1;
       end
endmodule