module LCD(
  
  input rst,
  input clk,
  
    output reg rs,
    output reg rw,
    output reg e,
    output reg[7:0] data,
    output blon
);


always@(posedge clk or negedge rst) begin
    if(!rst) 
        counter <= 0;
    else if(counter == 32'd7500000)  begin
             counter <= 0;
              done <= 1;
    end
    else begin
        done <=0;
        counter <= counter + 1;
    end
end
reg [3:0] state =0;
reg [3:0] addr=0;

always@(posedge clk or negedge rst) begin
    if(!rst) begin
          rs <=0;
			 rw <=0;
			 data <=0;
			 e <=0;
			 state <=0;
    end
    else if(done) begin
            case(state)
                0: begin
                    rs <= 0;
                    rw <= 0;
                    e <= 1;
                    data <= 8'h38;
                   
                    state <= 1;
                end
                1: begin
                    e<= 0;
                    
                    state <= 2;
                end
					 2: begin
							rs <= 0;
							rw <=0;
							e <= 1;
							data <= 8'h0c;
							
							state <= 3;
						end
					3: begin
						e <= 0;
						
						state <= 4;
					  end
					4:begin
					
					    rs <=0;
					    rw <=0;
					    e <=1;
					    data <=8'h01;
					 
					    state <=5;
					 end
					 5:begin
					     e <=0;
					 
					      state <=6;
					   end
					 6:begin
					     rs <=0;
					     rw <=0;
					     e <=1;
					     data <=8'h40;
					 
					     state <=7;
					 end
					 
					 7:begin
					     e <=0;
					     state <=8;
					 end
					 
					 8:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h0a;
						  state <=9;
					 end
					 
					 9:begin
					    e <=0;
						 state <=9;
					 
					  10:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h0a;
						  state <=11;
					 end
					 11:begin
					 e <=0;
					 state <=12;
					 end
					  12:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h1f;
						  
						  
						  
						  state <=13;
					 end
					 13:begin
					 e <=0;
					 state <=14;
					 end
					 
					  14:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h1f;
						  
						  
						  
						  state <=15;
					 end
					 15:begin
						state <= 16;
					     e <=0;
					 end
					 16:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h1f;
						  
						  state <=17;
					 end
					 17:begin
						state <= 18;
					     e <=0;
					 end
					 18:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h0e;
						  
						  
						  
						  state <=19;
					 end
					 19:begin
						state <= 20;
					     e <=0;
					 end
					 20:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h04;
						  
						  
						  
						  state <=21;
					 end
					 21:begin
						state <= 22;
					     e <=0;
					 end
					 22:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h00;
						  
						  
						  
						  state <=23;
					 end
					 23:begin
						state <= 24;
					     e <=0;
					 end
					 24:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h00;
						  
						  
						  
						  state <=25;
					 end
					 25:begin
						state <= 26;
					     e <=0;
					 end
					 26:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h40;
						  
						  
						  
						  state <=27;
					 end
					 27:begin
						state <=28;
					     e <=0;
					 end
					 28:begin
					     rs <=1;
					     rw <=0;
					     e <=1;
					     data <=8'h00;
						  
						  
						  
						  state <=29;
					 end
					 29:begin
						state <= 30;
					     e <=0;
					 end
					30: begin
						rs <=0;
						rw <= 0;
						data <= 0;
						e<= 0;
						
						state <=30;
					end
					
					endcase
    end
end
endmodule
