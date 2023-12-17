`timescale 1ns/1ns

module non_stop_ETC_tb ();
reg clk,reset_n, sensor1, sensor2,sensor3,enable;
reg [1:0] valid_Epass;
wire barrier;

non_stop_ETC DUT(
	.clk        (clk        ),
	.reset_n    (reset_n    ),
	.sensor1    (sensor1    ),
	.sensor2    (sensor2    ),
	.sensor3    (sensor3    ),
	.valid_Epass(valid_Epass),
	.enable     (enable     ),
	//.done       (done       ),
	.barrier    (barrier    ));

always begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    
/***********************************************************
                    case1: start nonstop_etc
***********************************************************/
/*$display("Case 1: Started\n");
$display("-----------------------------------------------------\n");
    fork 
        begin
        reset_n = 1;
        sensor1 = 0;
        sensor2 = 0;
        sensor3 = 0;
        enable = 0;
        #10;
        reset_n = 0;
        sensor1 = 0;
        sensor2 = 0;
        sensor3 = 0;
        #10;
        reset_n = 1;
        end
    join
    end*/

/////////////////////////////////////////////////////////////////////
////  															//// 
////       						case2: 							////
////															////
///////////////////////////////////////////////////////////////////
/*$display("Case 2: Started\n");
$display("-----------------------------------------------------\n");
    fork

		//sensor1
		begin     
		reset_n=0;
		clk=0;
		sensor1=0;
		enable=0;
		//xe 1
		#10;
		reset_n=1;
		sensor1=1;
		#(60-10);
		sensor1=0;
		// xe 2
		#300
		sensor1=1;
		#50;
		sensor1=0;
		end

		// sensor 2
		begin 
			// Luot thu 1
			sensor2 = 0;
			#150;
			sensor2 = 1;
			#10;
			valid_Epass = 2'b10;
			#40; // Thoi gian oto di qua 1 sensor + 10
			sensor2 = 0;
			valid_Epass = 2'b00;

			// Luot thu 2
			#280;  // Thoi gian oto di tu sensor 1 den sensor 2
			sensor2 = 1;
			#10;
			valid_Epass = 2'b10;
			#40; // Thoi gian oto di qua 1 sensor
			sensor2 = 0;
			valid_Epass = 2'b00;
		end
		// sensor 3
		begin 
			// Luot thu 1
			sensor3 = 0;
			#290
			sensor3 = 1;
			#50
			sensor3 = 0;

			// Luot thu 2
			#220; // Thoi gian oto di tu sensor 1 den sensor 3
			sensor3 = 1;
			#50; // Thoi gian oto di qua 1 sensor
			sensor3 = 0;
		end
	join*/

/***********************************************************
            case3: 
***********************************************************/
/*$display("Case 3: Started\n");
$display("-----------------------------------------------------\n");
	fork begin
		reset_n=0;
		sensor1=0;
		sensor2=0;
        sensor3=0;
		enable=0;
		#10;
		sensor1=1;
		reset_n=1;
		#50;
		sensor1=0;
		#90;
		sensor2=1;
		#10;
		valid_Epass=2'b00;
		#40;
		sensor2=0;
		#20;
		enable=1;
		#70;
		sensor3=1;
		#30
		sensor1=1;
		#20;
		sensor3=0;
		enable=0;
		#30;
		sensor1=0;
		#40;
		sensor2=1;
		#10;
		valid_Epass=2'b10;
		#40;
		sensor2=0;
		#10;
		valid_Epass=2'b00;
		#50;
		sensor3=1;
		#40;
		sensor3=0;
	end
	join*/

/***********************************************************
            case4: 
***********************************************************/
/*$display("Case 4: Started\n");
$display("-----------------------------------------------------\n");
fork
	begin
		reset_n=0;
		sensor1=0;
		sensor2=0;
        sensor3=0;
		enable=0;
		#10;
		sensor1=1;
		reset_n=1;
		#50;
		sensor1=0;
		#90;
		sensor2=1;
		#10;//160
		valid_Epass=2'b10;
		#40;//200
		sensor2=0;
		#10;
		valid_Epass=2'b00;
		#90;
		sensor3=1;
		#30;//320
		sensor1=1;
		#20;
		sensor3=0;
		#30;//370
		sensor1=0;
		#70;
		sensor2=1;
		#10;
		valid_Epass=2'b10;
		#30;
		sensor2=0;
        #10;
		valid_Epass=2'b00;
		#20;
		sensor3=1;
		#40;
		sensor3=0;
	end
join*/

/***********************************************************
            case5: 
***********************************************************/
$display("Case 5: Started\n");
$display("-----------------------------------------------------\n");
fork
	begin
		reset_n=0;
		sensor1=0;
		sensor2=0;
        sensor3=0;
		enable=0;
		#10;
		sensor1=1;
		reset_n=1;
		#50;
		sensor1=0;
		#90;
		sensor2=1;
		#10;//160
		valid_Epass=2'b10;
		#40;//200
		sensor2=0;
		#10;
		valid_Epass=2'b00;
		#90;
		sensor3=1;
		#30;//320
		sensor1=1;
		#20;
		sensor3=0;
		#30;//370
		sensor1=0;
		#70;
		sensor2=1;
		#10;
		valid_Epass=2'b11;
		#30;
		sensor2=0;
        #10;
		valid_Epass=2'b00;
		#10;
		enable=1;
		#20;
		sensor3=1;
		#40;
		sensor3=0;
		enable=0;
	end
join
    end
endmodule



