// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Fri Jan 11 09:05:16 2019
// Host        : TheShell running 64-bit unknown
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/victor/CPE233/RAT/RAT1/RAT1_Lab1/RAT1_Lab1.sim/sim_1/synth/func/xsim/ProgRom_tb_func_synth.v
// Design      : ProgRom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module ProgRom
   (PROG_CLK,
    PROG_ADDR,
    PROG_IR);
  input PROG_CLK;
  input [9:0]PROG_ADDR;
  output [17:0]PROG_IR;

  wire [9:0]PROG_ADDR;
  wire [2:0]PROG_ADDR_IBUF;
  wire PROG_CLK;
  wire PROG_CLK_IBUF;
  wire PROG_CLK_IBUF_BUFG;
  wire [17:0]PROG_IR;
  wire \PROG_IR[0]_i_1_n_0 ;
  wire \PROG_IR[11]_i_1_n_0 ;
  wire \PROG_IR[13]_i_1_n_0 ;
  wire \PROG_IR[14]_i_1_n_0 ;
  wire \PROG_IR[15]_i_1_n_0 ;
  wire \PROG_IR[16]_i_1_n_0 ;
  wire \PROG_IR[17]_i_1_n_0 ;
  wire \PROG_IR[2]_i_1_n_0 ;
  wire \PROG_IR[3]_i_1_n_0 ;
  wire \PROG_IR[4]_i_1_n_0 ;
  wire \PROG_IR[6]_i_1_n_0 ;
  wire \PROG_IR[8]_i_1_n_0 ;
  wire [17:0]PROG_IR_OBUF;

  IBUF \PROG_ADDR_IBUF[0]_inst 
       (.I(PROG_ADDR[0]),
        .O(PROG_ADDR_IBUF[0]));
  IBUF \PROG_ADDR_IBUF[1]_inst 
       (.I(PROG_ADDR[1]),
        .O(PROG_ADDR_IBUF[1]));
  IBUF \PROG_ADDR_IBUF[2]_inst 
       (.I(PROG_ADDR[2]),
        .O(PROG_ADDR_IBUF[2]));
  BUFG PROG_CLK_IBUF_BUFG_inst
       (.I(PROG_CLK_IBUF),
        .O(PROG_CLK_IBUF_BUFG));
  IBUF PROG_CLK_IBUF_inst
       (.I(PROG_CLK),
        .O(PROG_CLK_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \PROG_IR[0]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .O(\PROG_IR[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \PROG_IR[11]_i_1 
       (.I0(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \PROG_IR[13]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[1]),
        .I2(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[13]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \PROG_IR[14]_i_1 
       (.I0(PROG_ADDR_IBUF[1]),
        .O(\PROG_IR[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \PROG_IR[15]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \PROG_IR[16]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h71)) 
    \PROG_IR[17]_i_1 
       (.I0(PROG_ADDR_IBUF[2]),
        .I1(PROG_ADDR_IBUF[1]),
        .I2(PROG_ADDR_IBUF[0]),
        .O(\PROG_IR[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    \PROG_IR[2]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[1]),
        .I2(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \PROG_IR[3]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[1]),
        .I2(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \PROG_IR[4]_i_1 
       (.I0(PROG_ADDR_IBUF[1]),
        .I1(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h16)) 
    \PROG_IR[6]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[1]),
        .I2(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \PROG_IR[8]_i_1 
       (.I0(PROG_ADDR_IBUF[0]),
        .I1(PROG_ADDR_IBUF[2]),
        .O(\PROG_IR[8]_i_1_n_0 ));
  OBUF \PROG_IR_OBUF[0]_inst 
       (.I(PROG_IR_OBUF[0]),
        .O(PROG_IR[0]));
  OBUF \PROG_IR_OBUF[10]_inst 
       (.I(PROG_IR_OBUF[10]),
        .O(PROG_IR[10]));
  OBUF \PROG_IR_OBUF[11]_inst 
       (.I(PROG_IR_OBUF[9]),
        .O(PROG_IR[11]));
  OBUF \PROG_IR_OBUF[12]_inst 
       (.I(PROG_IR_OBUF[10]),
        .O(PROG_IR[12]));
  OBUF \PROG_IR_OBUF[13]_inst 
       (.I(PROG_IR_OBUF[13]),
        .O(PROG_IR[13]));
  OBUF \PROG_IR_OBUF[14]_inst 
       (.I(PROG_IR_OBUF[14]),
        .O(PROG_IR[14]));
  OBUF \PROG_IR_OBUF[15]_inst 
       (.I(PROG_IR_OBUF[15]),
        .O(PROG_IR[15]));
  OBUF \PROG_IR_OBUF[16]_inst 
       (.I(PROG_IR_OBUF[16]),
        .O(PROG_IR[16]));
  OBUF \PROG_IR_OBUF[17]_inst 
       (.I(PROG_IR_OBUF[17]),
        .O(PROG_IR[17]));
  OBUF \PROG_IR_OBUF[1]_inst 
       (.I(1'b0),
        .O(PROG_IR[1]));
  OBUF \PROG_IR_OBUF[2]_inst 
       (.I(PROG_IR_OBUF[2]),
        .O(PROG_IR[2]));
  OBUF \PROG_IR_OBUF[3]_inst 
       (.I(PROG_IR_OBUF[3]),
        .O(PROG_IR[3]));
  OBUF \PROG_IR_OBUF[4]_inst 
       (.I(PROG_IR_OBUF[4]),
        .O(PROG_IR[4]));
  OBUF \PROG_IR_OBUF[5]_inst 
       (.I(PROG_IR_OBUF[5]),
        .O(PROG_IR[5]));
  OBUF \PROG_IR_OBUF[6]_inst 
       (.I(PROG_IR_OBUF[6]),
        .O(PROG_IR[6]));
  OBUF \PROG_IR_OBUF[7]_inst 
       (.I(1'b0),
        .O(PROG_IR[7]));
  OBUF \PROG_IR_OBUF[8]_inst 
       (.I(PROG_IR_OBUF[5]),
        .O(PROG_IR[8]));
  OBUF \PROG_IR_OBUF[9]_inst 
       (.I(PROG_IR_OBUF[9]),
        .O(PROG_IR[9]));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[0] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[0]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[0]),
        .R(PROG_ADDR_IBUF[1]));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[11] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[11]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[12] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(PROG_ADDR_IBUF[2]),
        .Q(PROG_IR_OBUF[10]),
        .R(PROG_ADDR_IBUF[1]));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[13] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[13]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[14] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[14]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[15] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[15]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[15]),
        .R(\PROG_IR[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[16] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[16]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[16]),
        .R(PROG_ADDR_IBUF[1]));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[17] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[17]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[2] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[2]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[3] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[3]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[4] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[4]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[6] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[6]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PROG_IR_reg[8] 
       (.C(PROG_CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PROG_IR[8]_i_1_n_0 ),
        .Q(PROG_IR_OBUF[5]),
        .R(PROG_ADDR_IBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
