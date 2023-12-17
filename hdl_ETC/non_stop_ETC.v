module non_stop_ETC (clk, reset_n,sensor1,sensor2, sensor3, valid_Epass, enable, barrier);
	input                     clk        ;
	input                     reset_n    ;
	input                     sensor1    ;
	input                     sensor2    ;
	input                     sensor3    ;
	input        [1:0]        valid_Epass;
	input                     enable     ;
	output                    barrier    ;

	wire init;
	wire up;
	wire down;
	wire en;
	wire dis;
	wire en_barrier;

//module cotroller
controller controller_DUT (
	.clk        (clk        ),
	.reset_n    (reset_n    ),
	.sensor1    (sensor1    ),
	.sensor2    (sensor2    ),
	.sensor3    (sensor3    ),
	.valid_Epass(valid_Epass),
	.enable     (enable     ),

	.init       (init       ),
	.up         (up         ),
	.down       (down       ),
	.en         (en         ),
	.dis        (dis        ));

datapath datapath_DUT(
	.clk        (clk        ),
	.reset_n    (reset_n    ),
	.init       (init       ),
	.up         (up         ),
	.down       (down       ),
	.en         (en         ),
	.dis        (dis        ),
	.en_barrier (en_barrier));

assign barrier = enable ? 1'b1 : en_barrier;
endmodule
