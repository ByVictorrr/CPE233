// File gen_DCDCR.vhdl translated with vhd2vl v2.4 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 1995

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002, 2005, 2008-2010 Larry Doolittle - LBNL
//     http://doolittle.icarus.com/~larry/vhd2vl/
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// no timescale needed

module gen_dec(
ADDR_15_13,
CS2,
CS4,
CS6
);

input [2:0] ADDR_15_13;
output CS2;
output CS4;
output CS6;

wire [2:0] ADDR_15_13;
reg CS2;
reg CS4;
reg CS6;



  always @(ADDR_15_13) begin
    case(ADDR_15_13)
    3'b 010 : begin
      CS2 <= 1'b 0;
      CS4 <= 1'b 1;
      CS6 <= 1'b 0;
      // 2
    end
    3'b 100 : begin
      CS2 <= 1'b 1;
      CS4 <= 1'b 0;
      CS6 <= 1'b 0;
      // 4
    end
    3'b 110 : begin
      CS2 <= 1'b 1;
      CS4 <= 1'b 1;
      CS6 <= 1'b 0;
      // 6
    end
    default : begin
      CS2 <= 1'b 1;
      CS4 <= 1'b 1;
      CS6 <= 1'b 1;
      // catchall
    end
    endcase
  end


endmodule
