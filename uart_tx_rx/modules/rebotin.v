module rebotin  (
    clk,
    Q
);

    output [7:0] Q;
    input clk;

    parameter cycles_per_second = 100000000;

    reg [32:0] divider;
    reg [7:0] Q = 8'b00000001;
    reg [0:0] state = 1'b1;


    always @(posedge clk) begin
       if (divider == cycles_per_second)
         begin
            divider <= 0;
            // Q <= Q + 8'd1;
	    if (state == 1'b1) begin
	    	Q <= Q << 1;
		if(Q == 8'b01000000) state <= 1'b0;
	    end else begin
		Q <= Q >> 1;
		if(Q == 8'b00000010) state <= 1'b1;
	    end 
         end
       else  divider <= divider + 1;
    end


endmodule 
