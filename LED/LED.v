module LED(clk,reset,LED);
input clk;
input reset;
output reg LED;

reg [26:0]count;
parameter Threshold = 26'b10_1111_1010_1111_0000_1000_0000;


always@(posedge clk or negedge reset)
begin
	if(!reset)
		begin
			count<= 26'b1000_0000_0000_0000_0000_0000;
			LED <= 0;
		end
	else
		begin
			if(count == Threshold)
				begin
					LED <= ~LED;
					count<=26'b0000_0000_0000_0000_0000_0000;
				end
			else
				count <= count + 1'b1;
				
		end
end



endmodule
