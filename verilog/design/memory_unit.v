//Code your design here

module memory_unit (read_data, address, write_data, MemWrite, MemRead, clk);

  //input output declaration
  output reg [31:0] read_data;

  input [31:0] address;
  input MemWrite, MemRead;
  input [31:0] write_data;
  input clk;
  
  //memory declaration
  reg [7:0] Data_Memory [2**16-1:0];

  //memory unit logic
  always@(*) begin

    if (MemRead==1'b1) begin 
	read_data[7:0]   = Data_Memory[address];
	read_data[15:8]  = Data_Memory[address+1];
	read_data[23:16] = Data_Memory[address+2];
        read_data[31:24] = Data_Memory[address+3]; 	
    end
    
    if (clk && MemWrite==1'b1) begin
	Data_Memory[address]   = write_data[7:0];
	Data_Memory[address+1] = write_data[15:8];
     	Data_Memory[address+2] = write_data[23:16];
	Data_Memory[address+3] = write_data[31:24];  	
    end

  end

endmodule
