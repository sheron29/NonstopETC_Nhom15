module controller (
	//in
	input clk,    
	input reset_n,  
	input sensor1,
	input sensor2,
	input sensor3,
	input [1:0] valid_Epass,
	input enable,
	//out
	output reg       init       ,
	output reg       up         ,
	output reg       down       ,
	output reg       en         ,
	output reg       dis        );

localparam START      = 2'b00,//trang thai ban dau
		   COUNT_TIME = 2'b01,
		   CALC       = 2'b10;
localparam IDLE       = 2'b00,
           WAIT_EN    = 2'b01,
           WAIT_DIS   = 2'b10;

reg       reg_sensor3                  ;// reg_sensor3 is a register stores the value of sensor3
reg [1:0] next_state, current_state    ;
reg [1:0] next_state_f, current_state_f;

wire [1:0] car1, car2, car3;

count_car count_car_DUT(
	.clk    (clk    ),
	.reset_n(reset_n),
	.sensor1(sensor1),
	.sensor2(sensor2),
	.sensor3(sensor3),
	.car1   (car1   ),
	.car2   (car2   ),
	.car3   (car3   ));

/**============================================
 * 	          Update value for current_state
 *=============================================*/
always @(posedge clk or negedge reset_n) begin
	if(~reset_n) begin
		current_state <= START;//tra về 00 nếu rs = 0 ACTIVE LOW
	end else begin
		current_state <= next_state;//
	end
end

/**============================================
 * 	          Update value for reg_sensor3
 *=============================================*/
always @(posedge clk or negedge reset_n) begin
	if(~reset_n) begin
		reg_sensor3 <= 0;
	end else begin
		reg_sensor3 <= sensor3;
	end
end

/**============================================
 * 	          Update value for Controll Variables
 *=============================================*/
always @(*) begin
	init = 0;
	//count = 0;
	up = 0;//mở barrier
	en = 0;//enable
	dis = 0;//disable
	down = 0;//đóng barrier
	next_state = current_state;
	case (current_state)
		START: begin 
			init = 1;
			if ( sensor1 & (car1 != car2)) begin
				next_state = COUNT_TIME;
			end
		end

		COUNT_TIME: begin 
			//count = 1;
			if (sensor2) begin
				next_state = CALC;
			end /*else begin
				next_state = START;
			end*/
		end

		CALC: begin //valid_Epass
			if (valid_Epass == 2'b00 || valid_Epass == 2'b11) begin
				next_state = CALC;
			end
			else begin
				if (valid_Epass == 2'b10) begin
					up <= 1'b1;
					next_state = START;
				end
				else if (valid_Epass == 2'b01) begin 
					dis <= 1'b1;
				end

				if (enable) begin
					next_state = START;
				end

			end
		end
	endcase
	if ((reg_sensor3 & !sensor3) & (car2==car3)) begin
		down = 1;
	end
end
endmodule
