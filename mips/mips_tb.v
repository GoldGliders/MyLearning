`timescale 1ns/1ns
`include "dmem/dmem.v"
`include "imem/imem.v"
module mips_tb;

	reg clock;
	reg reset;
	wire [31:0] pcout;
	wire [31:0] inst;
	wire [4:0] waddrout;
	wire [31:0] wdout;
	wire [31:0] rd1;
	wire [31:0] rd2;
	wire [31:0] aluop2out;
	wire [31:0] aluout;
	wire [31:0] dmemout;
	
	wire [2:0] ALUCtr;
	wire RegDst;
	wire Jump;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0] ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	
	mips 		mips(.clock(clock), .reset(reset), .pcout(pcout), .inst(inst), .waddrout(waddrout), .wdout(wdout), .rd1(rd1), .rd2(rd2), .aluop2out(aluop2out), 
				.aluout(aluout), .dmemout(dmemout), .ALUCtr(ALUCtr), .RegDst(RegDst), .Jump(Jump), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), 
				.ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
	imem 		imem 	(.addr(pcout), .inst(inst));
	dmem		dmem	(.addr(aluout), .rddata(dmemout), .wrdata(rd2), .MemRead(MemRead), .MemWrite(MemWrite), .clock(clock));

	initial begin
	`define R_TYPE 6'b000000
	`define LW 6'b100011
	`define SW 6'b101011
	`define BEQ 6'b000100
	`define J 6'b000010
	`define ADD_FUNCT 6'b100000
	`define SUB_FUNCT 6'b100010
	`define AND_FUNCT 6'b100100
	`define OR_FUNCT 6'b100101
	`define SLT_FUNCT 6'b101010

	// instruction codes labels instructions 
	imem.mcell['h0] ={`LW, 5'd0, 5'd1, 16'h0000}; //lw $1, 'h0000($0) ;
	imem.mcell['h4] ={`LW, 5'd0, 5'd2, 16'h0004}; //lw $2, 'h0004($0) ;
	imem.mcell['h8] ={`LW, 5'd0, 5'd3, 16'h0008}; //lw $3, 'h0008($0) ;
	imem.mcell['hc] ={`LW, 5'd0, 5'd14, 16'h000c}; //lw $14, 'h000c($0) ;	
	imem.mcell['h10] ={`LW, 5'd0, 5'd15, 16'h0010}; //lw $15, 'h0010($0) ;	
	imem.mcell['h14] ={`LW, 5'd0, 5'd16, 16'h0014}; //lw $16, 'h0014($0) ;		
	
	imem.mcell['h18]={`R_TYPE, 5'd1, 5'd2, 5'd4, 5'd0, `ADD_FUNCT}; //add $4, $1, $2 ; 
	imem.mcell['h1c]={`SW, 5'd0, 5'd4, 16'h0020}; //sw $4, 'h0020($0) ; 
	imem.mcell['h20]={`R_TYPE, 5'd1, 5'd2, 5'd5, 5'd0, `SUB_FUNCT}; //sub $5, $1, $2 ; 
	imem.mcell['h24]={`SW, 5'd0, 5'd5, 16'h0024}; //sw $5, 'h0024($0) ; 
	imem.mcell['h28]={`R_TYPE, 5'd1, 5'd2, 5'd7, 5'd0, `AND_FUNCT}; //and $7, $1, $2 ; 
	imem.mcell['h2c]={`SW, 5'd0, 5'd7, 16'h0028}; //sw $7, 'h0028($0) ; 
	imem.mcell['h30]={`R_TYPE, 5'd1, 5'd2, 5'd8, 5'd0, `OR_FUNCT}; //or $8, $1, $2 ; 
	imem.mcell['h34]={`SW, 5'd0, 5'd8, 16'h002c}; //sw $8, 'h002c($0) ; 
	imem.mcell['h38]={`R_TYPE, 5'd1, 5'd2, 5'd13, 5'd0, `SLT_FUNCT}; //slt $13, $1,$2 ; 
	imem.mcell['h3c]={`SW, 5'd0, 5'd13, 16'h0030}; //sw $13, 'h0030($0); 

	imem.mcell['h40]={`BEQ, 5'd14, 5'd16, 16'd2}; //beq $14, $16, 8; (pc + 4 + 8 = 32'h40 + 32'h4 + 32'h8 = 32'h4c)
	imem.mcell['h44]={`R_TYPE, 5'd14, 5'd15, 5'd14, 5'd0, `ADD_FUNCT}; //add $14, $14, $15;
	imem.mcell['h48]={`J, 26'd16}; //j h'40 (jump to h40)
	imem.mcell['h4c]={`J, 26'd19}; //j h'48 (jump to h48)

	dmem.mcell['h0000]='h335e;
	dmem.mcell['h0004]='h0d21;
	dmem.mcell['h0008]='hc;
	dmem.mcell['h000c]='h0;
	dmem.mcell['h0010]='h1;
	dmem.mcell['h0014]='h4;
	dmem.mcell['h0018]='h0;
	dmem.mcell['h001c]='h0;
	
	dmem.mcell['h0020]='h0;
	dmem.mcell['h0024]='h0;
	dmem.mcell['h0028]='h0;
	dmem.mcell['h002c]='h0;
	dmem.mcell['h0030]='h0;

	clock = 1'b1;
	reset = 1'b0;
	
	#5
	reset = 1'b1;
	
	#5
	reset = 1'b0;
	
	#300
	$display("RESULT:");
	$display("add: 407f: %x",dmem.mcell['h0020]);
	$display("sub: 263d: %x",dmem.mcell['h0024]);
	$display("and: 100: %x",dmem.mcell['h0028]);
	$display("or: 3f7f: %x",dmem.mcell['h002c]);
	$display("slt: 0: %x",dmem.mcell['h0030]);
	$finish;
	
	end
	always #5 clock=~clock;

endmodule


