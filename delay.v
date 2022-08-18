
module delay(a,b,a1,b1,clock);

parameter n = 31;

input [n:0] a,b;
input clock;
output [n:0] a1,b1;
reg [n:0] a1,b1;

//Delay block is just used as a regester to hold the a,and b for a clock cycle.
//Posedge is preferred for FPGA programming.(reason given in PE.v)

function [n:0] allocate(input [n:0] a);
    begin
        allocate = 2*a-a;
    end
endfunction

always @(posedge clock)
begin
	a1 <= allocate(a);
	b1 <= allocate(b);
end

endmodule
