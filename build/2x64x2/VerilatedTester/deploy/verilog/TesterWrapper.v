module MultiSeqGen(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_init,
    input [31:0] io_in_bits_count,
    input [31:0] io_in_bits_step,
    input  io_out_ready,
    output io_out_valid,
    output[31:0] io_out_bits
);

  reg [31:0] regSeqElem;
  wire[31:0] T0;
  wire[31:0] T1;
  wire T2;
  wire T3;
  reg  regState;
  wire T18;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg [31:0] regMaxCount;
  wire[31:0] T8;
  reg [31:0] regCounter;
  wire[31:0] T9;
  wire[31:0] T10;
  wire[31:0] T11;
  wire T12;
  wire[31:0] T13;
  reg [31:0] regStep;
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire T17;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regSeqElem = {1{$random}};
    regState = {1{$random}};
    regMaxCount = {1{$random}};
    regCounter = {1{$random}};
    regStep = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_bits = regSeqElem;
  assign T0 = T15 ? T13 : T1;
  assign T1 = T2 ? io_in_bits_init : regSeqElem;
  assign T2 = T3 & io_in_valid;
  assign T3 = 1'h0 == regState;
  assign T18 = reset ? 1'h0 : T4;
  assign T4 = T6 ? 1'h0 : T5;
  assign T5 = T2 ? 1'h1 : regState;
  assign T6 = T12 & T7;
  assign T7 = regCounter == regMaxCount;
  assign T8 = T2 ? io_in_bits_count : regMaxCount;
  assign T9 = T15 ? T11 : T10;
  assign T10 = T2 ? 32'h0 : regCounter;
  assign T11 = regCounter + 32'h1;
  assign T12 = 1'h1 == regState;
  assign T13 = regSeqElem + regStep;
  assign T14 = T2 ? io_in_bits_step : regStep;
  assign T15 = T16 & io_out_ready;
  assign T16 = T12 & T17;
  assign T17 = T7 ^ 1'h1;
  assign io_out_valid = T16;
  assign io_in_ready = T3;

  always @(posedge clk) begin
    if(T15) begin
      regSeqElem <= T13;
    end else if(T2) begin
      regSeqElem <= io_in_bits_init;
    end
    if(reset) begin
      regState <= 1'h0;
    end else if(T6) begin
      regState <= 1'h0;
    end else if(T2) begin
      regState <= 1'h1;
    end
    if(T2) begin
      regMaxCount <= io_in_bits_count;
    end
    if(T15) begin
      regCounter <= T11;
    end else if(T2) begin
      regCounter <= 32'h0;
    end
    if(T2) begin
      regStep <= io_in_bits_step;
    end
  end
endmodule

module BurstyMultiSeqGen(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_init,
    input [31:0] io_in_bits_count,
    input [31:0] io_in_bits_step,
    input  io_out_ready,
    output io_out_valid,
    output[31:0] io_out_bits_ind,
    output[31:0] io_out_bits_step
);

  reg [31:0] regStep;
  wire[31:0] T36;
  wire[34:0] T0;
  wire[34:0] T1;
  wire[34:0] T37;
  wire[34:0] T2;
  wire T3;
  wire T4;
  reg [1:0] regState;
  wire[1:0] T38;
  wire[1:0] T5;
  wire[1:0] T6;
  wire[1:0] T7;
  wire T8;
  wire T9;
  reg [31:0] regMaxCount;
  wire[31:0] T10;
  reg [31:0] regCounter;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  reg [31:0] regMaxCountWithBurst;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[28:0] T21;
  wire T22;
  wire[31:0] T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire[34:0] T39;
  wire[28:0] T28;
  wire T29;
  reg [31:0] regSeqElem;
  wire[31:0] T30;
  wire[31:0] T31;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire T35;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regStep = {1{$random}};
    regState = {1{$random}};
    regMaxCount = {1{$random}};
    regCounter = {1{$random}};
    regMaxCountWithBurst = {1{$random}};
    regSeqElem = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_bits_step = regStep;
  assign T36 = T0[31:0];
  assign T0 = T29 ? T39 : T1;
  assign T1 = T3 ? T2 : T37;
  assign T37 = {3'h0, regStep};
  assign T2 = io_in_bits_step << 2'h3;
  assign T3 = T4 & io_in_valid;
  assign T4 = 2'h0 == regState;
  assign T38 = reset ? 2'h0 : T5;
  assign T5 = T8 ? 2'h0 : T6;
  assign T6 = T29 ? 2'h2 : T7;
  assign T7 = T3 ? 2'h1 : regState;
  assign T8 = T27 & T9;
  assign T9 = regCounter == regMaxCount;
  assign T10 = T3 ? io_in_bits_count : regMaxCount;
  assign T11 = T24 ? T23 : T12;
  assign T12 = T15 ? T14 : T13;
  assign T13 = T3 ? 32'h0 : regCounter;
  assign T14 = regCounter + 32'h8;
  assign T15 = T16 & io_out_ready;
  assign T16 = T22 & T17;
  assign T17 = T18 ^ 1'h1;
  assign T18 = regCounter == regMaxCountWithBurst;
  assign T19 = T3 ? T20 : regMaxCountWithBurst;
  assign T20 = {T21, 3'h0};
  assign T21 = io_in_bits_count >> 2'h3;
  assign T22 = 2'h1 == regState;
  assign T23 = regCounter + 32'h1;
  assign T24 = T25 & io_out_ready;
  assign T25 = T27 & T26;
  assign T26 = T9 ^ 1'h1;
  assign T27 = 2'h2 == regState;
  assign T39 = {6'h0, T28};
  assign T28 = regStep >> 2'h3;
  assign T29 = T22 & T18;
  assign io_out_bits_ind = regSeqElem;
  assign T30 = T24 ? T34 : T31;
  assign T31 = T15 ? T33 : T32;
  assign T32 = T3 ? io_in_bits_init : regSeqElem;
  assign T33 = regSeqElem + regStep;
  assign T34 = regSeqElem + regStep;
  assign io_out_valid = T35;
  assign T35 = T25 ? 1'h1 : T16;
  assign io_in_ready = T4;

  always @(posedge clk) begin
    regStep <= T36;
    if(reset) begin
      regState <= 2'h0;
    end else if(T8) begin
      regState <= 2'h0;
    end else if(T29) begin
      regState <= 2'h2;
    end else if(T3) begin
      regState <= 2'h1;
    end
    if(T3) begin
      regMaxCount <= io_in_bits_count;
    end
    if(T24) begin
      regCounter <= T23;
    end else if(T15) begin
      regCounter <= T14;
    end else if(T3) begin
      regCounter <= 32'h0;
    end
    if(T3) begin
      regMaxCountWithBurst <= T20;
    end
    if(T24) begin
      regSeqElem <= T34;
    end else if(T15) begin
      regSeqElem <= T33;
    end else if(T3) begin
      regSeqElem <= io_in_bits_init;
    end
  end
endmodule

module SRLQueue_8(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[1:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[31:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(2),
    .width(32)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_8(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[31:0] SRLQueue_io_deq_bits;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_8 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module SRLQueue_9(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_ind,
    input [31:0] io_enq_bits_step,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_ind,
    output[31:0] io_deq_bits_step,
    output[1:0] io_count
);

  wire T0;
  wire[63:0] T1;
  wire[63:0] T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire T5;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[63:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {io_enq_bits_ind, io_enq_bits_step};
  assign io_count = Q_srl_count;
  assign io_deq_bits_step = T3;
  assign T3 = Q_srl_o_d[31:0];
  assign io_deq_bits_ind = T4;
  assign T4 = Q_srl_o_d[63:32];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T5;
  assign T5 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(2),
    .width(64)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_9(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_ind,
    input [31:0] io_enq_bits_step,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_ind,
    output[31:0] io_deq_bits_step,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[31:0] SRLQueue_io_deq_bits_ind;
  wire[31:0] SRLQueue_io_deq_bits_step;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_step = SRLQueue_io_deq_bits_step;
  assign io_deq_bits_ind = SRLQueue_io_deq_bits_ind;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_9 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_ind( io_enq_bits_ind ),
       .io_enq_bits_step( io_enq_bits_step ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_ind( SRLQueue_io_deq_bits_ind ),
       .io_deq_bits_step( SRLQueue_io_deq_bits_step ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module BlockStridedRqGen_0(input clk, input reset,
    input [31:0] io_block_intra_step,
    input [31:0] io_block_intra_count,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_base,
    input [31:0] io_in_bits_block_step,
    input [31:0] io_in_bits_block_count,
    input  io_out_ready,
    output io_out_valid,
    output[5:0] io_out_bits_channelID,
    output io_out_bits_isWrite,
    output[31:0] io_out_bits_addr,
    output[7:0] io_out_bits_numBytes,
    output io_out_bits_metaData
);

  wire[7:0] T0;
  wire MultiSeqGen_io_in_ready;
  wire MultiSeqGen_io_out_valid;
  wire[31:0] MultiSeqGen_io_out_bits;
  wire BurstyMultiSeqGen_io_in_ready;
  wire BurstyMultiSeqGen_io_out_valid;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_ind;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_step;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[31:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[31:0] FPGAQueue_1_io_deq_bits_ind;
  wire[31:0] FPGAQueue_1_io_deq_bits_step;


  assign io_out_bits_metaData = 1'h0;
  assign io_out_bits_numBytes = T0;
  assign T0 = FPGAQueue_1_io_deq_bits_step[7:0];
  assign io_out_bits_addr = FPGAQueue_1_io_deq_bits_ind;
  assign io_out_bits_isWrite = 1'h0;
  assign io_out_bits_channelID = 6'h0;
  assign io_out_valid = FPGAQueue_1_io_deq_valid;
  assign io_in_ready = MultiSeqGen_io_in_ready;
  MultiSeqGen MultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( MultiSeqGen_io_in_ready ),
       .io_in_valid( io_in_valid ),
       .io_in_bits_init( io_in_bits_base ),
       .io_in_bits_count( io_in_bits_block_count ),
       .io_in_bits_step( io_in_bits_block_step ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( MultiSeqGen_io_out_valid ),
       .io_out_bits( MultiSeqGen_io_out_bits )
  );
  BurstyMultiSeqGen BurstyMultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits_init( FPGAQueue_io_deq_bits ),
       .io_in_bits_count( io_block_intra_count ),
       .io_in_bits_step( io_block_intra_step ),
       .io_out_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_out_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_out_bits_step( BurstyMultiSeqGen_io_out_bits_step )
  );
  FPGAQueue_8 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( MultiSeqGen_io_out_valid ),
       .io_enq_bits( MultiSeqGen_io_out_bits ),
       .io_deq_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_9 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_enq_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_enq_bits_step( BurstyMultiSeqGen_io_out_bits_step ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits_ind( FPGAQueue_1_io_deq_bits_ind ),
       .io_deq_bits_step( FPGAQueue_1_io_deq_bits_step )
       //.io_count(  )
  );
endmodule

module FetchRouteGen(input clk, input reset,
    input  io_init_new,
    input [15:0] io_tiles_per_row,
    input [9:0] io_bram_addr_base,
    input [1:0] io_bram_id_start,
    input [1:0] io_bram_id_range,
    output io_in_ready,
    input  io_in_valid,
    input [63:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits_data,
    output[1:0] io_out_bits_id,
    output[9:0] io_out_bits_addr
);

  wire[9:0] T0;
  reg [9:0] regAddr;
  wire[9:0] T24;
  wire[9:0] T1;
  wire[9:0] T2;
  wire[9:0] T3;
  wire[9:0] T4;
  wire T5;
  reg [15:0] regTilesPerRowMinusOne;
  wire[15:0] T25;
  wire[15:0] T6;
  wire[15:0] T7;
  wire[15:0] T26;
  wire T8;
  reg [9:0] regAddrBase;
  wire[9:0] T27;
  wire[15:0] T28;
  wire[15:0] T9;
  wire[15:0] T29;
  wire[9:0] T10;
  wire[15:0] T11;
  wire[15:0] T12;
  reg [15:0] regTilesPerRow;
  wire[15:0] T30;
  wire[15:0] T13;
  wire T14;
  wire T15;
  reg [1:0] regBRAMRange;
  wire[1:0] T31;
  wire[1:0] T16;
  reg [1:0] regBRAMTarget;
  wire[1:0] T32;
  wire[1:0] T17;
  wire[1:0] T18;
  wire[1:0] T19;
  wire[1:0] T20;
  wire[1:0] T21;
  wire[15:0] T33;
  wire[1:0] T22;
  reg [1:0] regBRAMStart;
  wire[1:0] T34;
  wire[1:0] T23;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regAddr = {1{$random}};
    regTilesPerRowMinusOne = {1{$random}};
    regAddrBase = {1{$random}};
    regTilesPerRow = {1{$random}};
    regBRAMRange = {1{$random}};
    regBRAMTarget = {1{$random}};
    regBRAMStart = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_bits_addr = T0;
  assign T0 = regAddrBase + regAddr;
  assign T24 = reset ? 10'h0 : T1;
  assign T1 = T8 ? T3 : T2;
  assign T2 = io_init_new ? 10'h0 : regAddr;
  assign T3 = T5 ? 10'h0 : T4;
  assign T4 = regAddr + 10'h1;
  assign T5 = T26 == regTilesPerRowMinusOne;
  assign T25 = reset ? 16'h0 : T6;
  assign T6 = io_init_new ? T7 : regTilesPerRowMinusOne;
  assign T7 = io_tiles_per_row - 16'h1;
  assign T26 = {6'h0, regAddr};
  assign T8 = io_in_valid & io_out_ready;
  assign T27 = T28[9:0];
  assign T28 = reset ? 16'h0 : T9;
  assign T9 = T8 ? T11 : T29;
  assign T29 = {6'h0, T10};
  assign T10 = io_init_new ? io_bram_addr_base : regAddrBase;
  assign T11 = T33 + T12;
  assign T12 = T14 ? regTilesPerRow : 16'h0;
  assign T30 = reset ? 16'h0 : T13;
  assign T13 = io_init_new ? io_tiles_per_row : regTilesPerRow;
  assign T14 = T15 & T5;
  assign T15 = regBRAMTarget == regBRAMRange;
  assign T31 = reset ? 2'h0 : T16;
  assign T16 = io_init_new ? io_bram_id_range : regBRAMRange;
  assign T32 = reset ? 2'h0 : T17;
  assign T17 = T8 ? T19 : T18;
  assign T18 = io_init_new ? 2'h0 : regBRAMTarget;
  assign T19 = T5 ? T20 : regBRAMTarget;
  assign T20 = T15 ? 2'h0 : T21;
  assign T21 = regBRAMTarget + 2'h1;
  assign T33 = {6'h0, regAddrBase};
  assign io_out_bits_id = T22;
  assign T22 = regBRAMStart + regBRAMTarget;
  assign T34 = reset ? 2'h0 : T23;
  assign T23 = io_init_new ? io_bram_id_start : regBRAMStart;
  assign io_out_bits_data = io_in_bits;
  assign io_out_valid = io_in_valid;
  assign io_in_ready = io_out_ready;

  always @(posedge clk) begin
    if(reset) begin
      regAddr <= 10'h0;
    end else if(T8) begin
      regAddr <= T3;
    end else if(io_init_new) begin
      regAddr <= 10'h0;
    end
    if(reset) begin
      regTilesPerRowMinusOne <= 16'h0;
    end else if(io_init_new) begin
      regTilesPerRowMinusOne <= T7;
    end
    regAddrBase <= T27;
    if(reset) begin
      regTilesPerRow <= 16'h0;
    end else if(io_init_new) begin
      regTilesPerRow <= io_tiles_per_row;
    end
    if(reset) begin
      regBRAMRange <= 2'h0;
    end else if(io_init_new) begin
      regBRAMRange <= io_bram_id_range;
    end
    if(reset) begin
      regBRAMTarget <= 2'h0;
    end else if(T8) begin
      regBRAMTarget <= T19;
    end else if(io_init_new) begin
      regBRAMTarget <= 2'h0;
    end
    if(reset) begin
      regBRAMStart <= 2'h0;
    end else if(io_init_new) begin
      regBRAMStart <= io_bram_id_start;
    end
  end
endmodule

module FetchInterconnect(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [63:0] io_in_bits_data,
    input [1:0] io_in_bits_id,
    input [9:0] io_in_bits_addr,
    output[9:0] io_node_out_3_addr,
    output[63:0] io_node_out_3_writeData,
    output io_node_out_3_writeEn,
    output[9:0] io_node_out_2_addr,
    output[63:0] io_node_out_2_writeData,
    output io_node_out_2_writeEn,
    output[9:0] io_node_out_1_addr,
    output[63:0] io_node_out_1_writeData,
    output io_node_out_1_writeEn,
    output[9:0] io_node_out_0_addr,
    output[63:0] io_node_out_0_writeData,
    output io_node_out_0_writeEn
);

  wire T0;
  reg  regNodeValid_0;
  wire T8;
  wire T1;
  reg [1:0] regNodePacket_0_id;
  reg [63:0] regNodePacket_0_data;
  reg [9:0] regNodePacket_0_addr;
  wire T2;
  reg  regNodeValid_1;
  wire T9;
  wire T3;
  reg [1:0] regNodePacket_1_id;
  reg [63:0] regNodePacket_1_data;
  reg [9:0] regNodePacket_1_addr;
  wire T4;
  reg  regNodeValid_2;
  wire T10;
  wire T5;
  reg [1:0] regNodePacket_2_id;
  reg [63:0] regNodePacket_2_data;
  reg [9:0] regNodePacket_2_addr;
  wire T6;
  reg  regNodeValid_3;
  wire T11;
  wire T7;
  reg [1:0] regNodePacket_3_id;
  reg [63:0] regNodePacket_3_data;
  reg [9:0] regNodePacket_3_addr;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regNodeValid_0 = {1{$random}};
    regNodePacket_0_id = {1{$random}};
    regNodePacket_0_data = {2{$random}};
    regNodePacket_0_addr = {1{$random}};
    regNodeValid_1 = {1{$random}};
    regNodePacket_1_id = {1{$random}};
    regNodePacket_1_data = {2{$random}};
    regNodePacket_1_addr = {1{$random}};
    regNodeValid_2 = {1{$random}};
    regNodePacket_2_id = {1{$random}};
    regNodePacket_2_data = {2{$random}};
    regNodePacket_2_addr = {1{$random}};
    regNodeValid_3 = {1{$random}};
    regNodePacket_3_id = {1{$random}};
    regNodePacket_3_data = {2{$random}};
    regNodePacket_3_addr = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_node_out_0_writeEn = T0;
  assign T0 = T1 & regNodeValid_0;
  assign T8 = reset ? 1'h0 : io_in_valid;
  assign T1 = regNodePacket_0_id == 2'h0;
  assign io_node_out_0_writeData = regNodePacket_0_data;
  assign io_node_out_0_addr = regNodePacket_0_addr;
  assign io_node_out_1_writeEn = T2;
  assign T2 = T3 & regNodeValid_1;
  assign T9 = reset ? 1'h0 : regNodeValid_0;
  assign T3 = regNodePacket_1_id == 2'h1;
  assign io_node_out_1_writeData = regNodePacket_1_data;
  assign io_node_out_1_addr = regNodePacket_1_addr;
  assign io_node_out_2_writeEn = T4;
  assign T4 = T5 & regNodeValid_2;
  assign T10 = reset ? 1'h0 : regNodeValid_1;
  assign T5 = regNodePacket_2_id == 2'h2;
  assign io_node_out_2_writeData = regNodePacket_2_data;
  assign io_node_out_2_addr = regNodePacket_2_addr;
  assign io_node_out_3_writeEn = T6;
  assign T6 = T7 & regNodeValid_3;
  assign T11 = reset ? 1'h0 : regNodeValid_2;
  assign T7 = regNodePacket_3_id == 2'h3;
  assign io_node_out_3_writeData = regNodePacket_3_data;
  assign io_node_out_3_addr = regNodePacket_3_addr;
  assign io_in_ready = 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      regNodeValid_0 <= 1'h0;
    end else begin
      regNodeValid_0 <= io_in_valid;
    end
    regNodePacket_0_id <= io_in_bits_id;
    regNodePacket_0_data <= io_in_bits_data;
    regNodePacket_0_addr <= io_in_bits_addr;
    if(reset) begin
      regNodeValid_1 <= 1'h0;
    end else begin
      regNodeValid_1 <= regNodeValid_0;
    end
    regNodePacket_1_id <= regNodePacket_0_id;
    regNodePacket_1_data <= regNodePacket_0_data;
    regNodePacket_1_addr <= regNodePacket_0_addr;
    if(reset) begin
      regNodeValid_2 <= 1'h0;
    end else begin
      regNodeValid_2 <= regNodeValid_1;
    end
    regNodePacket_2_id <= regNodePacket_1_id;
    regNodePacket_2_data <= regNodePacket_1_data;
    regNodePacket_2_addr <= regNodePacket_1_addr;
    if(reset) begin
      regNodeValid_3 <= 1'h0;
    end else begin
      regNodeValid_3 <= regNodeValid_2;
    end
    regNodePacket_3_id <= regNodePacket_2_id;
    regNodePacket_3_data <= regNodePacket_2_data;
    regNodePacket_3_addr <= regNodePacket_2_addr;
  end
endmodule

module StreamFilter_0(
    output io_in_ready,
    input  io_in_valid,
    input [5:0] io_in_bits_channelID,
    input [63:0] io_in_bits_readData,
    input  io_in_bits_isWrite,
    input  io_in_bits_isLast,
    input  io_in_bits_metaData,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits
);



  assign io_out_bits = io_in_bits_readData;
  assign io_out_valid = io_in_valid;
  assign io_in_ready = io_out_ready;
endmodule

module SRLQueue_4(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits_data,
    input [1:0] io_enq_bits_id,
    input [9:0] io_enq_bits_addr,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits_data,
    output[1:0] io_deq_bits_id,
    output[9:0] io_deq_bits_addr,
    output[1:0] io_count
);

  wire T0;
  wire[75:0] T1;
  wire[75:0] T2;
  wire[11:0] T3;
  wire[9:0] T4;
  wire[1:0] T5;
  wire[63:0] T6;
  wire T7;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[75:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {io_enq_bits_data, T3};
  assign T3 = {io_enq_bits_id, io_enq_bits_addr};
  assign io_count = Q_srl_count;
  assign io_deq_bits_addr = T4;
  assign T4 = Q_srl_o_d[9:0];
  assign io_deq_bits_id = T5;
  assign T5 = Q_srl_o_d[11:10];
  assign io_deq_bits_data = T6;
  assign T6 = Q_srl_o_d[75:12];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T7;
  assign T7 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(2),
    .width(76)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_4(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits_data,
    input [1:0] io_enq_bits_id,
    input [9:0] io_enq_bits_addr,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits_data,
    output[1:0] io_deq_bits_id,
    output[9:0] io_deq_bits_addr,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[63:0] SRLQueue_io_deq_bits_data;
  wire[1:0] SRLQueue_io_deq_bits_id;
  wire[9:0] SRLQueue_io_deq_bits_addr;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_addr = SRLQueue_io_deq_bits_addr;
  assign io_deq_bits_id = SRLQueue_io_deq_bits_id;
  assign io_deq_bits_data = SRLQueue_io_deq_bits_data;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_4 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_data( io_enq_bits_data ),
       .io_enq_bits_id( io_enq_bits_id ),
       .io_enq_bits_addr( io_enq_bits_addr ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_data( SRLQueue_io_deq_bits_data ),
       .io_deq_bits_id( SRLQueue_io_deq_bits_id ),
       .io_deq_bits_addr( SRLQueue_io_deq_bits_addr ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module FetchDecoupledStage(input clk, input reset,
    output io_stage_run_ready,
    input  io_stage_run_valid,
    input [15:0] io_stage_run_bits_tiles_per_row,
    input [7:0] io_stage_run_bits_dram_block_count,
    input [23:0] io_stage_run_bits_dram_block_offset_bytes,
    input [15:0] io_stage_run_bits_dram_block_size_bytes,
    input [31:0] io_stage_run_bits_dram_base,
    input [15:0] io_stage_run_bits_bram_addr_base,
    input  io_stage_run_bits_bram_id_range,
    input [8:0] io_stage_run_bits_bram_id_start,
    output io_stage_done_valid,
    //output io_stage_done_bits
    output[31:0] io_perf_cycles,
    output[9:0] io_bram_lhs_req_1_addr,
    output[63:0] io_bram_lhs_req_1_writeData,
    output io_bram_lhs_req_1_writeEn,
    output[9:0] io_bram_lhs_req_0_addr,
    output[63:0] io_bram_lhs_req_0_writeData,
    output io_bram_lhs_req_0_writeEn,
    output[9:0] io_bram_rhs_req_1_addr,
    output[63:0] io_bram_rhs_req_1_writeData,
    output io_bram_rhs_req_1_writeEn,
    output[9:0] io_bram_rhs_req_0_addr,
    output[63:0] io_bram_rhs_req_0_writeData,
    output io_bram_rhs_req_0_writeEn,
    input  io_dram_rd_req_ready,
    output io_dram_rd_req_valid,
    output[5:0] io_dram_rd_req_bits_channelID,
    output io_dram_rd_req_bits_isWrite,
    output[31:0] io_dram_rd_req_bits_addr,
    output[7:0] io_dram_rd_req_bits_numBytes,
    output io_dram_rd_req_bits_metaData,
    output io_dram_rd_rsp_ready,
    input  io_dram_rd_rsp_valid,
    input [5:0] io_dram_rd_rsp_bits_channelID,
    input [63:0] io_dram_rd_rsp_bits_readData,
    input  io_dram_rd_rsp_bits_isWrite,
    input  io_dram_rd_rsp_bits_isLast,
    input  io_dram_rd_rsp_bits_metaData
);

  wire[1:0] T50;
  wire[8:0] sel_idrange;
  reg [8:0] lhs_range;
  reg [8:0] rhs_range;
  reg  current_runcfg_bram_id_range;
  wire T51;
  wire T0;
  wire T1;
  wire T2;
  reg [1:0] regState;
  wire[1:0] T52;
  wire[1:0] T3;
  wire[1:0] T4;
  wire[1:0] T5;
  wire[1:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire[31:0] T53;
  reg [7:0] current_runcfg_dram_block_count;
  wire[7:0] T54;
  wire[7:0] T11;
  reg [31:0] regBlocksReceived;
  wire[31:0] T55;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire T16;
  reg [31:0] regBlockBytesAlmostFinished;
  wire[31:0] T56;
  wire[31:0] T17;
  wire[31:0] T57;
  wire[15:0] T18;
  reg [31:0] regBlockBytesReceived;
  wire[31:0] T58;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  reg [7:0] regWaitInterconnect;
  wire[7:0] T59;
  wire[7:0] T32;
  wire[7:0] T33;
  wire[7:0] T34;
  wire T35;
  wire T36;
  wire T37;
  wire[1:0] T60;
  reg [8:0] current_runcfg_bram_id_start;
  wire[8:0] T61;
  wire[8:0] T38;
  wire[9:0] T62;
  reg [15:0] current_runcfg_bram_addr_base;
  wire[15:0] T63;
  wire[15:0] T39;
  reg [15:0] current_runcfg_tiles_per_row;
  wire[15:0] T64;
  wire[15:0] T40;
  wire[31:0] T65;
  wire[31:0] T66;
  reg [23:0] current_runcfg_dram_block_offset_bytes;
  wire[23:0] T67;
  wire[23:0] T41;
  reg [31:0] current_runcfg_dram_base;
  wire[31:0] T68;
  wire[31:0] T42;
  wire[31:0] T69;
  wire[12:0] T43;
  reg [15:0] current_runcfg_dram_block_size_bytes;
  wire[15:0] T70;
  wire[15:0] T44;
  reg [31:0] regCycles;
  wire[31:0] T45;
  wire[31:0] T46;
  wire T47;
  wire[31:0] T48;
  wire T49;
  wire FetchRouteGen_io_in_ready;
  wire FetchRouteGen_io_out_valid;
  wire[63:0] FetchRouteGen_io_out_bits_data;
  wire[1:0] FetchRouteGen_io_out_bits_id;
  wire[9:0] FetchRouteGen_io_out_bits_addr;
  wire FetchInterconnect_io_in_ready;
  wire[9:0] FetchInterconnect_io_node_out_3_addr;
  wire[63:0] FetchInterconnect_io_node_out_3_writeData;
  wire FetchInterconnect_io_node_out_3_writeEn;
  wire[9:0] FetchInterconnect_io_node_out_2_addr;
  wire[63:0] FetchInterconnect_io_node_out_2_writeData;
  wire FetchInterconnect_io_node_out_2_writeEn;
  wire[9:0] FetchInterconnect_io_node_out_1_addr;
  wire[63:0] FetchInterconnect_io_node_out_1_writeData;
  wire FetchInterconnect_io_node_out_1_writeEn;
  wire[9:0] FetchInterconnect_io_node_out_0_addr;
  wire[63:0] FetchInterconnect_io_node_out_0_writeData;
  wire FetchInterconnect_io_node_out_0_writeEn;
  wire StreamFilter_io_in_ready;
  wire StreamFilter_io_out_valid;
  wire[63:0] StreamFilter_io_out_bits;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[63:0] FPGAQueue_io_deq_bits_data;
  wire[1:0] FPGAQueue_io_deq_bits_id;
  wire[9:0] FPGAQueue_io_deq_bits_addr;
  wire BlockStridedRqGen_io_in_ready;
  wire BlockStridedRqGen_io_out_valid;
  wire[5:0] BlockStridedRqGen_io_out_bits_channelID;
  wire BlockStridedRqGen_io_out_bits_isWrite;
  wire[31:0] BlockStridedRqGen_io_out_bits_addr;
  wire[7:0] BlockStridedRqGen_io_out_bits_numBytes;
  wire BlockStridedRqGen_io_out_bits_metaData;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    lhs_range = {1{$random}};
    rhs_range = {1{$random}};
    current_runcfg_bram_id_range = {1{$random}};
    regState = {1{$random}};
    current_runcfg_dram_block_count = {1{$random}};
    regBlocksReceived = {1{$random}};
    regBlockBytesAlmostFinished = {1{$random}};
    regBlockBytesReceived = {1{$random}};
    regWaitInterconnect = {1{$random}};
    current_runcfg_bram_id_start = {1{$random}};
    current_runcfg_bram_addr_base = {1{$random}};
    current_runcfg_tiles_per_row = {1{$random}};
    current_runcfg_dram_block_offset_bytes = {1{$random}};
    current_runcfg_dram_base = {1{$random}};
    current_runcfg_dram_block_size_bytes = {1{$random}};
    regCycles = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_stage_done_bits = {1{$random}};
// synthesis translate_on
`endif
  assign T50 = sel_idrange[1:0];
  assign sel_idrange = current_runcfg_bram_id_range ? rhs_range : lhs_range;
  assign T51 = reset ? io_stage_run_bits_bram_id_range : T0;
  assign T0 = T1 ? io_stage_run_bits_bram_id_range : current_runcfg_bram_id_range;
  assign T1 = T2 & io_stage_run_valid;
  assign T2 = 2'h0 == regState;
  assign T52 = reset ? 2'h0 : T3;
  assign T3 = T30 ? 2'h0 : T4;
  assign T4 = T9 ? 2'h3 : T5;
  assign T5 = T7 ? 2'h2 : T6;
  assign T6 = T1 ? 2'h1 : regState;
  assign T7 = T8 & BlockStridedRqGen_io_in_ready;
  assign T8 = 2'h1 == regState;
  assign T9 = T29 & T10;
  assign T10 = regBlocksReceived == T53;
  assign T53 = {24'h0, current_runcfg_dram_block_count};
  assign T54 = reset ? io_stage_run_bits_dram_block_count : T11;
  assign T11 = T1 ? io_stage_run_bits_dram_block_count : current_runcfg_dram_block_count;
  assign T55 = reset ? 32'h0 : T12;
  assign T12 = T15 ? T14 : T13;
  assign T13 = T1 ? 32'h0 : regBlocksReceived;
  assign T14 = regBlocksReceived + 32'h1;
  assign T15 = T25 & T16;
  assign T16 = regBlockBytesReceived == regBlockBytesAlmostFinished;
  assign T56 = reset ? 32'h0 : T17;
  assign T17 = T1 ? T57 : regBlockBytesAlmostFinished;
  assign T57 = {16'h0, T18};
  assign T18 = io_stage_run_bits_dram_block_size_bytes - 16'h8;
  assign T58 = reset ? 32'h0 : T19;
  assign T19 = T23 ? T22 : T20;
  assign T20 = T15 ? 32'h0 : T21;
  assign T21 = T1 ? 32'h0 : regBlockBytesReceived;
  assign T22 = regBlockBytesReceived + 32'h8;
  assign T23 = T25 & T24;
  assign T24 = T16 ^ 1'h1;
  assign T25 = T27 & T26;
  assign T26 = FetchRouteGen_io_in_ready & StreamFilter_io_out_valid;
  assign T27 = T29 & T28;
  assign T28 = T10 ^ 1'h1;
  assign T29 = 2'h2 == regState;
  assign T30 = T37 & T31;
  assign T31 = regWaitInterconnect == 8'h5;
  assign T59 = reset ? 8'h0 : T32;
  assign T32 = T35 ? T34 : T33;
  assign T33 = T1 ? 8'h0 : regWaitInterconnect;
  assign T34 = regWaitInterconnect + 8'h1;
  assign T35 = T37 & T36;
  assign T36 = T31 ^ 1'h1;
  assign T37 = 2'h3 == regState;
  assign T60 = current_runcfg_bram_id_start[1:0];
  assign T61 = reset ? io_stage_run_bits_bram_id_start : T38;
  assign T38 = T1 ? io_stage_run_bits_bram_id_start : current_runcfg_bram_id_start;
  assign T62 = current_runcfg_bram_addr_base[9:0];
  assign T63 = reset ? io_stage_run_bits_bram_addr_base : T39;
  assign T39 = T1 ? io_stage_run_bits_bram_addr_base : current_runcfg_bram_addr_base;
  assign T64 = reset ? io_stage_run_bits_tiles_per_row : T40;
  assign T40 = T1 ? io_stage_run_bits_tiles_per_row : current_runcfg_tiles_per_row;
  assign T65 = {24'h0, current_runcfg_dram_block_count};
  assign T66 = {8'h0, current_runcfg_dram_block_offset_bytes};
  assign T67 = reset ? io_stage_run_bits_dram_block_offset_bytes : T41;
  assign T41 = T1 ? io_stage_run_bits_dram_block_offset_bytes : current_runcfg_dram_block_offset_bytes;
  assign T68 = reset ? io_stage_run_bits_dram_base : T42;
  assign T42 = T1 ? io_stage_run_bits_dram_base : current_runcfg_dram_base;
  assign T69 = {19'h0, T43};
  assign T43 = current_runcfg_dram_block_size_bytes >> 2'h3;
  assign T70 = reset ? io_stage_run_bits_dram_block_size_bytes : T44;
  assign T44 = T1 ? io_stage_run_bits_dram_block_size_bytes : current_runcfg_dram_block_size_bytes;
  assign io_dram_rd_rsp_ready = StreamFilter_io_in_ready;
  assign io_dram_rd_req_bits_metaData = BlockStridedRqGen_io_out_bits_metaData;
  assign io_dram_rd_req_bits_numBytes = BlockStridedRqGen_io_out_bits_numBytes;
  assign io_dram_rd_req_bits_addr = BlockStridedRqGen_io_out_bits_addr;
  assign io_dram_rd_req_bits_isWrite = BlockStridedRqGen_io_out_bits_isWrite;
  assign io_dram_rd_req_bits_channelID = BlockStridedRqGen_io_out_bits_channelID;
  assign io_dram_rd_req_valid = BlockStridedRqGen_io_out_valid;
  assign io_bram_rhs_req_0_writeEn = FetchInterconnect_io_node_out_2_writeEn;
  assign io_bram_rhs_req_0_writeData = FetchInterconnect_io_node_out_2_writeData;
  assign io_bram_rhs_req_0_addr = FetchInterconnect_io_node_out_2_addr;
  assign io_bram_rhs_req_1_writeEn = FetchInterconnect_io_node_out_3_writeEn;
  assign io_bram_rhs_req_1_writeData = FetchInterconnect_io_node_out_3_writeData;
  assign io_bram_rhs_req_1_addr = FetchInterconnect_io_node_out_3_addr;
  assign io_bram_lhs_req_0_writeEn = FetchInterconnect_io_node_out_0_writeEn;
  assign io_bram_lhs_req_0_writeData = FetchInterconnect_io_node_out_0_writeData;
  assign io_bram_lhs_req_0_addr = FetchInterconnect_io_node_out_0_addr;
  assign io_bram_lhs_req_1_writeEn = FetchInterconnect_io_node_out_1_writeEn;
  assign io_bram_lhs_req_1_writeData = FetchInterconnect_io_node_out_1_writeData;
  assign io_bram_lhs_req_1_addr = FetchInterconnect_io_node_out_1_addr;
  assign io_perf_cycles = regCycles;
  assign T45 = T49 ? T48 : T46;
  assign T46 = T47 ? 32'h0 : regCycles;
  assign T47 = regState == 2'h0;
  assign T48 = regCycles + 32'h1;
  assign T49 = T47 ^ 1'h1;
  assign io_stage_done_valid = T30;
  assign io_stage_run_ready = T2;
  BlockStridedRqGen_0 BlockStridedRqGen(.clk(clk), .reset(reset),
       .io_block_intra_step( 32'h8 ),
       .io_block_intra_count( T69 ),
       .io_in_ready( BlockStridedRqGen_io_in_ready ),
       .io_in_valid( T8 ),
       .io_in_bits_base( current_runcfg_dram_base ),
       .io_in_bits_block_step( T66 ),
       .io_in_bits_block_count( T65 ),
       .io_out_ready( io_dram_rd_req_ready ),
       .io_out_valid( BlockStridedRqGen_io_out_valid ),
       .io_out_bits_channelID( BlockStridedRqGen_io_out_bits_channelID ),
       .io_out_bits_isWrite( BlockStridedRqGen_io_out_bits_isWrite ),
       .io_out_bits_addr( BlockStridedRqGen_io_out_bits_addr ),
       .io_out_bits_numBytes( BlockStridedRqGen_io_out_bits_numBytes ),
       .io_out_bits_metaData( BlockStridedRqGen_io_out_bits_metaData )
  );
  FetchRouteGen FetchRouteGen(.clk(clk), .reset(reset),
       .io_init_new( T7 ),
       .io_tiles_per_row( current_runcfg_tiles_per_row ),
       .io_bram_addr_base( T62 ),
       .io_bram_id_start( T60 ),
       .io_bram_id_range( T50 ),
       .io_in_ready( FetchRouteGen_io_in_ready ),
       .io_in_valid( StreamFilter_io_out_valid ),
       .io_in_bits( StreamFilter_io_out_bits ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( FetchRouteGen_io_out_valid ),
       .io_out_bits_data( FetchRouteGen_io_out_bits_data ),
       .io_out_bits_id( FetchRouteGen_io_out_bits_id ),
       .io_out_bits_addr( FetchRouteGen_io_out_bits_addr )
  );
  FetchInterconnect FetchInterconnect(.clk(clk), .reset(reset),
       .io_in_ready( FetchInterconnect_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits_data( FPGAQueue_io_deq_bits_data ),
       .io_in_bits_id( FPGAQueue_io_deq_bits_id ),
       .io_in_bits_addr( FPGAQueue_io_deq_bits_addr ),
       .io_node_out_3_addr( FetchInterconnect_io_node_out_3_addr ),
       .io_node_out_3_writeData( FetchInterconnect_io_node_out_3_writeData ),
       .io_node_out_3_writeEn( FetchInterconnect_io_node_out_3_writeEn ),
       .io_node_out_2_addr( FetchInterconnect_io_node_out_2_addr ),
       .io_node_out_2_writeData( FetchInterconnect_io_node_out_2_writeData ),
       .io_node_out_2_writeEn( FetchInterconnect_io_node_out_2_writeEn ),
       .io_node_out_1_addr( FetchInterconnect_io_node_out_1_addr ),
       .io_node_out_1_writeData( FetchInterconnect_io_node_out_1_writeData ),
       .io_node_out_1_writeEn( FetchInterconnect_io_node_out_1_writeEn ),
       .io_node_out_0_addr( FetchInterconnect_io_node_out_0_addr ),
       .io_node_out_0_writeData( FetchInterconnect_io_node_out_0_writeData ),
       .io_node_out_0_writeEn( FetchInterconnect_io_node_out_0_writeEn )
  );
  StreamFilter_0 StreamFilter(
       .io_in_ready( StreamFilter_io_in_ready ),
       .io_in_valid( io_dram_rd_rsp_valid ),
       .io_in_bits_channelID( io_dram_rd_rsp_bits_channelID ),
       .io_in_bits_readData( io_dram_rd_rsp_bits_readData ),
       .io_in_bits_isWrite( io_dram_rd_rsp_bits_isWrite ),
       .io_in_bits_isLast( io_dram_rd_rsp_bits_isLast ),
       .io_in_bits_metaData( io_dram_rd_rsp_bits_metaData ),
       .io_out_ready( FetchRouteGen_io_in_ready ),
       .io_out_valid( StreamFilter_io_out_valid ),
       .io_out_bits( StreamFilter_io_out_bits )
  );
  FPGAQueue_4 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( FetchRouteGen_io_out_valid ),
       .io_enq_bits_data( FetchRouteGen_io_out_bits_data ),
       .io_enq_bits_id( FetchRouteGen_io_out_bits_id ),
       .io_enq_bits_addr( FetchRouteGen_io_out_bits_addr ),
       .io_deq_ready( FetchInterconnect_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits_data( FPGAQueue_io_deq_bits_data ),
       .io_deq_bits_id( FPGAQueue_io_deq_bits_id ),
       .io_deq_bits_addr( FPGAQueue_io_deq_bits_addr )
       //.io_count(  )
  );

  always @(posedge clk) begin
    lhs_range <= 9'h1;
    rhs_range <= 9'h1;
    if(reset) begin
      current_runcfg_bram_id_range <= io_stage_run_bits_bram_id_range;
    end else if(T1) begin
      current_runcfg_bram_id_range <= io_stage_run_bits_bram_id_range;
    end
    if(reset) begin
      regState <= 2'h0;
    end else if(T30) begin
      regState <= 2'h0;
    end else if(T9) begin
      regState <= 2'h3;
    end else if(T7) begin
      regState <= 2'h2;
    end else if(T1) begin
      regState <= 2'h1;
    end
    if(reset) begin
      current_runcfg_dram_block_count <= io_stage_run_bits_dram_block_count;
    end else if(T1) begin
      current_runcfg_dram_block_count <= io_stage_run_bits_dram_block_count;
    end
    if(reset) begin
      regBlocksReceived <= 32'h0;
    end else if(T15) begin
      regBlocksReceived <= T14;
    end else if(T1) begin
      regBlocksReceived <= 32'h0;
    end
    if(reset) begin
      regBlockBytesAlmostFinished <= 32'h0;
    end else if(T1) begin
      regBlockBytesAlmostFinished <= T57;
    end
    if(reset) begin
      regBlockBytesReceived <= 32'h0;
    end else if(T23) begin
      regBlockBytesReceived <= T22;
    end else if(T15) begin
      regBlockBytesReceived <= 32'h0;
    end else if(T1) begin
      regBlockBytesReceived <= 32'h0;
    end
    if(reset) begin
      regWaitInterconnect <= 8'h0;
    end else if(T35) begin
      regWaitInterconnect <= T34;
    end else if(T1) begin
      regWaitInterconnect <= 8'h0;
    end
    if(reset) begin
      current_runcfg_bram_id_start <= io_stage_run_bits_bram_id_start;
    end else if(T1) begin
      current_runcfg_bram_id_start <= io_stage_run_bits_bram_id_start;
    end
    if(reset) begin
      current_runcfg_bram_addr_base <= io_stage_run_bits_bram_addr_base;
    end else if(T1) begin
      current_runcfg_bram_addr_base <= io_stage_run_bits_bram_addr_base;
    end
    if(reset) begin
      current_runcfg_tiles_per_row <= io_stage_run_bits_tiles_per_row;
    end else if(T1) begin
      current_runcfg_tiles_per_row <= io_stage_run_bits_tiles_per_row;
    end
    if(reset) begin
      current_runcfg_dram_block_offset_bytes <= io_stage_run_bits_dram_block_offset_bytes;
    end else if(T1) begin
      current_runcfg_dram_block_offset_bytes <= io_stage_run_bits_dram_block_offset_bytes;
    end
    if(reset) begin
      current_runcfg_dram_base <= io_stage_run_bits_dram_base;
    end else if(T1) begin
      current_runcfg_dram_base <= io_stage_run_bits_dram_base;
    end
    if(reset) begin
      current_runcfg_dram_block_size_bytes <= io_stage_run_bits_dram_block_size_bytes;
    end else if(T1) begin
      current_runcfg_dram_block_size_bytes <= io_stage_run_bits_dram_block_size_bytes;
    end
    if(T49) begin
      regCycles <= T48;
    end else if(T47) begin
      regCycles <= 32'h0;
    end
  end
endmodule

module BlackBoxCompressorModel(input clk,
    input [63:0] io_c,
    input [63:0] io_d,
    output[6:0] io_r
);

  reg [6:0] R0;
  reg [6:0] R1;
  reg [6:0] R2;
  wire[6:0] T3;
  wire[6:0] T4;
  wire[5:0] T5;
  wire[5:0] T6;
  wire[4:0] T7;
  wire[4:0] T8;
  wire[3:0] T9;
  wire[3:0] T10;
  wire[2:0] T11;
  wire[2:0] T12;
  wire[1:0] T13;
  wire[1:0] T14;
  wire T15;
  wire[63:0] T16;
  wire[1:0] T194;
  wire T17;
  wire[2:0] T195;
  wire[1:0] T18;
  wire[1:0] T19;
  wire T20;
  wire[1:0] T196;
  wire T21;
  wire[3:0] T197;
  wire[2:0] T22;
  wire[2:0] T23;
  wire[1:0] T24;
  wire[1:0] T25;
  wire T26;
  wire[1:0] T198;
  wire T27;
  wire[2:0] T199;
  wire[1:0] T28;
  wire[1:0] T29;
  wire T30;
  wire[1:0] T200;
  wire T31;
  wire[4:0] T201;
  wire[3:0] T32;
  wire[3:0] T33;
  wire[2:0] T34;
  wire[2:0] T35;
  wire[1:0] T36;
  wire[1:0] T37;
  wire T38;
  wire[1:0] T202;
  wire T39;
  wire[2:0] T203;
  wire[1:0] T40;
  wire[1:0] T41;
  wire T42;
  wire[1:0] T204;
  wire T43;
  wire[3:0] T205;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[1:0] T46;
  wire[1:0] T47;
  wire T48;
  wire[1:0] T206;
  wire T49;
  wire[2:0] T207;
  wire[1:0] T50;
  wire[1:0] T51;
  wire T52;
  wire[1:0] T208;
  wire T53;
  wire[5:0] T209;
  wire[4:0] T54;
  wire[4:0] T55;
  wire[3:0] T56;
  wire[3:0] T57;
  wire[2:0] T58;
  wire[2:0] T59;
  wire[1:0] T60;
  wire[1:0] T61;
  wire T62;
  wire[1:0] T210;
  wire T63;
  wire[2:0] T211;
  wire[1:0] T64;
  wire[1:0] T65;
  wire T66;
  wire[1:0] T212;
  wire T67;
  wire[3:0] T213;
  wire[2:0] T68;
  wire[2:0] T69;
  wire[1:0] T70;
  wire[1:0] T71;
  wire T72;
  wire[1:0] T214;
  wire T73;
  wire[2:0] T215;
  wire[1:0] T74;
  wire[1:0] T75;
  wire T76;
  wire[1:0] T216;
  wire T77;
  wire[4:0] T217;
  wire[3:0] T78;
  wire[3:0] T79;
  wire[2:0] T80;
  wire[2:0] T81;
  wire[1:0] T82;
  wire[1:0] T83;
  wire T84;
  wire[1:0] T218;
  wire T85;
  wire[2:0] T219;
  wire[1:0] T86;
  wire[1:0] T87;
  wire T88;
  wire[1:0] T220;
  wire T89;
  wire[3:0] T221;
  wire[2:0] T90;
  wire[2:0] T91;
  wire[1:0] T92;
  wire[1:0] T93;
  wire T94;
  wire[1:0] T222;
  wire T95;
  wire[2:0] T223;
  wire[1:0] T96;
  wire[1:0] T97;
  wire T98;
  wire[1:0] T224;
  wire T99;
  wire[6:0] T225;
  wire[5:0] T100;
  wire[5:0] T101;
  wire[4:0] T102;
  wire[4:0] T103;
  wire[3:0] T104;
  wire[3:0] T105;
  wire[2:0] T106;
  wire[2:0] T107;
  wire[1:0] T108;
  wire[1:0] T109;
  wire T110;
  wire[1:0] T226;
  wire T111;
  wire[2:0] T227;
  wire[1:0] T112;
  wire[1:0] T113;
  wire T114;
  wire[1:0] T228;
  wire T115;
  wire[3:0] T229;
  wire[2:0] T116;
  wire[2:0] T117;
  wire[1:0] T118;
  wire[1:0] T119;
  wire T120;
  wire[1:0] T230;
  wire T121;
  wire[2:0] T231;
  wire[1:0] T122;
  wire[1:0] T123;
  wire T124;
  wire[1:0] T232;
  wire T125;
  wire[4:0] T233;
  wire[3:0] T126;
  wire[3:0] T127;
  wire[2:0] T128;
  wire[2:0] T129;
  wire[1:0] T130;
  wire[1:0] T131;
  wire T132;
  wire[1:0] T234;
  wire T133;
  wire[2:0] T235;
  wire[1:0] T134;
  wire[1:0] T135;
  wire T136;
  wire[1:0] T236;
  wire T137;
  wire[3:0] T237;
  wire[2:0] T138;
  wire[2:0] T139;
  wire[1:0] T140;
  wire[1:0] T141;
  wire T142;
  wire[1:0] T238;
  wire T143;
  wire[2:0] T239;
  wire[1:0] T144;
  wire[1:0] T145;
  wire T146;
  wire[1:0] T240;
  wire T147;
  wire[5:0] T241;
  wire[4:0] T148;
  wire[4:0] T149;
  wire[3:0] T150;
  wire[3:0] T151;
  wire[2:0] T152;
  wire[2:0] T153;
  wire[1:0] T154;
  wire[1:0] T155;
  wire T156;
  wire[1:0] T242;
  wire T157;
  wire[2:0] T243;
  wire[1:0] T158;
  wire[1:0] T159;
  wire T160;
  wire[1:0] T244;
  wire T161;
  wire[3:0] T245;
  wire[2:0] T162;
  wire[2:0] T163;
  wire[1:0] T164;
  wire[1:0] T165;
  wire T166;
  wire[1:0] T246;
  wire T167;
  wire[2:0] T247;
  wire[1:0] T168;
  wire[1:0] T169;
  wire T170;
  wire[1:0] T248;
  wire T171;
  wire[4:0] T249;
  wire[3:0] T172;
  wire[3:0] T173;
  wire[2:0] T174;
  wire[2:0] T175;
  wire[1:0] T176;
  wire[1:0] T177;
  wire T178;
  wire[1:0] T250;
  wire T179;
  wire[2:0] T251;
  wire[1:0] T180;
  wire[1:0] T181;
  wire T182;
  wire[1:0] T252;
  wire T183;
  wire[3:0] T253;
  wire[2:0] T184;
  wire[2:0] T185;
  wire[1:0] T186;
  wire[1:0] T187;
  wire T188;
  wire[1:0] T254;
  wire T189;
  wire[2:0] T255;
  wire[1:0] T190;
  wire[1:0] T191;
  wire T192;
  wire[1:0] T256;
  wire T193;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R0 = {1{$random}};
    R1 = {1{$random}};
    R2 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_r = R0;
  assign T3 = T225 + T4;
  assign T4 = {1'h0, T5};
  assign T5 = T209 + T6;
  assign T6 = {1'h0, T7};
  assign T7 = T201 + T8;
  assign T8 = {1'h0, T9};
  assign T9 = T197 + T10;
  assign T10 = {1'h0, T11};
  assign T11 = T195 + T12;
  assign T12 = {1'h0, T13};
  assign T13 = T194 + T14;
  assign T14 = {1'h0, T15};
  assign T15 = T16[63];
  assign T16 = io_c & io_d;
  assign T194 = {1'h0, T17};
  assign T17 = T16[62];
  assign T195 = {1'h0, T18};
  assign T18 = T196 + T19;
  assign T19 = {1'h0, T20};
  assign T20 = T16[61];
  assign T196 = {1'h0, T21};
  assign T21 = T16[60];
  assign T197 = {1'h0, T22};
  assign T22 = T199 + T23;
  assign T23 = {1'h0, T24};
  assign T24 = T198 + T25;
  assign T25 = {1'h0, T26};
  assign T26 = T16[59];
  assign T198 = {1'h0, T27};
  assign T27 = T16[58];
  assign T199 = {1'h0, T28};
  assign T28 = T200 + T29;
  assign T29 = {1'h0, T30};
  assign T30 = T16[57];
  assign T200 = {1'h0, T31};
  assign T31 = T16[56];
  assign T201 = {1'h0, T32};
  assign T32 = T205 + T33;
  assign T33 = {1'h0, T34};
  assign T34 = T203 + T35;
  assign T35 = {1'h0, T36};
  assign T36 = T202 + T37;
  assign T37 = {1'h0, T38};
  assign T38 = T16[55];
  assign T202 = {1'h0, T39};
  assign T39 = T16[54];
  assign T203 = {1'h0, T40};
  assign T40 = T204 + T41;
  assign T41 = {1'h0, T42};
  assign T42 = T16[53];
  assign T204 = {1'h0, T43};
  assign T43 = T16[52];
  assign T205 = {1'h0, T44};
  assign T44 = T207 + T45;
  assign T45 = {1'h0, T46};
  assign T46 = T206 + T47;
  assign T47 = {1'h0, T48};
  assign T48 = T16[51];
  assign T206 = {1'h0, T49};
  assign T49 = T16[50];
  assign T207 = {1'h0, T50};
  assign T50 = T208 + T51;
  assign T51 = {1'h0, T52};
  assign T52 = T16[49];
  assign T208 = {1'h0, T53};
  assign T53 = T16[48];
  assign T209 = {1'h0, T54};
  assign T54 = T217 + T55;
  assign T55 = {1'h0, T56};
  assign T56 = T213 + T57;
  assign T57 = {1'h0, T58};
  assign T58 = T211 + T59;
  assign T59 = {1'h0, T60};
  assign T60 = T210 + T61;
  assign T61 = {1'h0, T62};
  assign T62 = T16[47];
  assign T210 = {1'h0, T63};
  assign T63 = T16[46];
  assign T211 = {1'h0, T64};
  assign T64 = T212 + T65;
  assign T65 = {1'h0, T66};
  assign T66 = T16[45];
  assign T212 = {1'h0, T67};
  assign T67 = T16[44];
  assign T213 = {1'h0, T68};
  assign T68 = T215 + T69;
  assign T69 = {1'h0, T70};
  assign T70 = T214 + T71;
  assign T71 = {1'h0, T72};
  assign T72 = T16[43];
  assign T214 = {1'h0, T73};
  assign T73 = T16[42];
  assign T215 = {1'h0, T74};
  assign T74 = T216 + T75;
  assign T75 = {1'h0, T76};
  assign T76 = T16[41];
  assign T216 = {1'h0, T77};
  assign T77 = T16[40];
  assign T217 = {1'h0, T78};
  assign T78 = T221 + T79;
  assign T79 = {1'h0, T80};
  assign T80 = T219 + T81;
  assign T81 = {1'h0, T82};
  assign T82 = T218 + T83;
  assign T83 = {1'h0, T84};
  assign T84 = T16[39];
  assign T218 = {1'h0, T85};
  assign T85 = T16[38];
  assign T219 = {1'h0, T86};
  assign T86 = T220 + T87;
  assign T87 = {1'h0, T88};
  assign T88 = T16[37];
  assign T220 = {1'h0, T89};
  assign T89 = T16[36];
  assign T221 = {1'h0, T90};
  assign T90 = T223 + T91;
  assign T91 = {1'h0, T92};
  assign T92 = T222 + T93;
  assign T93 = {1'h0, T94};
  assign T94 = T16[35];
  assign T222 = {1'h0, T95};
  assign T95 = T16[34];
  assign T223 = {1'h0, T96};
  assign T96 = T224 + T97;
  assign T97 = {1'h0, T98};
  assign T98 = T16[33];
  assign T224 = {1'h0, T99};
  assign T99 = T16[32];
  assign T225 = {1'h0, T100};
  assign T100 = T241 + T101;
  assign T101 = {1'h0, T102};
  assign T102 = T233 + T103;
  assign T103 = {1'h0, T104};
  assign T104 = T229 + T105;
  assign T105 = {1'h0, T106};
  assign T106 = T227 + T107;
  assign T107 = {1'h0, T108};
  assign T108 = T226 + T109;
  assign T109 = {1'h0, T110};
  assign T110 = T16[31];
  assign T226 = {1'h0, T111};
  assign T111 = T16[30];
  assign T227 = {1'h0, T112};
  assign T112 = T228 + T113;
  assign T113 = {1'h0, T114};
  assign T114 = T16[29];
  assign T228 = {1'h0, T115};
  assign T115 = T16[28];
  assign T229 = {1'h0, T116};
  assign T116 = T231 + T117;
  assign T117 = {1'h0, T118};
  assign T118 = T230 + T119;
  assign T119 = {1'h0, T120};
  assign T120 = T16[27];
  assign T230 = {1'h0, T121};
  assign T121 = T16[26];
  assign T231 = {1'h0, T122};
  assign T122 = T232 + T123;
  assign T123 = {1'h0, T124};
  assign T124 = T16[25];
  assign T232 = {1'h0, T125};
  assign T125 = T16[24];
  assign T233 = {1'h0, T126};
  assign T126 = T237 + T127;
  assign T127 = {1'h0, T128};
  assign T128 = T235 + T129;
  assign T129 = {1'h0, T130};
  assign T130 = T234 + T131;
  assign T131 = {1'h0, T132};
  assign T132 = T16[23];
  assign T234 = {1'h0, T133};
  assign T133 = T16[22];
  assign T235 = {1'h0, T134};
  assign T134 = T236 + T135;
  assign T135 = {1'h0, T136};
  assign T136 = T16[21];
  assign T236 = {1'h0, T137};
  assign T137 = T16[20];
  assign T237 = {1'h0, T138};
  assign T138 = T239 + T139;
  assign T139 = {1'h0, T140};
  assign T140 = T238 + T141;
  assign T141 = {1'h0, T142};
  assign T142 = T16[19];
  assign T238 = {1'h0, T143};
  assign T143 = T16[18];
  assign T239 = {1'h0, T144};
  assign T144 = T240 + T145;
  assign T145 = {1'h0, T146};
  assign T146 = T16[17];
  assign T240 = {1'h0, T147};
  assign T147 = T16[16];
  assign T241 = {1'h0, T148};
  assign T148 = T249 + T149;
  assign T149 = {1'h0, T150};
  assign T150 = T245 + T151;
  assign T151 = {1'h0, T152};
  assign T152 = T243 + T153;
  assign T153 = {1'h0, T154};
  assign T154 = T242 + T155;
  assign T155 = {1'h0, T156};
  assign T156 = T16[15];
  assign T242 = {1'h0, T157};
  assign T157 = T16[14];
  assign T243 = {1'h0, T158};
  assign T158 = T244 + T159;
  assign T159 = {1'h0, T160};
  assign T160 = T16[13];
  assign T244 = {1'h0, T161};
  assign T161 = T16[12];
  assign T245 = {1'h0, T162};
  assign T162 = T247 + T163;
  assign T163 = {1'h0, T164};
  assign T164 = T246 + T165;
  assign T165 = {1'h0, T166};
  assign T166 = T16[11];
  assign T246 = {1'h0, T167};
  assign T167 = T16[10];
  assign T247 = {1'h0, T168};
  assign T168 = T248 + T169;
  assign T169 = {1'h0, T170};
  assign T170 = T16[9];
  assign T248 = {1'h0, T171};
  assign T171 = T16[8];
  assign T249 = {1'h0, T172};
  assign T172 = T253 + T173;
  assign T173 = {1'h0, T174};
  assign T174 = T251 + T175;
  assign T175 = {1'h0, T176};
  assign T176 = T250 + T177;
  assign T177 = {1'h0, T178};
  assign T178 = T16[7];
  assign T250 = {1'h0, T179};
  assign T179 = T16[6];
  assign T251 = {1'h0, T180};
  assign T180 = T252 + T181;
  assign T181 = {1'h0, T182};
  assign T182 = T16[5];
  assign T252 = {1'h0, T183};
  assign T183 = T16[4];
  assign T253 = {1'h0, T184};
  assign T184 = T255 + T185;
  assign T185 = {1'h0, T186};
  assign T186 = T254 + T187;
  assign T187 = {1'h0, T188};
  assign T188 = T16[3];
  assign T254 = {1'h0, T189};
  assign T189 = T16[2];
  assign T255 = {1'h0, T190};
  assign T190 = T256 + T191;
  assign T191 = {1'h0, T192};
  assign T192 = T16[1];
  assign T256 = {1'h0, T193};
  assign T193 = T16[0];

  always @(posedge clk) begin
    R0 <= R1;
    R1 <= R2;
    R2 <= T3;
  end
endmodule

module DotProductUnit(input clk, input reset,
    input  io_in_valid,
    input [63:0] io_in_bits_a,
    input [63:0] io_in_bits_b,
    input  io_in_bits_acc_shift,
    input  io_in_bits_neg,
    input  io_in_bits_clear,
    output[31:0] io_out
);

  reg [63:0] R0;
  reg [63:0] R1;
  reg [31:0] regAcc;
  wire[31:0] T28;
  wire[32:0] T2;
  wire[32:0] T29;
  wire[32:0] T3;
  wire[32:0] T30;
  wire[7:0] T4;
  wire[7:0] T5;
  wire[7:0] T6;
  reg [6:0] regStage1_b_popcountResult;
  wire[6:0] stage1_b_popcountResult;
  wire[7:0] T7;
  reg  regStage1_b_neg;
  wire stage1_b_neg;
  reg  R8;
  reg  R9;
  reg  R10;
  reg  R11;
  wire[24:0] T31;
  wire T32;
  wire[32:0] T12;
  wire[32:0] T13;
  wire[32:0] T33;
  wire T34;
  wire[32:0] T14;
  wire T15;
  reg  regStage1_b_acc_shift;
  wire stage1_b_acc_shift;
  reg  R16;
  reg  R17;
  reg  R18;
  reg  R19;
  reg  regStage1_b_clear;
  wire stage1_b_clear;
  reg  R20;
  reg  R21;
  reg  R22;
  reg  R23;
  reg  regStage1_v;
  wire stage1_v;
  reg  R24;
  reg  R25;
  reg  R26;
  reg  R27;
  wire T35;
  wire[6:0] compressor_io_r;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R0 = {2{$random}};
    R1 = {2{$random}};
    regAcc = {1{$random}};
    regStage1_b_popcountResult = {1{$random}};
    regStage1_b_neg = {1{$random}};
    R8 = {1{$random}};
    R9 = {1{$random}};
    R10 = {1{$random}};
    R11 = {1{$random}};
    regStage1_b_acc_shift = {1{$random}};
    R16 = {1{$random}};
    R17 = {1{$random}};
    R18 = {1{$random}};
    R19 = {1{$random}};
    regStage1_b_clear = {1{$random}};
    R20 = {1{$random}};
    R21 = {1{$random}};
    R22 = {1{$random}};
    R23 = {1{$random}};
    regStage1_v = {1{$random}};
    R24 = {1{$random}};
    R25 = {1{$random}};
    R26 = {1{$random}};
    R27 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out = regAcc;
  assign T28 = T2[31:0];
  assign T2 = regStage1_v ? T3 : T29;
  assign T29 = {1'h0, regAcc};
  assign T3 = T12 + T30;
  assign T30 = {T31, T4};
  assign T4 = regStage1_b_neg ? T7 : T5;
  assign T5 = T6;
  assign T6 = {1'h0, regStage1_b_popcountResult};
  assign stage1_b_popcountResult = compressor_io_r;
  assign T7 = 8'h0 - T5;
  assign stage1_b_neg = R8;
  assign T31 = T32 ? 25'h1ffffff : 25'h0;
  assign T32 = T4[7];
  assign T12 = regStage1_b_clear ? 33'h0 : T13;
  assign T13 = T15 ? T14 : T33;
  assign T33 = {T34, regAcc};
  assign T34 = regAcc[31];
  assign T14 = regAcc << 1'h1;
  assign T15 = regStage1_b_acc_shift;
  assign stage1_b_acc_shift = R16;
  assign stage1_b_clear = R20;
  assign stage1_v = R24;
  assign T35 = reset ? 1'h0 : io_in_valid;
  BlackBoxCompressorModel compressor(.clk(clk),
       .io_c( R1 ),
       .io_d( R0 ),
       .io_r( compressor_io_r )
  );

  always @(posedge clk) begin
    R0 <= io_in_bits_b;
    R1 <= io_in_bits_a;
    regAcc <= T28;
    regStage1_b_popcountResult <= stage1_b_popcountResult;
    regStage1_b_neg <= stage1_b_neg;
    R8 <= R9;
    R9 <= R10;
    R10 <= R11;
    R11 <= io_in_bits_neg;
    regStage1_b_acc_shift <= stage1_b_acc_shift;
    R16 <= R17;
    R17 <= R18;
    R18 <= R19;
    R19 <= io_in_bits_acc_shift;
    regStage1_b_clear <= stage1_b_clear;
    R20 <= R21;
    R21 <= R22;
    R22 <= R23;
    R23 <= io_in_bits_clear;
    regStage1_v <= stage1_v;
    R24 <= R25;
    R25 <= R26;
    R26 <= R27;
    if(reset) begin
      R27 <= 1'h0;
    end else begin
      R27 <= io_in_valid;
    end
  end
endmodule

module DotProductArray(input clk, input reset,
    input  io_valid,
    input  io_shiftAmount,
    input  io_negate,
    input  io_clear_acc,
    input [63:0] io_a_1,
    input [63:0] io_a_0,
    input [63:0] io_b_1,
    input [63:0] io_b_0,
    output[31:0] io_out_1_1,
    output[31:0] io_out_1_0,
    output[31:0] io_out_0_1,
    output[31:0] io_out_0_0
);

  reg  R0;
  reg  R1;
  reg  R2;
  reg [63:0] R3;
  reg [63:0] R4;
  reg  R5;
  reg  R6;
  reg  R7;
  reg  R8;
  reg [63:0] R9;
  reg [63:0] R10;
  reg  R11;
  reg  R12;
  reg  R13;
  reg  R14;
  reg [63:0] R15;
  reg [63:0] R16;
  reg  R17;
  reg  R18;
  reg  R19;
  reg  R20;
  reg [63:0] R21;
  reg [63:0] R22;
  reg  R23;
  wire[31:0] DotProductUnit_io_out;
  wire[31:0] DotProductUnit_1_io_out;
  wire[31:0] DotProductUnit_2_io_out;
  wire[31:0] DotProductUnit_3_io_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R0 = {1{$random}};
    R1 = {1{$random}};
    R2 = {1{$random}};
    R3 = {2{$random}};
    R4 = {2{$random}};
    R5 = {1{$random}};
    R6 = {1{$random}};
    R7 = {1{$random}};
    R8 = {1{$random}};
    R9 = {2{$random}};
    R10 = {2{$random}};
    R11 = {1{$random}};
    R12 = {1{$random}};
    R13 = {1{$random}};
    R14 = {1{$random}};
    R15 = {2{$random}};
    R16 = {2{$random}};
    R17 = {1{$random}};
    R18 = {1{$random}};
    R19 = {1{$random}};
    R20 = {1{$random}};
    R21 = {2{$random}};
    R22 = {2{$random}};
    R23 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_0_0 = DotProductUnit_io_out;
  assign io_out_0_1 = DotProductUnit_1_io_out;
  assign io_out_1_0 = DotProductUnit_2_io_out;
  assign io_out_1_1 = DotProductUnit_3_io_out;
  DotProductUnit DotProductUnit(.clk(clk), .reset(reset),
       .io_in_valid( R23 ),
       .io_in_bits_a( R22 ),
       .io_in_bits_b( R21 ),
       .io_in_bits_acc_shift( R20 ),
       .io_in_bits_neg( R19 ),
       .io_in_bits_clear( R18 ),
       .io_out( DotProductUnit_io_out )
  );
  DotProductUnit DotProductUnit_1(.clk(clk), .reset(reset),
       .io_in_valid( R17 ),
       .io_in_bits_a( R16 ),
       .io_in_bits_b( R15 ),
       .io_in_bits_acc_shift( R14 ),
       .io_in_bits_neg( R13 ),
       .io_in_bits_clear( R12 ),
       .io_out( DotProductUnit_1_io_out )
  );
  DotProductUnit DotProductUnit_2(.clk(clk), .reset(reset),
       .io_in_valid( R11 ),
       .io_in_bits_a( R10 ),
       .io_in_bits_b( R9 ),
       .io_in_bits_acc_shift( R8 ),
       .io_in_bits_neg( R7 ),
       .io_in_bits_clear( R6 ),
       .io_out( DotProductUnit_2_io_out )
  );
  DotProductUnit DotProductUnit_3(.clk(clk), .reset(reset),
       .io_in_valid( R5 ),
       .io_in_bits_a( R4 ),
       .io_in_bits_b( R3 ),
       .io_in_bits_acc_shift( R2 ),
       .io_in_bits_neg( R1 ),
       .io_in_bits_clear( R0 ),
       .io_out( DotProductUnit_3_io_out )
  );

  always @(posedge clk) begin
    R0 <= io_clear_acc;
    R1 <= io_negate;
    R2 <= io_shiftAmount;
    R3 <= io_b_1;
    R4 <= io_a_1;
    R5 <= io_valid;
    R6 <= io_clear_acc;
    R7 <= io_negate;
    R8 <= io_shiftAmount;
    R9 <= io_b_0;
    R10 <= io_a_1;
    R11 <= io_valid;
    R12 <= io_clear_acc;
    R13 <= io_negate;
    R14 <= io_shiftAmount;
    R15 <= io_b_1;
    R16 <= io_a_0;
    R17 <= io_valid;
    R18 <= io_clear_acc;
    R19 <= io_negate;
    R20 <= io_shiftAmount;
    R21 <= io_b_0;
    R22 <= io_a_0;
    R23 <= io_valid;
  end
endmodule

module ExecDecoupledStage(input clk, input reset,
    output io_stage_run_ready,
    input  io_stage_run_valid,
    input  io_stage_run_bits_writeAddr,
    input  io_stage_run_bits_writeEn,
    input  io_stage_run_bits_clear_before_first_accumulation,
    input  io_stage_run_bits_negate,
    input  io_stage_run_bits_shiftAmount,
    input [15:0] io_stage_run_bits_numTiles,
    input [15:0] io_stage_run_bits_rhsOffset,
    input [15:0] io_stage_run_bits_lhsOffset,
    output io_stage_done_valid,
    //output io_stage_done_bits
    output[31:0] io_cfg_config_dpu_x,
    output[31:0] io_cfg_config_dpu_y,
    output[31:0] io_cfg_config_dpu_z,
    output[31:0] io_cfg_config_lhs_mem,
    output[31:0] io_cfg_config_rhs_mem,
    output[9:0] io_tilemem_lhs_req_1_addr,
    output[63:0] io_tilemem_lhs_req_1_writeData,
    output io_tilemem_lhs_req_1_writeEn,
    output[9:0] io_tilemem_lhs_req_0_addr,
    output[63:0] io_tilemem_lhs_req_0_writeData,
    output io_tilemem_lhs_req_0_writeEn,
    input [63:0] io_tilemem_lhs_rsp_1_readData,
    input [63:0] io_tilemem_lhs_rsp_0_readData,
    output[9:0] io_tilemem_rhs_req_1_addr,
    output[63:0] io_tilemem_rhs_req_1_writeData,
    output io_tilemem_rhs_req_1_writeEn,
    output[9:0] io_tilemem_rhs_req_0_addr,
    output[63:0] io_tilemem_rhs_req_0_writeData,
    output io_tilemem_rhs_req_0_writeEn,
    input [63:0] io_tilemem_rhs_rsp_1_readData,
    input [63:0] io_tilemem_rhs_rsp_0_readData,
    output io_res_req_1_1_addr,
    output[31:0] io_res_req_1_1_writeData,
    output io_res_req_1_1_writeEn,
    output io_res_req_1_0_addr,
    output[31:0] io_res_req_1_0_writeData,
    output io_res_req_1_0_writeEn,
    output io_res_req_0_1_addr,
    output[31:0] io_res_req_0_1_writeData,
    output io_res_req_0_1_writeEn,
    output io_res_req_0_0_addr,
    output[31:0] io_res_req_0_0_writeData,
    output io_res_req_0_0_writeEn
);

  wire T0;
  wire[207:0] T44;
  wire[123:0] T1;
  wire[123:0] T2;
  wire[118:0] T3;
  wire[70:0] T4;
  wire[2:0] T5;
  wire[1:0] addrgen_ins_targetStage;
  wire addrgen_ins_isRunCfg;
  wire[67:0] addrgen_ins_unused;
  wire[47:0] T6;
  wire[31:0] T7;
  wire[15:0] addrgen_ins_runcfg_lhsOffset;
  wire[15:0] addrgen_ins_runcfg_rhsOffset;
  wire[15:0] addrgen_ins_runcfg_numTiles;
  wire[4:0] T8;
  wire[2:0] T9;
  wire[1:0] T10;
  wire addrgen_ins_runcfg_shiftAmount;
  wire addrgen_ins_runcfg_negate;
  wire addrgen_ins_runcfg_clear_before_first_accumulation;
  wire[1:0] T11;
  wire addrgen_ins_runcfg_writeEn;
  wire addrgen_ins_runcfg_writeAddr;
  wire addrgen_out_delayed_clear;
  wire T12;
  reg [41:0] addrgen_out_delayed_raw;
  reg [41:0] R13;
  reg [41:0] R14;
  wire addrgen_out_delayed_negate;
  wire T15;
  wire T45;
  wire[4:0] addrgen_out_delayed_shiftAmount;
  wire[4:0] T16;
  reg  read_complete;
  reg  R17;
  reg  R18;
  wire addrgen_out_final_delayed_writeEn;
  wire T19;
  reg [41:0] addrgen_out_final_delayed_raw;
  reg [41:0] R20;
  reg [41:0] R21;
  reg [41:0] R22;
  reg [41:0] R23;
  reg [41:0] R24;
  reg [41:0] R25;
  reg [41:0] R26;
  reg [41:0] R27;
  reg [41:0] R28;
  wire addrgen_out_final_delayed_writeAddr;
  wire T29;
  wire[9:0] T46;
  wire[15:0] addrgen_out_rhsAddr;
  wire[15:0] T30;
  wire[9:0] T47;
  wire[9:0] T48;
  wire[15:0] addrgen_out_lhsAddr;
  wire[15:0] T31;
  wire[9:0] T49;
  reg  R32;
  reg  R33;
  reg  R34;
  reg  R35;
  reg  R36;
  reg  R37;
  reg  R38;
  reg  R39;
  reg  R40;
  reg  R41;
  wire isLastAddr;
  wire addrgen_out_last;
  wire T42;
  wire T43;
  wire addrgen_d_in_V_V_TREADY;
  wire addrgen_d_out_V_V_TVALID;
  wire[41:0] addrgen_d_out_V_V_TDATA;
  wire[31:0] DotProductArray_io_out_1_1;
  wire[31:0] DotProductArray_io_out_1_0;
  wire[31:0] DotProductArray_io_out_0_1;
  wire[31:0] DotProductArray_io_out_0_0;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    addrgen_out_delayed_raw = {2{$random}};
    R13 = {2{$random}};
    R14 = {2{$random}};
    read_complete = {1{$random}};
    R17 = {1{$random}};
    R18 = {1{$random}};
    addrgen_out_final_delayed_raw = {2{$random}};
    R20 = {2{$random}};
    R21 = {2{$random}};
    R22 = {2{$random}};
    R23 = {2{$random}};
    R24 = {2{$random}};
    R25 = {2{$random}};
    R26 = {2{$random}};
    R27 = {2{$random}};
    R28 = {2{$random}};
    R32 = {1{$random}};
    R33 = {1{$random}};
    R34 = {1{$random}};
    R35 = {1{$random}};
    R36 = {1{$random}};
    R37 = {1{$random}};
    R38 = {1{$random}};
    R39 = {1{$random}};
    R40 = {1{$random}};
    R41 = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
  assign io_tilemem_rhs_req_0_writeData = {2{$random}};
  assign io_tilemem_rhs_req_1_writeData = {2{$random}};
  assign io_tilemem_lhs_req_0_writeData = {2{$random}};
  assign io_tilemem_lhs_req_1_writeData = {2{$random}};
//  assign io_stage_done_bits = {1{$random}};
// synthesis translate_on
`endif
  assign T0 = reset ^ 1'h1;
  assign T44 = {84'h0, T1};
  assign T1 = T2;
  assign T2 = {T8, T3};
  assign T3 = {T6, T4};
  assign T4 = {addrgen_ins_unused, T5};
  assign T5 = {addrgen_ins_isRunCfg, addrgen_ins_targetStage};
  assign addrgen_ins_targetStage = 2'h1;
  assign addrgen_ins_isRunCfg = 1'h1;
  assign addrgen_ins_unused = 68'h0;
  assign T6 = {addrgen_ins_runcfg_numTiles, T7};
  assign T7 = {addrgen_ins_runcfg_rhsOffset, addrgen_ins_runcfg_lhsOffset};
  assign addrgen_ins_runcfg_lhsOffset = io_stage_run_bits_lhsOffset;
  assign addrgen_ins_runcfg_rhsOffset = io_stage_run_bits_rhsOffset;
  assign addrgen_ins_runcfg_numTiles = io_stage_run_bits_numTiles;
  assign T8 = {T11, T9};
  assign T9 = {addrgen_ins_runcfg_clear_before_first_accumulation, T10};
  assign T10 = {addrgen_ins_runcfg_negate, addrgen_ins_runcfg_shiftAmount};
  assign addrgen_ins_runcfg_shiftAmount = io_stage_run_bits_shiftAmount;
  assign addrgen_ins_runcfg_negate = io_stage_run_bits_negate;
  assign addrgen_ins_runcfg_clear_before_first_accumulation = io_stage_run_bits_clear_before_first_accumulation;
  assign T11 = {addrgen_ins_runcfg_writeAddr, addrgen_ins_runcfg_writeEn};
  assign addrgen_ins_runcfg_writeEn = io_stage_run_bits_writeEn;
  assign addrgen_ins_runcfg_writeAddr = io_stage_run_bits_writeAddr;
  assign addrgen_out_delayed_clear = T12;
  assign T12 = addrgen_out_delayed_raw[33];
  assign addrgen_out_delayed_negate = T15;
  assign T15 = addrgen_out_delayed_raw[34];
  assign T45 = addrgen_out_delayed_shiftAmount[0];
  assign addrgen_out_delayed_shiftAmount = T16;
  assign T16 = addrgen_out_delayed_raw[39:35];
  assign io_res_req_0_0_writeEn = addrgen_out_final_delayed_writeEn;
  assign addrgen_out_final_delayed_writeEn = T19;
  assign T19 = addrgen_out_final_delayed_raw[40];
  assign io_res_req_0_0_writeData = DotProductArray_io_out_0_0;
  assign io_res_req_0_0_addr = addrgen_out_final_delayed_writeAddr;
  assign addrgen_out_final_delayed_writeAddr = T29;
  assign T29 = addrgen_out_final_delayed_raw[41];
  assign io_res_req_0_1_writeEn = addrgen_out_final_delayed_writeEn;
  assign io_res_req_0_1_writeData = DotProductArray_io_out_0_1;
  assign io_res_req_0_1_addr = addrgen_out_final_delayed_writeAddr;
  assign io_res_req_1_0_writeEn = addrgen_out_final_delayed_writeEn;
  assign io_res_req_1_0_writeData = DotProductArray_io_out_1_0;
  assign io_res_req_1_0_addr = addrgen_out_final_delayed_writeAddr;
  assign io_res_req_1_1_writeEn = addrgen_out_final_delayed_writeEn;
  assign io_res_req_1_1_writeData = DotProductArray_io_out_1_1;
  assign io_res_req_1_1_addr = addrgen_out_final_delayed_writeAddr;
  assign io_tilemem_rhs_req_0_writeEn = 1'h0;
  assign io_tilemem_rhs_req_0_addr = T46;
  assign T46 = addrgen_out_rhsAddr[9:0];
  assign addrgen_out_rhsAddr = T30;
  assign T30 = addrgen_d_out_V_V_TDATA[31:16];
  assign io_tilemem_rhs_req_1_writeEn = 1'h0;
  assign io_tilemem_rhs_req_1_addr = T47;
  assign T47 = addrgen_out_rhsAddr[9:0];
  assign io_tilemem_lhs_req_0_writeEn = 1'h0;
  assign io_tilemem_lhs_req_0_addr = T48;
  assign T48 = addrgen_out_lhsAddr[9:0];
  assign addrgen_out_lhsAddr = T31;
  assign T31 = addrgen_d_out_V_V_TDATA[15:0];
  assign io_tilemem_lhs_req_1_writeEn = 1'h0;
  assign io_tilemem_lhs_req_1_addr = T49;
  assign T49 = addrgen_out_lhsAddr[9:0];
  assign io_cfg_config_rhs_mem = 32'h400;
  assign io_cfg_config_lhs_mem = 32'h400;
  assign io_cfg_config_dpu_z = 32'h40;
  assign io_cfg_config_dpu_y = 32'h2;
  assign io_cfg_config_dpu_x = 32'h2;
  assign io_stage_done_valid = R32;
  assign isLastAddr = T43 & addrgen_out_last;
  assign addrgen_out_last = T42;
  assign T42 = addrgen_d_out_V_V_TDATA[32];
  assign T43 = 1'h1 & addrgen_d_out_V_V_TVALID;
  assign io_stage_run_ready = addrgen_d_in_V_V_TREADY;
  DotProductArray DotProductArray(.clk(clk), .reset(reset),
       .io_valid( read_complete ),
       .io_shiftAmount( T45 ),
       .io_negate( addrgen_out_delayed_negate ),
       .io_clear_acc( addrgen_out_delayed_clear ),
       .io_a_1( io_tilemem_lhs_rsp_1_readData ),
       .io_a_0( io_tilemem_lhs_rsp_0_readData ),
       .io_b_1( io_tilemem_rhs_rsp_1_readData ),
       .io_b_0( io_tilemem_rhs_rsp_0_readData ),
       .io_out_1_1( DotProductArray_io_out_1_1 ),
       .io_out_1_0( DotProductArray_io_out_1_0 ),
       .io_out_0_1( DotProductArray_io_out_0_1 ),
       .io_out_0_0( DotProductArray_io_out_0_0 )
  );
  ExecAddrGen addrgen_d(.ap_clk(clk),
       .in_V_V_TREADY( addrgen_d_in_V_V_TREADY ),
       .in_V_V_TVALID( io_stage_run_valid ),
       .in_V_V_TDATA( T44 ),
       .out_V_V_TREADY( 1'h1 ),
       .out_V_V_TVALID( addrgen_d_out_V_V_TVALID ),
       .out_V_V_TDATA( addrgen_d_out_V_V_TDATA ),
       .ap_rst_n( T0 )
  );

  always @(posedge clk) begin
    addrgen_out_delayed_raw <= R13;
    R13 <= R14;
    R14 <= addrgen_d_out_V_V_TDATA;
    read_complete <= R17;
    R17 <= R18;
    R18 <= addrgen_d_out_V_V_TVALID;
    addrgen_out_final_delayed_raw <= R20;
    R20 <= R21;
    R21 <= R22;
    R22 <= R23;
    R23 <= R24;
    R24 <= R25;
    R25 <= R26;
    R26 <= R27;
    R27 <= R28;
    R28 <= addrgen_d_out_V_V_TDATA;
    R32 <= R33;
    R33 <= R34;
    R34 <= R35;
    R35 <= R36;
    R36 <= R37;
    R37 <= R38;
    R38 <= R39;
    R39 <= R40;
    R40 <= R41;
    R41 <= isLastAddr;
  end
endmodule

module ParallelInSerialOut(input clk, input reset,
    input [127:0] io_parIn,
    input  io_parWrEn,
    input [63:0] io_serIn,
    output[63:0] io_serOut,
    input  io_shiftEn
);

  reg [63:0] stages_0;
  wire[63:0] T8;
  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] T2;
  reg [63:0] stages_1;
  wire[63:0] T9;
  wire[63:0] T3;
  wire[63:0] T4;
  wire[63:0] T5;
  wire T6;
  wire T7;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    stages_0 = {2{$random}};
    stages_1 = {2{$random}};
  end
// synthesis translate_on
`endif

  assign io_serOut = stages_0;
  assign T8 = reset ? 64'h0 : T0;
  assign T0 = T6 ? stages_1 : T1;
  assign T1 = io_parWrEn ? T2 : stages_0;
  assign T2 = io_parIn[63:0];
  assign T9 = reset ? 64'h0 : T3;
  assign T3 = T6 ? io_serIn : T4;
  assign T4 = io_parWrEn ? T5 : stages_1;
  assign T5 = io_parIn[127:64];
  assign T6 = T7 & io_shiftEn;
  assign T7 = io_parWrEn ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      stages_0 <= 64'h0;
    end else if(T6) begin
      stages_0 <= stages_1;
    end else if(io_parWrEn) begin
      stages_0 <= T2;
    end
    if(reset) begin
      stages_1 <= 64'h0;
    end else if(T6) begin
      stages_1 <= io_serIn;
    end else if(io_parWrEn) begin
      stages_1 <= T5;
    end
  end
endmodule

module AXIStreamDownsizer(input clk, input reset,
    output wide_TREADY,
    input  wide_TVALID,
    input [127:0] wide_TDATA,
    input  narrow_TREADY,
    output narrow_TVALID,
    output[63:0] narrow_TDATA
);

  wire T0;
  wire T1;
  reg [1:0] regState;
  wire[1:0] T22;
  wire[1:0] T2;
  wire[1:0] T3;
  wire[1:0] T4;
  wire[1:0] T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  reg  regShiftCount;
  wire T23;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire[63:0] shiftReg_io_serOut;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regState = {1{$random}};
    regShiftCount = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = T1 & narrow_TREADY;
  assign T1 = 2'h1 == regState;
  assign T22 = reset ? 2'h0 : T2;
  assign T2 = T17 ? 2'h0 : T3;
  assign T3 = T14 ? 2'h1 : T4;
  assign T4 = T8 ? 2'h2 : T5;
  assign T5 = T6 ? 2'h1 : regState;
  assign T6 = T7 & wide_TVALID;
  assign T7 = 2'h0 == regState;
  assign T8 = T0 & T9;
  assign T9 = regShiftCount == 1'h0;
  assign T23 = reset ? 1'h0 : T10;
  assign T10 = T14 ? 1'h0 : T11;
  assign T11 = T0 ? T13 : T12;
  assign T12 = T7 ? 1'h0 : regShiftCount;
  assign T13 = regShiftCount + 1'h1;
  assign T14 = T15 & wide_TVALID;
  assign T15 = T16 & narrow_TREADY;
  assign T16 = 2'h2 == regState;
  assign T17 = T15 & T18;
  assign T18 = wide_TVALID ^ 1'h1;
  assign T19 = T14 ? 1'h1 : T7;
  assign narrow_TDATA = shiftReg_io_serOut;
  assign narrow_TVALID = T20;
  assign T20 = T16 ? 1'h1 : T1;
  assign wide_TREADY = T21;
  assign T21 = T14 ? 1'h1 : T7;
  ParallelInSerialOut shiftReg(.clk(clk), .reset(reset),
       .io_parIn( wide_TDATA ),
       .io_parWrEn( T19 ),
       .io_serIn( 64'h0 ),
       .io_serOut( shiftReg_io_serOut ),
       .io_shiftEn( T0 )
  );

  always @(posedge clk) begin
    if(reset) begin
      regState <= 2'h0;
    end else if(T17) begin
      regState <= 2'h0;
    end else if(T14) begin
      regState <= 2'h1;
    end else if(T8) begin
      regState <= 2'h2;
    end else if(T6) begin
      regState <= 2'h1;
    end
    if(reset) begin
      regShiftCount <= 1'h0;
    end else if(T14) begin
      regShiftCount <= 1'h0;
    end else if(T0) begin
      regShiftCount <= T13;
    end else if(T7) begin
      regShiftCount <= 1'h0;
    end
  end
endmodule

module StreamResizer(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [127:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits
);

  wire AXIStreamDownsizer_wide_TREADY;
  wire AXIStreamDownsizer_narrow_TVALID;
  wire[63:0] AXIStreamDownsizer_narrow_TDATA;


  assign io_out_bits = AXIStreamDownsizer_narrow_TDATA;
  assign io_out_valid = AXIStreamDownsizer_narrow_TVALID;
  assign io_in_ready = AXIStreamDownsizer_wide_TREADY;
  AXIStreamDownsizer AXIStreamDownsizer(.clk(clk), .reset(reset),
       .wide_TREADY( AXIStreamDownsizer_wide_TREADY ),
       .wide_TVALID( io_in_valid ),
       .wide_TDATA( io_in_bits ),
       .narrow_TREADY( io_out_ready ),
       .narrow_TVALID( AXIStreamDownsizer_narrow_TVALID ),
       .narrow_TDATA( AXIStreamDownsizer_narrow_TDATA )
  );
endmodule

module BlockStridedRqGen_1(input clk, input reset,
    input [31:0] io_block_intra_step,
    input [31:0] io_block_intra_count,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_base,
    input [31:0] io_in_bits_block_step,
    input [31:0] io_in_bits_block_count,
    input  io_out_ready,
    output io_out_valid,
    output[5:0] io_out_bits_channelID,
    output io_out_bits_isWrite,
    output[31:0] io_out_bits_addr,
    output[7:0] io_out_bits_numBytes,
    output io_out_bits_metaData
);

  wire[7:0] T0;
  wire MultiSeqGen_io_in_ready;
  wire MultiSeqGen_io_out_valid;
  wire[31:0] MultiSeqGen_io_out_bits;
  wire BurstyMultiSeqGen_io_in_ready;
  wire BurstyMultiSeqGen_io_out_valid;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_ind;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_step;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[31:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[31:0] FPGAQueue_1_io_deq_bits_ind;
  wire[31:0] FPGAQueue_1_io_deq_bits_step;


  assign io_out_bits_metaData = 1'h0;
  assign io_out_bits_numBytes = T0;
  assign T0 = FPGAQueue_1_io_deq_bits_step[7:0];
  assign io_out_bits_addr = FPGAQueue_1_io_deq_bits_ind;
  assign io_out_bits_isWrite = 1'h1;
  assign io_out_bits_channelID = 6'h0;
  assign io_out_valid = FPGAQueue_1_io_deq_valid;
  assign io_in_ready = MultiSeqGen_io_in_ready;
  MultiSeqGen MultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( MultiSeqGen_io_in_ready ),
       .io_in_valid( io_in_valid ),
       .io_in_bits_init( io_in_bits_base ),
       .io_in_bits_count( io_in_bits_block_count ),
       .io_in_bits_step( io_in_bits_block_step ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( MultiSeqGen_io_out_valid ),
       .io_out_bits( MultiSeqGen_io_out_bits )
  );
  BurstyMultiSeqGen BurstyMultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits_init( FPGAQueue_io_deq_bits ),
       .io_in_bits_count( io_block_intra_count ),
       .io_in_bits_step( io_block_intra_step ),
       .io_out_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_out_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_out_bits_step( BurstyMultiSeqGen_io_out_bits_step )
  );
  FPGAQueue_8 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( MultiSeqGen_io_out_valid ),
       .io_enq_bits( MultiSeqGen_io_out_bits ),
       .io_deq_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_9 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_enq_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_enq_bits_step( BurstyMultiSeqGen_io_out_bits_step ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits_ind( FPGAQueue_1_io_deq_bits_ind ),
       .io_deq_bits_step( FPGAQueue_1_io_deq_bits_step )
       //.io_count(  )
  );
endmodule

module SRLQueue_13(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[1:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[63:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(3),
    .width(64)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_13(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[63:0] SRLQueue_io_deq_bits;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_13 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module BRAMQueue_3(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[8:0] io_count
);

  wire do_enq;
  reg [7:0] R0;
  wire[7:0] T15;
  wire[7:0] T1;
  wire[7:0] T2;
  reg [7:0] R3;
  wire[7:0] T16;
  wire[7:0] T4;
  wire[7:0] T5;
  wire do_deq;
  wire T6;
  wire empty;
  wire T7;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire ptr_match;
  wire canPrefetch;
  reg  R10;
  wire T18;
  wire[8:0] T11;
  wire[8:0] T19;
  wire[8:0] T12;
  wire[7:0] ptr_diff;
  wire T13;
  wire T14;
  wire full;
  wire[63:0] DualPortBRAM_b_dout;
  wire FPGAQueue_io_deq_valid;
  wire[63:0] FPGAQueue_io_deq_bits;
  wire[1:0] FPGAQueue_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R0 = {1{$random}};
    R3 = {1{$random}};
    maybe_full = {1{$random}};
    R10 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign do_enq = io_enq_ready & io_enq_valid;
  assign T15 = reset ? 8'h0 : T1;
  assign T1 = do_enq ? T2 : R0;
  assign T2 = R0 + 8'h1;
  assign T16 = reset ? 8'h0 : T4;
  assign T4 = do_deq ? T5 : R3;
  assign T5 = R3 + 8'h1;
  assign do_deq = canPrefetch & T6;
  assign T6 = empty ^ 1'h1;
  assign empty = ptr_match & T7;
  assign T7 = maybe_full ^ 1'h1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R0 == R3;
  assign canPrefetch = FPGAQueue_io_count < 2'h2;
  assign T18 = reset ? 1'h0 : do_deq;
  assign io_count = T11;
  assign T11 = T12 + T19;
  assign T19 = {7'h0, FPGAQueue_io_count};
  assign T12 = {T13, ptr_diff};
  assign ptr_diff = R0 - R3;
  assign T13 = maybe_full & ptr_match;
  assign io_deq_bits = FPGAQueue_io_deq_bits;
  assign io_deq_valid = FPGAQueue_io_deq_valid;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;
  FPGAQueue_13 FPGAQueue(.clk(clk), .reset(reset),
       //.io_enq_ready(  )
       .io_enq_valid( R10 ),
       .io_enq_bits( DualPortBRAM_b_dout ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits ),
       .io_count( FPGAQueue_io_count )
  );
  DualPortBRAM # (
    .DATA(64),
    .ADDR(8)
  ) DualPortBRAM(.clk(clk),
       .b_addr( R3 ),
       .b_din( 64'h0 ),
       .b_wr( 1'h0 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( R0 ),
       .a_din( io_enq_bits ),
       .a_wr( do_enq )
       //.a_dout(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      R0 <= 8'h0;
    end else if(do_enq) begin
      R0 <= T2;
    end
    if(reset) begin
      R3 <= 8'h0;
    end else if(do_deq) begin
      R3 <= T5;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R10 <= 1'h0;
    end else begin
      R10 <= do_deq;
    end
  end
endmodule

module FPGAQueue_17(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[8:0] io_count
);

  wire BRAMQueue_io_enq_ready;
  wire BRAMQueue_io_deq_valid;
  wire[63:0] BRAMQueue_io_deq_bits;
  wire[8:0] BRAMQueue_io_count;


  assign io_count = BRAMQueue_io_count;
  assign io_deq_bits = BRAMQueue_io_deq_bits;
  assign io_deq_valid = BRAMQueue_io_deq_valid;
  assign io_enq_ready = BRAMQueue_io_enq_ready;
  BRAMQueue_3 BRAMQueue(.clk(clk), .reset(reset),
       .io_enq_ready( BRAMQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( BRAMQueue_io_deq_valid ),
       .io_deq_bits( BRAMQueue_io_deq_bits ),
       .io_count( BRAMQueue_io_count )
  );
endmodule

module ResultStage(input clk, input reset,
    input  io_start,
    output io_done,
    input [15:0] io_csr_waitCompleteBytes,
    input [15:0] io_csr_dram_skip,
    input [31:0] io_csr_dram_base,
    input  io_csr_resmem_addr,
    input  io_csr_nop,
    input  io_dram_wr_req_ready,
    output io_dram_wr_req_valid,
    output[5:0] io_dram_wr_req_bits_channelID,
    output io_dram_wr_req_bits_isWrite,
    output[31:0] io_dram_wr_req_bits_addr,
    output[7:0] io_dram_wr_req_bits_numBytes,
    output io_dram_wr_req_bits_metaData,
    input  io_dram_wr_dat_ready,
    output io_dram_wr_dat_valid,
    output[63:0] io_dram_wr_dat_bits,
    output io_dram_wr_rsp_ready,
    input  io_dram_wr_rsp_valid,
    input [5:0] io_dram_wr_rsp_bits_channelID,
    input [63:0] io_dram_wr_rsp_bits_readData,
    input  io_dram_wr_rsp_bits_isWrite,
    input  io_dram_wr_rsp_bits_isLast,
    input  io_dram_wr_rsp_bits_metaData,
    output io_resmem_req_1_1_addr,
    output[31:0] io_resmem_req_1_1_writeData,
    output io_resmem_req_1_1_writeEn,
    output io_resmem_req_1_0_addr,
    output[31:0] io_resmem_req_1_0_writeData,
    output io_resmem_req_1_0_writeEn,
    output io_resmem_req_0_1_addr,
    output[31:0] io_resmem_req_0_1_writeData,
    output io_resmem_req_0_1_writeEn,
    output io_resmem_req_0_0_addr,
    output[31:0] io_resmem_req_0_0_writeData,
    output io_resmem_req_0_0_writeEn,
    input [31:0] io_resmem_rsp_1_1_readData,
    input [31:0] io_resmem_rsp_1_0_readData,
    input [31:0] io_resmem_rsp_0_1_readData,
    input [31:0] io_resmem_rsp_0_0_readData
);

  wire[31:0] T55;
  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  reg [1:0] regState;
  wire[1:0] T56;
  wire[1:0] T5;
  wire[1:0] T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire[1:0] T9;
  wire[1:0] T10;
  wire[1:0] T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  reg [31:0] regOutstandingWrBytes;
  wire[31:0] T57;
  wire[31:0] T35;
  wire[31:0] T36;
  wire[31:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire[31:0] T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire[127:0] allacc;
  wire[63:0] T52;
  wire[63:0] T53;
  wire T54;
  wire StreamResizer_io_in_ready;
  wire StreamResizer_io_out_valid;
  wire[63:0] StreamResizer_io_out_bits;
  wire BlockStridedRqGen_io_in_ready;
  wire BlockStridedRqGen_io_out_valid;
  wire[5:0] BlockStridedRqGen_io_out_bits_channelID;
  wire BlockStridedRqGen_io_out_bits_isWrite;
  wire[31:0] BlockStridedRqGen_io_out_bits_addr;
  wire[7:0] BlockStridedRqGen_io_out_bits_numBytes;
  wire BlockStridedRqGen_io_out_bits_metaData;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[63:0] FPGAQueue_io_deq_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regState = {1{$random}};
    regOutstandingWrBytes = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
  assign io_resmem_req_0_0_writeData = {1{$random}};
  assign io_resmem_req_0_1_writeData = {1{$random}};
  assign io_resmem_req_1_0_writeData = {1{$random}};
  assign io_resmem_req_1_1_writeData = {1{$random}};
// synthesis translate_on
`endif
  assign T55 = {16'h0, io_csr_dram_skip};
  assign T0 = T51 ? 1'h1 : T1;
  assign T1 = T3 & T2;
  assign T2 = io_csr_nop ^ 1'h1;
  assign T3 = T4 & io_start;
  assign T4 = 2'h0 == regState;
  assign T56 = reset ? 2'h0 : T5;
  assign T5 = T29 ? 2'h0 : T6;
  assign T6 = T28 ? 2'h3 : T7;
  assign T7 = T26 ? 2'h3 : T8;
  assign T8 = T21 ? 2'h3 : T9;
  assign T9 = T16 ? 2'h1 : T10;
  assign T10 = T13 ? 2'h2 : T11;
  assign T11 = T12 ? 2'h3 : regState;
  assign T12 = T3 & io_csr_nop;
  assign T13 = T1 & T14;
  assign T14 = StreamResizer_io_in_ready & T15;
  assign T15 = BlockStridedRqGen_io_in_ready ^ 1'h1;
  assign T16 = T1 & T17;
  assign T17 = T20 & T18;
  assign T18 = T19 & BlockStridedRqGen_io_in_ready;
  assign T19 = StreamResizer_io_in_ready ^ 1'h1;
  assign T20 = T14 ^ 1'h1;
  assign T21 = T1 & T22;
  assign T22 = T24 & T23;
  assign T23 = StreamResizer_io_in_ready & BlockStridedRqGen_io_in_ready;
  assign T24 = T25 ^ 1'h1;
  assign T25 = T14 | T18;
  assign T26 = T27 & StreamResizer_io_in_ready;
  assign T27 = 2'h1 == regState;
  assign T28 = T51 & BlockStridedRqGen_io_in_ready;
  assign T29 = T31 & T30;
  assign T30 = io_start ^ 1'h1;
  assign T31 = T50 & T32;
  assign T32 = T33 ^ 1'h1;
  assign T33 = T49 & T34;
  assign T34 = 32'h0 < regOutstandingWrBytes;
  assign T57 = reset ? 32'h0 : T35;
  assign T35 = T43 ? T42 : T36;
  assign T36 = T38 ? T37 : regOutstandingWrBytes;
  assign T37 = regOutstandingWrBytes - 32'h8;
  assign T38 = T40 & T39;
  assign T39 = io_dram_wr_rsp_ready & io_dram_wr_rsp_valid;
  assign T40 = T41 ^ 1'h1;
  assign T41 = io_dram_wr_req_ready & io_dram_wr_req_valid;
  assign T42 = regOutstandingWrBytes + 32'h8;
  assign T43 = T48 & T44;
  assign T44 = T47 & T45;
  assign T45 = T46 ^ 1'h1;
  assign T46 = io_dram_wr_rsp_ready & io_dram_wr_rsp_valid;
  assign T47 = io_dram_wr_req_ready & io_dram_wr_req_valid;
  assign T48 = T38 ^ 1'h1;
  assign T49 = 16'h0 < io_csr_waitCompleteBytes;
  assign T50 = 2'h3 == regState;
  assign T51 = 2'h2 == regState;
  assign allacc = {T53, T52};
  assign T52 = {io_resmem_rsp_1_0_readData, io_resmem_rsp_0_0_readData};
  assign T53 = {io_resmem_rsp_1_1_readData, io_resmem_rsp_0_1_readData};
  assign T54 = T27 ? 1'h1 : T1;
  assign io_resmem_req_0_0_writeEn = 1'h0;
  assign io_resmem_req_0_0_addr = io_csr_resmem_addr;
  assign io_resmem_req_0_1_writeEn = 1'h0;
  assign io_resmem_req_0_1_addr = io_csr_resmem_addr;
  assign io_resmem_req_1_0_writeEn = 1'h0;
  assign io_resmem_req_1_0_addr = io_csr_resmem_addr;
  assign io_resmem_req_1_1_writeEn = 1'h0;
  assign io_resmem_req_1_1_addr = io_csr_resmem_addr;
  assign io_dram_wr_rsp_ready = 1'h1;
  assign io_dram_wr_dat_bits = FPGAQueue_io_deq_bits;
  assign io_dram_wr_dat_valid = FPGAQueue_io_deq_valid;
  assign io_dram_wr_req_bits_metaData = BlockStridedRqGen_io_out_bits_metaData;
  assign io_dram_wr_req_bits_numBytes = BlockStridedRqGen_io_out_bits_numBytes;
  assign io_dram_wr_req_bits_addr = BlockStridedRqGen_io_out_bits_addr;
  assign io_dram_wr_req_bits_isWrite = BlockStridedRqGen_io_out_bits_isWrite;
  assign io_dram_wr_req_bits_channelID = BlockStridedRqGen_io_out_bits_channelID;
  assign io_dram_wr_req_valid = BlockStridedRqGen_io_out_valid;
  assign io_done = T31;
  StreamResizer StreamResizer(.clk(clk), .reset(reset),
       .io_in_ready( StreamResizer_io_in_ready ),
       .io_in_valid( T54 ),
       .io_in_bits( allacc ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( StreamResizer_io_out_valid ),
       .io_out_bits( StreamResizer_io_out_bits )
  );
  BlockStridedRqGen_1 BlockStridedRqGen(.clk(clk), .reset(reset),
       .io_block_intra_step( 32'h8 ),
       .io_block_intra_count( 32'h1 ),
       .io_in_ready( BlockStridedRqGen_io_in_ready ),
       .io_in_valid( T0 ),
       .io_in_bits_base( io_csr_dram_base ),
       .io_in_bits_block_step( T55 ),
       .io_in_bits_block_count( 32'h2 ),
       .io_out_ready( io_dram_wr_req_ready ),
       .io_out_valid( BlockStridedRqGen_io_out_valid ),
       .io_out_bits_channelID( BlockStridedRqGen_io_out_bits_channelID ),
       .io_out_bits_isWrite( BlockStridedRqGen_io_out_bits_isWrite ),
       .io_out_bits_addr( BlockStridedRqGen_io_out_bits_addr ),
       .io_out_bits_numBytes( BlockStridedRqGen_io_out_bits_numBytes ),
       .io_out_bits_metaData( BlockStridedRqGen_io_out_bits_metaData )
  );
  FPGAQueue_17 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( StreamResizer_io_out_valid ),
       .io_enq_bits( StreamResizer_io_out_bits ),
       .io_deq_ready( io_dram_wr_dat_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      regState <= 2'h0;
    end else if(T29) begin
      regState <= 2'h0;
    end else if(T28) begin
      regState <= 2'h3;
    end else if(T26) begin
      regState <= 2'h3;
    end else if(T21) begin
      regState <= 2'h3;
    end else if(T16) begin
      regState <= 2'h1;
    end else if(T13) begin
      regState <= 2'h2;
    end else if(T12) begin
      regState <= 2'h3;
    end
    if(reset) begin
      regOutstandingWrBytes <= 32'h0;
    end else if(T43) begin
      regOutstandingWrBytes <= T42;
    end else if(T38) begin
      regOutstandingWrBytes <= T37;
    end
  end
endmodule

module StateProfiler(input clk, input reset,
    input  io_start,
    input [31:0] io_probe,
    output[31:0] io_count,
    input [1:0] io_sel
);

  wire[31:0] T0;
  wire[31:0] T1;
  reg [31:0] regStateCount_0;
  wire[31:0] T39;
  wire[31:0] T2;
  wire[31:0] T3;
  wire T4;
  wire T5;
  reg [1:0] regState;
  wire[1:0] T40;
  wire[1:0] T6;
  wire[1:0] T7;
  wire T8;
  wire T9;
  wire T10;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire T14;
  wire[1:0] T15;
  wire[1:0] T41;
  reg [31:0] regInState;
  wire[31:0] T42;
  wire[31:0] T16;
  reg [31:0] regStateCount_2;
  wire[31:0] T43;
  wire[31:0] T17;
  wire[31:0] T18;
  wire T19;
  wire T20;
  wire[3:0] T21;
  reg [31:0] regStateCount_3;
  wire[31:0] T44;
  wire[31:0] T22;
  wire[31:0] T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  reg [31:0] regStateCount_1;
  wire[31:0] T45;
  wire[31:0] T30;
  wire[31:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[1:0] T35;
  wire[31:0] T36;
  wire T37;
  wire T38;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regStateCount_0 = {1{$random}};
    regState = {1{$random}};
    regInState = {1{$random}};
    regStateCount_2 = {1{$random}};
    regStateCount_3 = {1{$random}};
    regStateCount_1 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = T38 ? T36 : T1;
  assign T1 = T34 ? regStateCount_1 : regStateCount_0;
  assign T39 = reset ? 32'h0 : T2;
  assign T2 = T28 ? T11 : T3;
  assign T3 = T4 ? 32'h0 : regStateCount_0;
  assign T4 = T5 & io_start;
  assign T5 = 2'h0 == regState;
  assign T40 = reset ? 2'h0 : T6;
  assign T6 = T8 ? 2'h0 : T7;
  assign T7 = T4 ? 2'h1 : regState;
  assign T8 = T10 & T9;
  assign T9 = io_start ^ 1'h1;
  assign T10 = 2'h1 == regState;
  assign T11 = T12 + 32'h1;
  assign T12 = T27 ? T16 : T13;
  assign T13 = T14 ? regStateCount_1 : regStateCount_0;
  assign T14 = T15[0];
  assign T15 = T41;
  assign T41 = regInState[1:0];
  assign T42 = reset ? 32'h0 : io_probe;
  assign T16 = T26 ? regStateCount_3 : regStateCount_2;
  assign T43 = reset ? 32'h0 : T17;
  assign T17 = T19 ? T11 : T18;
  assign T18 = T4 ? 32'h0 : regStateCount_2;
  assign T19 = T10 & T20;
  assign T20 = T21[2];
  assign T21 = 1'h1 << T15;
  assign T44 = reset ? 32'h0 : T22;
  assign T22 = T24 ? T11 : T23;
  assign T23 = T4 ? 32'h0 : regStateCount_3;
  assign T24 = T10 & T25;
  assign T25 = T21[3];
  assign T26 = T15[0];
  assign T27 = T15[1];
  assign T28 = T10 & T29;
  assign T29 = T21[0];
  assign T45 = reset ? 32'h0 : T30;
  assign T30 = T32 ? T11 : T31;
  assign T31 = T4 ? 32'h0 : regStateCount_1;
  assign T32 = T10 & T33;
  assign T33 = T21[1];
  assign T34 = T35[0];
  assign T35 = io_sel;
  assign T36 = T37 ? regStateCount_3 : regStateCount_2;
  assign T37 = T35[0];
  assign T38 = T35[1];

  always @(posedge clk) begin
    if(reset) begin
      regStateCount_0 <= 32'h0;
    end else if(T28) begin
      regStateCount_0 <= T11;
    end else if(T4) begin
      regStateCount_0 <= 32'h0;
    end
    if(reset) begin
      regState <= 2'h0;
    end else if(T8) begin
      regState <= 2'h0;
    end else if(T4) begin
      regState <= 2'h1;
    end
    if(reset) begin
      regInState <= 32'h0;
    end else begin
      regInState <= io_probe;
    end
    if(reset) begin
      regStateCount_2 <= 32'h0;
    end else if(T19) begin
      regStateCount_2 <= T11;
    end else if(T4) begin
      regStateCount_2 <= 32'h0;
    end
    if(reset) begin
      regStateCount_3 <= 32'h0;
    end else if(T24) begin
      regStateCount_3 <= T11;
    end else if(T4) begin
      regStateCount_3 <= 32'h0;
    end
    if(reset) begin
      regStateCount_1 <= 32'h0;
    end else if(T32) begin
      regStateCount_1 <= T11;
    end else if(T4) begin
      regStateCount_1 <= 32'h0;
    end
  end
endmodule

module FetchDecoupledController(input clk, input reset,
    output io_op_ready,
    input  io_op_valid,
    input [15:0] io_op_bits_runcfg_tiles_per_row,
    input [7:0] io_op_bits_runcfg_dram_block_count,
    input [23:0] io_op_bits_runcfg_dram_block_offset_bytes,
    input [15:0] io_op_bits_runcfg_dram_block_size_bytes,
    input [31:0] io_op_bits_runcfg_dram_base,
    input [15:0] io_op_bits_runcfg_bram_addr_base,
    input  io_op_bits_runcfg_bram_id_range,
    input [8:0] io_op_bits_runcfg_bram_id_start,
    input [2:0] io_op_bits_unused,
    input  io_op_bits_isRunCfg,
    input [1:0] io_op_bits_targetStage,
    input  io_enable,
    input  io_stage_run_ready,
    output io_stage_run_valid,
    output[15:0] io_stage_run_bits_tiles_per_row,
    output[7:0] io_stage_run_bits_dram_block_count,
    output[23:0] io_stage_run_bits_dram_block_offset_bytes,
    output[15:0] io_stage_run_bits_dram_block_size_bytes,
    output[31:0] io_stage_run_bits_dram_base,
    output[15:0] io_stage_run_bits_bram_addr_base,
    output io_stage_run_bits_bram_id_range,
    output[8:0] io_stage_run_bits_bram_id_start,
    input  io_stage_done_valid,
    //input  io_stage_done_bits
    output io_sync_in_0_ready,
    input  io_sync_in_0_valid,
    input  io_sync_in_0_bits,
    input  io_sync_out_0_ready,
    output io_sync_out_0_valid,
    output io_sync_out_0_bits,
    input  io_perf_start,
    output[31:0] io_perf_count,
    input [1:0] io_perf_sel
);

  wire[31:0] T68;
  reg [1:0] regProfileState;
  wire[1:0] T69;
  wire[1:0] T0;
  wire[1:0] T1;
  wire[1:0] T2;
  wire T3;
  reg [31:0] regOutstandingRunCmds;
  wire[31:0] T70;
  wire[31:0] T4;
  wire[31:0] T5;
  wire[31:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  reg [1:0] regState;
  wire[1:0] T71;
  wire[1:0] T19;
  wire[1:0] T20;
  wire[1:0] T21;
  wire[1:0] T22;
  wire[1:0] T23;
  wire T24;
  wire T25;
  wire T26;
  wire[127:0] T27;
  wire[127:0] T28;
  wire[31:0] T29;
  wire[5:0] T30;
  wire[2:0] T31;
  wire[25:0] T32;
  wire[9:0] T33;
  wire[95:0] T34;
  wire[71:0] T35;
  wire[47:0] T36;
  wire[23:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire[1:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire[1:0] T59;
  wire T60;
  wire T72;
  wire[1:0] T61;
  wire T62;
  wire T63;
  wire[1:0] T64;
  wire T65;
  wire T73;
  wire T66;
  wire T67;
  wire[31:0] StateProfiler_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regProfileState = {1{$random}};
    regOutstandingRunCmds = {1{$random}};
    regState = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T68 = {30'h0, regProfileState};
  assign T69 = reset ? 2'h0 : T0;
  assign T0 = T54 ? regState : T1;
  assign T1 = T16 ? 2'h0 : T2;
  assign T2 = T3 ? 2'h1 : regProfileState;
  assign T3 = 32'h0 < regOutstandingRunCmds;
  assign T70 = reset ? 32'h0 : T4;
  assign T4 = T11 ? T10 : T5;
  assign T5 = T7 ? T6 : regOutstandingRunCmds;
  assign T6 = regOutstandingRunCmds + 32'h1;
  assign T7 = T9 & T8;
  assign T8 = io_stage_done_valid ^ 1'h1;
  assign T9 = io_stage_run_ready & io_stage_run_valid;
  assign T10 = regOutstandingRunCmds - 32'h1;
  assign T11 = T15 & T12;
  assign T12 = T13 & io_stage_done_valid;
  assign T13 = T14 ^ 1'h1;
  assign T14 = io_stage_run_ready & io_stage_run_valid;
  assign T15 = T7 ^ 1'h1;
  assign T16 = T18 & T17;
  assign T17 = io_op_valid == 1'h0;
  assign T18 = T3 ^ 1'h1;
  assign T71 = reset ? 2'h0 : T19;
  assign T19 = T52 ? 2'h0 : T20;
  assign T20 = T50 ? 2'h0 : T21;
  assign T21 = T47 ? T45 : T22;
  assign T22 = T41 ? 2'h1 : T23;
  assign T23 = T24 ? 2'h0 : regState;
  assign T24 = T25 & io_stage_run_ready;
  assign T25 = T38 & T26;
  assign T26 = T27[2];
  assign T27 = T28;
  assign T28 = {T34, T29};
  assign T29 = {T32, T30};
  assign T30 = {io_op_bits_unused, T31};
  assign T31 = {io_op_bits_isRunCfg, io_op_bits_targetStage};
  assign T32 = {io_op_bits_runcfg_bram_addr_base, T33};
  assign T33 = {io_op_bits_runcfg_bram_id_range, io_op_bits_runcfg_bram_id_start};
  assign T34 = {T37, T35};
  assign T35 = {io_op_bits_runcfg_dram_block_offset_bytes, T36};
  assign T36 = {io_op_bits_runcfg_dram_block_size_bytes, io_op_bits_runcfg_dram_base};
  assign T37 = {io_op_bits_runcfg_tiles_per_row, io_op_bits_runcfg_dram_block_count};
  assign T38 = T40 & T39;
  assign T39 = io_op_valid & io_enable;
  assign T40 = 2'h0 == regState;
  assign T41 = T38 & T42;
  assign T42 = T44 & T43;
  assign T43 = T26 ^ 1'h1;
  assign T44 = T26 ^ 1'h1;
  assign T45 = T46 ? 2'h2 : 2'h3;
  assign T46 = T27[3];
  assign T47 = T49 & T48;
  assign T48 = regOutstandingRunCmds == 32'h0;
  assign T49 = 2'h1 == regState;
  assign T50 = T51 & io_sync_out_0_ready;
  assign T51 = 2'h2 == regState;
  assign T52 = T53 & io_sync_in_0_valid;
  assign T53 = 2'h3 == regState;
  assign T54 = T55 ^ 1'h1;
  assign T55 = T3 | T17;
  assign T56 = io_perf_start & io_enable;
  assign io_perf_count = StateProfiler_io_count;
  assign io_sync_out_0_bits = 1'h0;
  assign io_sync_out_0_valid = T57;
  assign T57 = T51 & T58;
  assign T58 = T59[0];
  assign T59 = 1'h1 << T60;
  assign T60 = T72;
  assign T72 = T61[0];
  assign T61 = T27[5:4];
  assign io_sync_in_0_ready = T62;
  assign T62 = T53 & T63;
  assign T63 = T64[0];
  assign T64 = 1'h1 << T65;
  assign T65 = T73;
  assign T73 = T61[0];
  assign io_stage_run_bits_bram_id_start = io_op_bits_runcfg_bram_id_start;
  assign io_stage_run_bits_bram_id_range = io_op_bits_runcfg_bram_id_range;
  assign io_stage_run_bits_bram_addr_base = io_op_bits_runcfg_bram_addr_base;
  assign io_stage_run_bits_dram_base = io_op_bits_runcfg_dram_base;
  assign io_stage_run_bits_dram_block_size_bytes = io_op_bits_runcfg_dram_block_size_bytes;
  assign io_stage_run_bits_dram_block_offset_bytes = io_op_bits_runcfg_dram_block_offset_bytes;
  assign io_stage_run_bits_dram_block_count = io_op_bits_runcfg_dram_block_count;
  assign io_stage_run_bits_tiles_per_row = io_op_bits_runcfg_tiles_per_row;
  assign io_stage_run_valid = T25;
  assign io_op_ready = T66;
  assign T66 = T52 ? 1'h1 : T67;
  assign T67 = T50 ? 1'h1 : T24;
  StateProfiler StateProfiler(.clk(clk), .reset(reset),
       .io_start( T56 ),
       .io_probe( T68 ),
       .io_count( StateProfiler_io_count ),
       .io_sel( io_perf_sel )
  );

  always @(posedge clk) begin
    if(reset) begin
      regProfileState <= 2'h0;
    end else if(T54) begin
      regProfileState <= regState;
    end else if(T16) begin
      regProfileState <= 2'h0;
    end else if(T3) begin
      regProfileState <= 2'h1;
    end
    if(reset) begin
      regOutstandingRunCmds <= 32'h0;
    end else if(T11) begin
      regOutstandingRunCmds <= T10;
    end else if(T7) begin
      regOutstandingRunCmds <= T6;
    end
    if(reset) begin
      regState <= 2'h0;
    end else if(T52) begin
      regState <= 2'h0;
    end else if(T50) begin
      regState <= 2'h0;
    end else if(T47) begin
      regState <= T45;
    end else if(T41) begin
      regState <= 2'h1;
    end else if(T24) begin
      regState <= 2'h0;
    end
  end
endmodule

module ExecDecoupledController(input clk, input reset,
    output io_op_ready,
    input  io_op_valid,
    input  io_op_bits_runcfg_writeAddr,
    input  io_op_bits_runcfg_writeEn,
    input  io_op_bits_runcfg_clear_before_first_accumulation,
    input  io_op_bits_runcfg_negate,
    input  io_op_bits_runcfg_shiftAmount,
    input [15:0] io_op_bits_runcfg_numTiles,
    input [15:0] io_op_bits_runcfg_rhsOffset,
    input [15:0] io_op_bits_runcfg_lhsOffset,
    input [67:0] io_op_bits_unused,
    input  io_op_bits_isRunCfg,
    input [1:0] io_op_bits_targetStage,
    input  io_enable,
    input  io_stage_run_ready,
    output io_stage_run_valid,
    output io_stage_run_bits_writeAddr,
    output io_stage_run_bits_writeEn,
    output io_stage_run_bits_clear_before_first_accumulation,
    output io_stage_run_bits_negate,
    output io_stage_run_bits_shiftAmount,
    output[15:0] io_stage_run_bits_numTiles,
    output[15:0] io_stage_run_bits_rhsOffset,
    output[15:0] io_stage_run_bits_lhsOffset,
    input  io_stage_done_valid,
    //input  io_stage_done_bits
    output io_sync_in_1_ready,
    input  io_sync_in_1_valid,
    input  io_sync_in_1_bits,
    output io_sync_in_0_ready,
    input  io_sync_in_0_valid,
    input  io_sync_in_0_bits,
    input  io_sync_out_1_ready,
    output io_sync_out_1_valid,
    output io_sync_out_1_bits,
    input  io_sync_out_0_ready,
    output io_sync_out_0_valid,
    output io_sync_out_0_bits,
    input  io_perf_start,
    output[31:0] io_perf_count,
    input [1:0] io_perf_sel
);

  wire[31:0] T74;
  reg [1:0] regProfileState;
  wire[1:0] T75;
  wire[1:0] T0;
  wire[1:0] T1;
  wire[1:0] T2;
  wire T3;
  reg [31:0] regOutstandingRunCmds;
  wire[31:0] T76;
  wire[31:0] T4;
  wire[31:0] T5;
  wire[31:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  reg [1:0] regState;
  wire[1:0] T77;
  wire[1:0] T19;
  wire[1:0] T20;
  wire[1:0] T21;
  wire[1:0] T22;
  wire[1:0] T23;
  wire T24;
  wire T25;
  wire T26;
  wire[123:0] T27;
  wire[123:0] T28;
  wire[118:0] T29;
  wire[70:0] T30;
  wire[2:0] T31;
  wire[47:0] T32;
  wire[31:0] T33;
  wire[4:0] T34;
  wire[2:0] T35;
  wire[1:0] T36;
  wire[1:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire[1:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T78;
  wire[1:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T79;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire[1:0] T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire[1:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire[31:0] StateProfiler_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regProfileState = {1{$random}};
    regOutstandingRunCmds = {1{$random}};
    regState = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T74 = {30'h0, regProfileState};
  assign T75 = reset ? 2'h0 : T0;
  assign T0 = T59 ? regState : T1;
  assign T1 = T16 ? 2'h0 : T2;
  assign T2 = T3 ? 2'h1 : regProfileState;
  assign T3 = 32'h0 < regOutstandingRunCmds;
  assign T76 = reset ? 32'h0 : T4;
  assign T4 = T11 ? T10 : T5;
  assign T5 = T7 ? T6 : regOutstandingRunCmds;
  assign T6 = regOutstandingRunCmds + 32'h1;
  assign T7 = T9 & T8;
  assign T8 = io_stage_done_valid ^ 1'h1;
  assign T9 = io_stage_run_ready & io_stage_run_valid;
  assign T10 = regOutstandingRunCmds - 32'h1;
  assign T11 = T15 & T12;
  assign T12 = T13 & io_stage_done_valid;
  assign T13 = T14 ^ 1'h1;
  assign T14 = io_stage_run_ready & io_stage_run_valid;
  assign T15 = T7 ^ 1'h1;
  assign T16 = T18 & T17;
  assign T17 = io_op_valid == 1'h0;
  assign T18 = T3 ^ 1'h1;
  assign T77 = reset ? 2'h0 : T19;
  assign T19 = T55 ? 2'h0 : T20;
  assign T20 = T50 ? 2'h0 : T21;
  assign T21 = T47 ? T45 : T22;
  assign T22 = T41 ? 2'h1 : T23;
  assign T23 = T24 ? 2'h0 : regState;
  assign T24 = T25 & io_stage_run_ready;
  assign T25 = T38 & T26;
  assign T26 = T27[2];
  assign T27 = T28;
  assign T28 = {T34, T29};
  assign T29 = {T32, T30};
  assign T30 = {io_op_bits_unused, T31};
  assign T31 = {io_op_bits_isRunCfg, io_op_bits_targetStage};
  assign T32 = {io_op_bits_runcfg_numTiles, T33};
  assign T33 = {io_op_bits_runcfg_rhsOffset, io_op_bits_runcfg_lhsOffset};
  assign T34 = {T37, T35};
  assign T35 = {io_op_bits_runcfg_clear_before_first_accumulation, T36};
  assign T36 = {io_op_bits_runcfg_negate, io_op_bits_runcfg_shiftAmount};
  assign T37 = {io_op_bits_runcfg_writeAddr, io_op_bits_runcfg_writeEn};
  assign T38 = T40 & T39;
  assign T39 = io_op_valid & io_enable;
  assign T40 = 2'h0 == regState;
  assign T41 = T38 & T42;
  assign T42 = T44 & T43;
  assign T43 = T26 ^ 1'h1;
  assign T44 = T26 ^ 1'h1;
  assign T45 = T46 ? 2'h2 : 2'h3;
  assign T46 = T27[3];
  assign T47 = T49 & T48;
  assign T48 = regOutstandingRunCmds == 32'h0;
  assign T49 = 2'h1 == regState;
  assign T50 = T54 & T51;
  assign T51 = T52 ? io_sync_out_1_ready : io_sync_out_0_ready;
  assign T52 = T78;
  assign T78 = T53[0];
  assign T53 = T27[5:4];
  assign T54 = 2'h2 == regState;
  assign T55 = T58 & T56;
  assign T56 = T57 ? io_sync_in_1_valid : io_sync_in_0_valid;
  assign T57 = T79;
  assign T79 = T53[0];
  assign T58 = 2'h3 == regState;
  assign T59 = T60 ^ 1'h1;
  assign T60 = T3 | T17;
  assign T61 = io_perf_start & io_enable;
  assign io_perf_count = StateProfiler_io_count;
  assign io_sync_out_0_bits = 1'h0;
  assign io_sync_out_0_valid = T62;
  assign T62 = T54 & T63;
  assign T63 = T64[0];
  assign T64 = 1'h1 << T52;
  assign io_sync_out_1_bits = 1'h0;
  assign io_sync_out_1_valid = T65;
  assign T65 = T54 & T66;
  assign T66 = T64[1];
  assign io_sync_in_0_ready = T67;
  assign T67 = T58 & T68;
  assign T68 = T69[0];
  assign T69 = 1'h1 << T57;
  assign io_sync_in_1_ready = T70;
  assign T70 = T58 & T71;
  assign T71 = T69[1];
  assign io_stage_run_bits_lhsOffset = io_op_bits_runcfg_lhsOffset;
  assign io_stage_run_bits_rhsOffset = io_op_bits_runcfg_rhsOffset;
  assign io_stage_run_bits_numTiles = io_op_bits_runcfg_numTiles;
  assign io_stage_run_bits_shiftAmount = io_op_bits_runcfg_shiftAmount;
  assign io_stage_run_bits_negate = io_op_bits_runcfg_negate;
  assign io_stage_run_bits_clear_before_first_accumulation = io_op_bits_runcfg_clear_before_first_accumulation;
  assign io_stage_run_bits_writeEn = io_op_bits_runcfg_writeEn;
  assign io_stage_run_bits_writeAddr = io_op_bits_runcfg_writeAddr;
  assign io_stage_run_valid = T25;
  assign io_op_ready = T72;
  assign T72 = T55 ? 1'h1 : T73;
  assign T73 = T50 ? 1'h1 : T24;
  StateProfiler StateProfiler(.clk(clk), .reset(reset),
       .io_start( T61 ),
       .io_probe( T74 ),
       .io_count( StateProfiler_io_count ),
       .io_sel( io_perf_sel )
  );

  always @(posedge clk) begin
    if(reset) begin
      regProfileState <= 2'h0;
    end else if(T59) begin
      regProfileState <= regState;
    end else if(T16) begin
      regProfileState <= 2'h0;
    end else if(T3) begin
      regProfileState <= 2'h1;
    end
    if(reset) begin
      regOutstandingRunCmds <= 32'h0;
    end else if(T11) begin
      regOutstandingRunCmds <= T10;
    end else if(T7) begin
      regOutstandingRunCmds <= T6;
    end
    if(reset) begin
      regState <= 2'h0;
    end else if(T55) begin
      regState <= 2'h0;
    end else if(T50) begin
      regState <= 2'h0;
    end else if(T47) begin
      regState <= T45;
    end else if(T41) begin
      regState <= 2'h1;
    end else if(T24) begin
      regState <= 2'h0;
    end
  end
endmodule

module ResultController(input clk, input reset,
    output io_op_ready,
    input  io_op_valid,
    input [15:0] io_op_bits_runcfg_waitCompleteBytes,
    input [15:0] io_op_bits_runcfg_dram_skip,
    input [31:0] io_op_bits_runcfg_dram_base,
    input  io_op_bits_runcfg_resmem_addr,
    input  io_op_bits_runcfg_nop,
    input [58:0] io_op_bits_unused,
    input  io_op_bits_isRunCfg,
    input [1:0] io_op_bits_targetStage,
    input  io_enable,
    output io_start,
    input  io_done,
    output[15:0] io_stageO_waitCompleteBytes,
    output[15:0] io_stageO_dram_skip,
    output[31:0] io_stageO_dram_base,
    output io_stageO_resmem_addr,
    output io_stageO_nop,
    output io_sync_in_0_ready,
    input  io_sync_in_0_valid,
    input  io_sync_in_0_bits,
    input  io_sync_out_0_ready,
    output io_sync_out_0_valid,
    output io_sync_out_0_bits,
    input  io_perf_start,
    output[31:0] io_perf_count,
    input [1:0] io_perf_sel
);

  wire[31:0] T44;
  reg [1:0] regState;
  wire[1:0] T45;
  wire[1:0] T0;
  wire[1:0] T1;
  wire[1:0] T2;
  wire[1:0] T3;
  wire[1:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[127:0] T9;
  wire[127:0] T10;
  wire[62:0] T11;
  wire[2:0] T12;
  wire[59:0] T13;
  wire[64:0] T14;
  wire[32:0] T15;
  wire[31:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire[1:0] T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire[1:0] T35;
  wire T36;
  wire T46;
  wire[1:0] T37;
  wire T38;
  wire T39;
  wire[1:0] T40;
  wire T41;
  wire T47;
  wire T42;
  wire T43;
  wire[31:0] StateProfiler_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regState = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T44 = {30'h0, regState};
  assign T45 = reset ? 2'h0 : T0;
  assign T0 = T30 ? 2'h0 : T1;
  assign T1 = T28 ? 2'h0 : T2;
  assign T2 = T26 ? 2'h0 : T3;
  assign T3 = T22 ? T20 : T4;
  assign T4 = T5 ? 2'h1 : regState;
  assign T5 = T17 & T6;
  assign T6 = T8 & T7;
  assign T7 = io_done ^ 1'h1;
  assign T8 = T9[2];
  assign T9 = T10;
  assign T10 = {T14, T11};
  assign T11 = {T13, T12};
  assign T12 = {io_op_bits_isRunCfg, io_op_bits_targetStage};
  assign T13 = {io_op_bits_runcfg_nop, io_op_bits_unused};
  assign T14 = {T16, T15};
  assign T15 = {io_op_bits_runcfg_dram_base, io_op_bits_runcfg_resmem_addr};
  assign T16 = {io_op_bits_runcfg_waitCompleteBytes, io_op_bits_runcfg_dram_skip};
  assign T17 = T19 & T18;
  assign T18 = io_op_valid & io_enable;
  assign T19 = 2'h0 == regState;
  assign T20 = T21 ? 2'h2 : 2'h3;
  assign T21 = T9[3];
  assign T22 = T17 & T23;
  assign T23 = T25 & T24;
  assign T24 = T8 ^ 1'h1;
  assign T25 = T6 ^ 1'h1;
  assign T26 = T27 & io_done;
  assign T27 = 2'h1 == regState;
  assign T28 = T29 & io_sync_out_0_ready;
  assign T29 = 2'h2 == regState;
  assign T30 = T31 & io_sync_in_0_valid;
  assign T31 = 2'h3 == regState;
  assign T32 = io_perf_start & io_enable;
  assign io_perf_count = StateProfiler_io_count;
  assign io_sync_out_0_bits = 1'h0;
  assign io_sync_out_0_valid = T33;
  assign T33 = T29 & T34;
  assign T34 = T35[0];
  assign T35 = 1'h1 << T36;
  assign T36 = T46;
  assign T46 = T37[0];
  assign T37 = T9[5:4];
  assign io_sync_in_0_ready = T38;
  assign T38 = T31 & T39;
  assign T39 = T40[0];
  assign T40 = 1'h1 << T41;
  assign T41 = T47;
  assign T47 = T37[0];
  assign io_stageO_nop = io_op_bits_runcfg_nop;
  assign io_stageO_resmem_addr = io_op_bits_runcfg_resmem_addr;
  assign io_stageO_dram_base = io_op_bits_runcfg_dram_base;
  assign io_stageO_dram_skip = io_op_bits_runcfg_dram_skip;
  assign io_stageO_waitCompleteBytes = io_op_bits_runcfg_waitCompleteBytes;
  assign io_start = T27;
  assign io_op_ready = T42;
  assign T42 = T30 ? 1'h1 : T43;
  assign T43 = T28 ? 1'h1 : T26;
  StateProfiler StateProfiler(.clk(clk), .reset(reset),
       .io_start( T32 ),
       .io_probe( T44 ),
       .io_count( StateProfiler_io_count ),
       .io_sel( io_perf_sel )
  );

  always @(posedge clk) begin
    if(reset) begin
      regState <= 2'h0;
    end else if(T30) begin
      regState <= 2'h0;
    end else if(T28) begin
      regState <= 2'h0;
    end else if(T26) begin
      regState <= 2'h0;
    end else if(T22) begin
      regState <= T20;
    end else if(T5) begin
      regState <= 2'h1;
    end
  end
endmodule

module SRLQueue_10(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_tiles_per_row,
    input [7:0] io_enq_bits_runcfg_dram_block_count,
    input [23:0] io_enq_bits_runcfg_dram_block_offset_bytes,
    input [15:0] io_enq_bits_runcfg_dram_block_size_bytes,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input [15:0] io_enq_bits_runcfg_bram_addr_base,
    input  io_enq_bits_runcfg_bram_id_range,
    input [8:0] io_enq_bits_runcfg_bram_id_start,
    input [2:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_tiles_per_row,
    output[7:0] io_deq_bits_runcfg_dram_block_count,
    output[23:0] io_deq_bits_runcfg_dram_block_offset_bytes,
    output[15:0] io_deq_bits_runcfg_dram_block_size_bytes,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output[15:0] io_deq_bits_runcfg_bram_addr_base,
    output io_deq_bits_runcfg_bram_id_range,
    output[8:0] io_deq_bits_runcfg_bram_id_start,
    output[2:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire T0;
  wire[127:0] T1;
  wire[127:0] T2;
  wire[31:0] T3;
  wire[5:0] T4;
  wire[2:0] T5;
  wire[25:0] T6;
  wire[9:0] T7;
  wire[95:0] T8;
  wire[71:0] T9;
  wire[47:0] T10;
  wire[23:0] T11;
  wire[1:0] T12;
  wire T13;
  wire[2:0] T14;
  wire[8:0] T15;
  wire T16;
  wire[15:0] T17;
  wire[31:0] T18;
  wire[15:0] T19;
  wire[23:0] T20;
  wire[7:0] T21;
  wire[15:0] T22;
  wire T23;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[127:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {T8, T3};
  assign T3 = {T6, T4};
  assign T4 = {io_enq_bits_unused, T5};
  assign T5 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T6 = {io_enq_bits_runcfg_bram_addr_base, T7};
  assign T7 = {io_enq_bits_runcfg_bram_id_range, io_enq_bits_runcfg_bram_id_start};
  assign T8 = {T11, T9};
  assign T9 = {io_enq_bits_runcfg_dram_block_offset_bytes, T10};
  assign T10 = {io_enq_bits_runcfg_dram_block_size_bytes, io_enq_bits_runcfg_dram_base};
  assign T11 = {io_enq_bits_runcfg_tiles_per_row, io_enq_bits_runcfg_dram_block_count};
  assign io_count = Q_srl_count;
  assign io_deq_bits_targetStage = T12;
  assign T12 = Q_srl_o_d[1:0];
  assign io_deq_bits_isRunCfg = T13;
  assign T13 = Q_srl_o_d[2];
  assign io_deq_bits_unused = T14;
  assign T14 = Q_srl_o_d[5:3];
  assign io_deq_bits_runcfg_bram_id_start = T15;
  assign T15 = Q_srl_o_d[14:6];
  assign io_deq_bits_runcfg_bram_id_range = T16;
  assign T16 = Q_srl_o_d[15];
  assign io_deq_bits_runcfg_bram_addr_base = T17;
  assign T17 = Q_srl_o_d[31:16];
  assign io_deq_bits_runcfg_dram_base = T18;
  assign T18 = Q_srl_o_d[63:32];
  assign io_deq_bits_runcfg_dram_block_size_bytes = T19;
  assign T19 = Q_srl_o_d[79:64];
  assign io_deq_bits_runcfg_dram_block_offset_bytes = T20;
  assign T20 = Q_srl_o_d[103:80];
  assign io_deq_bits_runcfg_dram_block_count = T21;
  assign T21 = Q_srl_o_d[111:104];
  assign io_deq_bits_runcfg_tiles_per_row = T22;
  assign T22 = Q_srl_o_d[127:112];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T23;
  assign T23 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(3),
    .width(128)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_10(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_tiles_per_row,
    input [7:0] io_enq_bits_runcfg_dram_block_count,
    input [23:0] io_enq_bits_runcfg_dram_block_offset_bytes,
    input [15:0] io_enq_bits_runcfg_dram_block_size_bytes,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input [15:0] io_enq_bits_runcfg_bram_addr_base,
    input  io_enq_bits_runcfg_bram_id_range,
    input [8:0] io_enq_bits_runcfg_bram_id_start,
    input [2:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_tiles_per_row,
    output[7:0] io_deq_bits_runcfg_dram_block_count,
    output[23:0] io_deq_bits_runcfg_dram_block_offset_bytes,
    output[15:0] io_deq_bits_runcfg_dram_block_size_bytes,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output[15:0] io_deq_bits_runcfg_bram_addr_base,
    output io_deq_bits_runcfg_bram_id_range,
    output[8:0] io_deq_bits_runcfg_bram_id_start,
    output[2:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_tiles_per_row;
  wire[7:0] SRLQueue_io_deq_bits_runcfg_dram_block_count;
  wire[23:0] SRLQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  wire[31:0] SRLQueue_io_deq_bits_runcfg_dram_base;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_bram_addr_base;
  wire SRLQueue_io_deq_bits_runcfg_bram_id_range;
  wire[8:0] SRLQueue_io_deq_bits_runcfg_bram_id_start;
  wire[2:0] SRLQueue_io_deq_bits_unused;
  wire SRLQueue_io_deq_bits_isRunCfg;
  wire[1:0] SRLQueue_io_deq_bits_targetStage;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_targetStage = SRLQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = SRLQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = SRLQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_bram_id_start = SRLQueue_io_deq_bits_runcfg_bram_id_start;
  assign io_deq_bits_runcfg_bram_id_range = SRLQueue_io_deq_bits_runcfg_bram_id_range;
  assign io_deq_bits_runcfg_bram_addr_base = SRLQueue_io_deq_bits_runcfg_bram_addr_base;
  assign io_deq_bits_runcfg_dram_base = SRLQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_block_size_bytes = SRLQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  assign io_deq_bits_runcfg_dram_block_offset_bytes = SRLQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  assign io_deq_bits_runcfg_dram_block_count = SRLQueue_io_deq_bits_runcfg_dram_block_count;
  assign io_deq_bits_runcfg_tiles_per_row = SRLQueue_io_deq_bits_runcfg_tiles_per_row;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_10 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_tiles_per_row( io_enq_bits_runcfg_tiles_per_row ),
       .io_enq_bits_runcfg_dram_block_count( io_enq_bits_runcfg_dram_block_count ),
       .io_enq_bits_runcfg_dram_block_offset_bytes( io_enq_bits_runcfg_dram_block_offset_bytes ),
       .io_enq_bits_runcfg_dram_block_size_bytes( io_enq_bits_runcfg_dram_block_size_bytes ),
       .io_enq_bits_runcfg_dram_base( io_enq_bits_runcfg_dram_base ),
       .io_enq_bits_runcfg_bram_addr_base( io_enq_bits_runcfg_bram_addr_base ),
       .io_enq_bits_runcfg_bram_id_range( io_enq_bits_runcfg_bram_id_range ),
       .io_enq_bits_runcfg_bram_id_start( io_enq_bits_runcfg_bram_id_start ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_runcfg_tiles_per_row( SRLQueue_io_deq_bits_runcfg_tiles_per_row ),
       .io_deq_bits_runcfg_dram_block_count( SRLQueue_io_deq_bits_runcfg_dram_block_count ),
       .io_deq_bits_runcfg_dram_block_offset_bytes( SRLQueue_io_deq_bits_runcfg_dram_block_offset_bytes ),
       .io_deq_bits_runcfg_dram_block_size_bytes( SRLQueue_io_deq_bits_runcfg_dram_block_size_bytes ),
       .io_deq_bits_runcfg_dram_base( SRLQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_bram_addr_base( SRLQueue_io_deq_bits_runcfg_bram_addr_base ),
       .io_deq_bits_runcfg_bram_id_range( SRLQueue_io_deq_bits_runcfg_bram_id_range ),
       .io_deq_bits_runcfg_bram_id_start( SRLQueue_io_deq_bits_runcfg_bram_id_start ),
       .io_deq_bits_unused( SRLQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( SRLQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( SRLQueue_io_deq_bits_targetStage ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module BRAMQueue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_tiles_per_row,
    input [7:0] io_enq_bits_runcfg_dram_block_count,
    input [23:0] io_enq_bits_runcfg_dram_block_offset_bytes,
    input [15:0] io_enq_bits_runcfg_dram_block_size_bytes,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input [15:0] io_enq_bits_runcfg_bram_addr_base,
    input  io_enq_bits_runcfg_bram_id_range,
    input [8:0] io_enq_bits_runcfg_bram_id_start,
    input [2:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_tiles_per_row,
    output[7:0] io_deq_bits_runcfg_dram_block_count,
    output[23:0] io_deq_bits_runcfg_dram_block_offset_bytes,
    output[15:0] io_deq_bits_runcfg_dram_block_size_bytes,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output[15:0] io_deq_bits_runcfg_bram_addr_base,
    output io_deq_bits_runcfg_bram_id_range,
    output[8:0] io_deq_bits_runcfg_bram_id_start,
    output[2:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire do_enq;
  wire[127:0] T0;
  wire[127:0] T1;
  wire[31:0] T2;
  wire[5:0] T3;
  wire[2:0] T4;
  wire[25:0] T5;
  wire[9:0] T6;
  wire[95:0] T7;
  wire[71:0] T8;
  wire[47:0] T9;
  wire[23:0] T10;
  reg [8:0] R11;
  wire[8:0] T37;
  wire[8:0] T12;
  wire[8:0] T13;
  reg [8:0] R14;
  wire[8:0] T38;
  wire[8:0] T15;
  wire[8:0] T16;
  wire do_deq;
  wire T17;
  wire empty;
  wire T18;
  reg  maybe_full;
  wire T39;
  wire T19;
  wire T20;
  wire ptr_match;
  wire canPrefetch;
  wire[1:0] T21;
  wire T22;
  wire[2:0] T23;
  wire[8:0] T24;
  wire T25;
  wire[15:0] T26;
  wire[31:0] T27;
  wire[15:0] T28;
  wire[23:0] T29;
  wire[7:0] T30;
  wire[15:0] T31;
  reg  R32;
  wire T40;
  wire[9:0] T33;
  wire[9:0] T41;
  wire[9:0] T34;
  wire[8:0] ptr_diff;
  wire T35;
  wire T36;
  wire full;
  wire[127:0] DualPortBRAM_b_dout;
  wire FPGAQueue_io_deq_valid;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_tiles_per_row;
  wire[7:0] FPGAQueue_io_deq_bits_runcfg_dram_block_count;
  wire[23:0] FPGAQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  wire[31:0] FPGAQueue_io_deq_bits_runcfg_dram_base;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_bram_addr_base;
  wire FPGAQueue_io_deq_bits_runcfg_bram_id_range;
  wire[8:0] FPGAQueue_io_deq_bits_runcfg_bram_id_start;
  wire[2:0] FPGAQueue_io_deq_bits_unused;
  wire FPGAQueue_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_io_deq_bits_targetStage;
  wire[1:0] FPGAQueue_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R11 = {1{$random}};
    R14 = {1{$random}};
    maybe_full = {1{$random}};
    R32 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign do_enq = io_enq_ready & io_enq_valid;
  assign T0 = T1;
  assign T1 = {T7, T2};
  assign T2 = {T5, T3};
  assign T3 = {io_enq_bits_unused, T4};
  assign T4 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T5 = {io_enq_bits_runcfg_bram_addr_base, T6};
  assign T6 = {io_enq_bits_runcfg_bram_id_range, io_enq_bits_runcfg_bram_id_start};
  assign T7 = {T10, T8};
  assign T8 = {io_enq_bits_runcfg_dram_block_offset_bytes, T9};
  assign T9 = {io_enq_bits_runcfg_dram_block_size_bytes, io_enq_bits_runcfg_dram_base};
  assign T10 = {io_enq_bits_runcfg_tiles_per_row, io_enq_bits_runcfg_dram_block_count};
  assign T37 = reset ? 9'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 9'h1;
  assign T38 = reset ? 9'h0 : T15;
  assign T15 = do_deq ? T16 : R14;
  assign T16 = R14 + 9'h1;
  assign do_deq = canPrefetch & T17;
  assign T17 = empty ^ 1'h1;
  assign empty = ptr_match & T18;
  assign T18 = maybe_full ^ 1'h1;
  assign T39 = reset ? 1'h0 : T19;
  assign T19 = T20 ? do_enq : maybe_full;
  assign T20 = do_enq != do_deq;
  assign ptr_match = R11 == R14;
  assign canPrefetch = FPGAQueue_io_count < 2'h2;
  assign T21 = DualPortBRAM_b_dout[1:0];
  assign T22 = DualPortBRAM_b_dout[2];
  assign T23 = DualPortBRAM_b_dout[5:3];
  assign T24 = DualPortBRAM_b_dout[14:6];
  assign T25 = DualPortBRAM_b_dout[15];
  assign T26 = DualPortBRAM_b_dout[31:16];
  assign T27 = DualPortBRAM_b_dout[63:32];
  assign T28 = DualPortBRAM_b_dout[79:64];
  assign T29 = DualPortBRAM_b_dout[103:80];
  assign T30 = DualPortBRAM_b_dout[111:104];
  assign T31 = DualPortBRAM_b_dout[127:112];
  assign T40 = reset ? 1'h0 : do_deq;
  assign io_count = T33;
  assign T33 = T34 + T41;
  assign T41 = {8'h0, FPGAQueue_io_count};
  assign T34 = {T35, ptr_diff};
  assign ptr_diff = R11 - R14;
  assign T35 = maybe_full & ptr_match;
  assign io_deq_bits_targetStage = FPGAQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = FPGAQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = FPGAQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_bram_id_start = FPGAQueue_io_deq_bits_runcfg_bram_id_start;
  assign io_deq_bits_runcfg_bram_id_range = FPGAQueue_io_deq_bits_runcfg_bram_id_range;
  assign io_deq_bits_runcfg_bram_addr_base = FPGAQueue_io_deq_bits_runcfg_bram_addr_base;
  assign io_deq_bits_runcfg_dram_base = FPGAQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_block_size_bytes = FPGAQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  assign io_deq_bits_runcfg_dram_block_offset_bytes = FPGAQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  assign io_deq_bits_runcfg_dram_block_count = FPGAQueue_io_deq_bits_runcfg_dram_block_count;
  assign io_deq_bits_runcfg_tiles_per_row = FPGAQueue_io_deq_bits_runcfg_tiles_per_row;
  assign io_deq_valid = FPGAQueue_io_deq_valid;
  assign io_enq_ready = T36;
  assign T36 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;
  FPGAQueue_10 FPGAQueue(.clk(clk), .reset(reset),
       //.io_enq_ready(  )
       .io_enq_valid( R32 ),
       .io_enq_bits_runcfg_tiles_per_row( T31 ),
       .io_enq_bits_runcfg_dram_block_count( T30 ),
       .io_enq_bits_runcfg_dram_block_offset_bytes( T29 ),
       .io_enq_bits_runcfg_dram_block_size_bytes( T28 ),
       .io_enq_bits_runcfg_dram_base( T27 ),
       .io_enq_bits_runcfg_bram_addr_base( T26 ),
       .io_enq_bits_runcfg_bram_id_range( T25 ),
       .io_enq_bits_runcfg_bram_id_start( T24 ),
       .io_enq_bits_unused( T23 ),
       .io_enq_bits_isRunCfg( T22 ),
       .io_enq_bits_targetStage( T21 ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits_runcfg_tiles_per_row( FPGAQueue_io_deq_bits_runcfg_tiles_per_row ),
       .io_deq_bits_runcfg_dram_block_count( FPGAQueue_io_deq_bits_runcfg_dram_block_count ),
       .io_deq_bits_runcfg_dram_block_offset_bytes( FPGAQueue_io_deq_bits_runcfg_dram_block_offset_bytes ),
       .io_deq_bits_runcfg_dram_block_size_bytes( FPGAQueue_io_deq_bits_runcfg_dram_block_size_bytes ),
       .io_deq_bits_runcfg_dram_base( FPGAQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_bram_addr_base( FPGAQueue_io_deq_bits_runcfg_bram_addr_base ),
       .io_deq_bits_runcfg_bram_id_range( FPGAQueue_io_deq_bits_runcfg_bram_id_range ),
       .io_deq_bits_runcfg_bram_id_start( FPGAQueue_io_deq_bits_runcfg_bram_id_start ),
       .io_deq_bits_unused( FPGAQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_io_count )
  );
  DualPortBRAM # (
    .DATA(128),
    .ADDR(9)
  ) DualPortBRAM(.clk(clk),
       .b_addr( R14 ),
       .b_din( 128'h0 ),
       .b_wr( 1'h0 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( R11 ),
       .a_din( T0 ),
       .a_wr( do_enq )
       //.a_dout(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      R11 <= 9'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if(reset) begin
      R14 <= 9'h0;
    end else if(do_deq) begin
      R14 <= T16;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T20) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R32 <= 1'h0;
    end else begin
      R32 <= do_deq;
    end
  end
endmodule

module FPGAQueue_14(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_tiles_per_row,
    input [7:0] io_enq_bits_runcfg_dram_block_count,
    input [23:0] io_enq_bits_runcfg_dram_block_offset_bytes,
    input [15:0] io_enq_bits_runcfg_dram_block_size_bytes,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input [15:0] io_enq_bits_runcfg_bram_addr_base,
    input  io_enq_bits_runcfg_bram_id_range,
    input [8:0] io_enq_bits_runcfg_bram_id_start,
    input [2:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_tiles_per_row,
    output[7:0] io_deq_bits_runcfg_dram_block_count,
    output[23:0] io_deq_bits_runcfg_dram_block_offset_bytes,
    output[15:0] io_deq_bits_runcfg_dram_block_size_bytes,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output[15:0] io_deq_bits_runcfg_bram_addr_base,
    output io_deq_bits_runcfg_bram_id_range,
    output[8:0] io_deq_bits_runcfg_bram_id_start,
    output[2:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire BRAMQueue_io_enq_ready;
  wire BRAMQueue_io_deq_valid;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_tiles_per_row;
  wire[7:0] BRAMQueue_io_deq_bits_runcfg_dram_block_count;
  wire[23:0] BRAMQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  wire[31:0] BRAMQueue_io_deq_bits_runcfg_dram_base;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_bram_addr_base;
  wire BRAMQueue_io_deq_bits_runcfg_bram_id_range;
  wire[8:0] BRAMQueue_io_deq_bits_runcfg_bram_id_start;
  wire[2:0] BRAMQueue_io_deq_bits_unused;
  wire BRAMQueue_io_deq_bits_isRunCfg;
  wire[1:0] BRAMQueue_io_deq_bits_targetStage;
  wire[9:0] BRAMQueue_io_count;


  assign io_count = BRAMQueue_io_count;
  assign io_deq_bits_targetStage = BRAMQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = BRAMQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = BRAMQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_bram_id_start = BRAMQueue_io_deq_bits_runcfg_bram_id_start;
  assign io_deq_bits_runcfg_bram_id_range = BRAMQueue_io_deq_bits_runcfg_bram_id_range;
  assign io_deq_bits_runcfg_bram_addr_base = BRAMQueue_io_deq_bits_runcfg_bram_addr_base;
  assign io_deq_bits_runcfg_dram_base = BRAMQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_block_size_bytes = BRAMQueue_io_deq_bits_runcfg_dram_block_size_bytes;
  assign io_deq_bits_runcfg_dram_block_offset_bytes = BRAMQueue_io_deq_bits_runcfg_dram_block_offset_bytes;
  assign io_deq_bits_runcfg_dram_block_count = BRAMQueue_io_deq_bits_runcfg_dram_block_count;
  assign io_deq_bits_runcfg_tiles_per_row = BRAMQueue_io_deq_bits_runcfg_tiles_per_row;
  assign io_deq_valid = BRAMQueue_io_deq_valid;
  assign io_enq_ready = BRAMQueue_io_enq_ready;
  BRAMQueue_0 BRAMQueue(.clk(clk), .reset(reset),
       .io_enq_ready( BRAMQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_tiles_per_row( io_enq_bits_runcfg_tiles_per_row ),
       .io_enq_bits_runcfg_dram_block_count( io_enq_bits_runcfg_dram_block_count ),
       .io_enq_bits_runcfg_dram_block_offset_bytes( io_enq_bits_runcfg_dram_block_offset_bytes ),
       .io_enq_bits_runcfg_dram_block_size_bytes( io_enq_bits_runcfg_dram_block_size_bytes ),
       .io_enq_bits_runcfg_dram_base( io_enq_bits_runcfg_dram_base ),
       .io_enq_bits_runcfg_bram_addr_base( io_enq_bits_runcfg_bram_addr_base ),
       .io_enq_bits_runcfg_bram_id_range( io_enq_bits_runcfg_bram_id_range ),
       .io_enq_bits_runcfg_bram_id_start( io_enq_bits_runcfg_bram_id_start ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( BRAMQueue_io_deq_valid ),
       .io_deq_bits_runcfg_tiles_per_row( BRAMQueue_io_deq_bits_runcfg_tiles_per_row ),
       .io_deq_bits_runcfg_dram_block_count( BRAMQueue_io_deq_bits_runcfg_dram_block_count ),
       .io_deq_bits_runcfg_dram_block_offset_bytes( BRAMQueue_io_deq_bits_runcfg_dram_block_offset_bytes ),
       .io_deq_bits_runcfg_dram_block_size_bytes( BRAMQueue_io_deq_bits_runcfg_dram_block_size_bytes ),
       .io_deq_bits_runcfg_dram_base( BRAMQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_bram_addr_base( BRAMQueue_io_deq_bits_runcfg_bram_addr_base ),
       .io_deq_bits_runcfg_bram_id_range( BRAMQueue_io_deq_bits_runcfg_bram_id_range ),
       .io_deq_bits_runcfg_bram_id_start( BRAMQueue_io_deq_bits_runcfg_bram_id_start ),
       .io_deq_bits_unused( BRAMQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( BRAMQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( BRAMQueue_io_deq_bits_targetStage ),
       .io_count( BRAMQueue_io_count )
  );
endmodule

module SRLQueue_11(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_runcfg_writeAddr,
    input  io_enq_bits_runcfg_writeEn,
    input  io_enq_bits_runcfg_clear_before_first_accumulation,
    input  io_enq_bits_runcfg_negate,
    input  io_enq_bits_runcfg_shiftAmount,
    input [15:0] io_enq_bits_runcfg_numTiles,
    input [15:0] io_enq_bits_runcfg_rhsOffset,
    input [15:0] io_enq_bits_runcfg_lhsOffset,
    input [67:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_runcfg_writeAddr,
    output io_deq_bits_runcfg_writeEn,
    output io_deq_bits_runcfg_clear_before_first_accumulation,
    output io_deq_bits_runcfg_negate,
    output io_deq_bits_runcfg_shiftAmount,
    output[15:0] io_deq_bits_runcfg_numTiles,
    output[15:0] io_deq_bits_runcfg_rhsOffset,
    output[15:0] io_deq_bits_runcfg_lhsOffset,
    output[67:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire T0;
  wire[123:0] T1;
  wire[123:0] T2;
  wire[118:0] T3;
  wire[70:0] T4;
  wire[2:0] T5;
  wire[47:0] T6;
  wire[31:0] T7;
  wire[4:0] T8;
  wire[2:0] T9;
  wire[1:0] T10;
  wire[1:0] T11;
  wire[1:0] T12;
  wire T13;
  wire[67:0] T14;
  wire[15:0] T15;
  wire[15:0] T16;
  wire[15:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[123:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {T8, T3};
  assign T3 = {T6, T4};
  assign T4 = {io_enq_bits_unused, T5};
  assign T5 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T6 = {io_enq_bits_runcfg_numTiles, T7};
  assign T7 = {io_enq_bits_runcfg_rhsOffset, io_enq_bits_runcfg_lhsOffset};
  assign T8 = {T11, T9};
  assign T9 = {io_enq_bits_runcfg_clear_before_first_accumulation, T10};
  assign T10 = {io_enq_bits_runcfg_negate, io_enq_bits_runcfg_shiftAmount};
  assign T11 = {io_enq_bits_runcfg_writeAddr, io_enq_bits_runcfg_writeEn};
  assign io_count = Q_srl_count;
  assign io_deq_bits_targetStage = T12;
  assign T12 = Q_srl_o_d[1:0];
  assign io_deq_bits_isRunCfg = T13;
  assign T13 = Q_srl_o_d[2];
  assign io_deq_bits_unused = T14;
  assign T14 = Q_srl_o_d[70:3];
  assign io_deq_bits_runcfg_lhsOffset = T15;
  assign T15 = Q_srl_o_d[86:71];
  assign io_deq_bits_runcfg_rhsOffset = T16;
  assign T16 = Q_srl_o_d[102:87];
  assign io_deq_bits_runcfg_numTiles = T17;
  assign T17 = Q_srl_o_d[118:103];
  assign io_deq_bits_runcfg_shiftAmount = T18;
  assign T18 = Q_srl_o_d[119];
  assign io_deq_bits_runcfg_negate = T19;
  assign T19 = Q_srl_o_d[120];
  assign io_deq_bits_runcfg_clear_before_first_accumulation = T20;
  assign T20 = Q_srl_o_d[121];
  assign io_deq_bits_runcfg_writeEn = T21;
  assign T21 = Q_srl_o_d[122];
  assign io_deq_bits_runcfg_writeAddr = T22;
  assign T22 = Q_srl_o_d[123];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T23;
  assign T23 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(3),
    .width(124)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_11(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_runcfg_writeAddr,
    input  io_enq_bits_runcfg_writeEn,
    input  io_enq_bits_runcfg_clear_before_first_accumulation,
    input  io_enq_bits_runcfg_negate,
    input  io_enq_bits_runcfg_shiftAmount,
    input [15:0] io_enq_bits_runcfg_numTiles,
    input [15:0] io_enq_bits_runcfg_rhsOffset,
    input [15:0] io_enq_bits_runcfg_lhsOffset,
    input [67:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_runcfg_writeAddr,
    output io_deq_bits_runcfg_writeEn,
    output io_deq_bits_runcfg_clear_before_first_accumulation,
    output io_deq_bits_runcfg_negate,
    output io_deq_bits_runcfg_shiftAmount,
    output[15:0] io_deq_bits_runcfg_numTiles,
    output[15:0] io_deq_bits_runcfg_rhsOffset,
    output[15:0] io_deq_bits_runcfg_lhsOffset,
    output[67:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire SRLQueue_io_deq_bits_runcfg_writeAddr;
  wire SRLQueue_io_deq_bits_runcfg_writeEn;
  wire SRLQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  wire SRLQueue_io_deq_bits_runcfg_negate;
  wire SRLQueue_io_deq_bits_runcfg_shiftAmount;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_numTiles;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_rhsOffset;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_lhsOffset;
  wire[67:0] SRLQueue_io_deq_bits_unused;
  wire SRLQueue_io_deq_bits_isRunCfg;
  wire[1:0] SRLQueue_io_deq_bits_targetStage;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_targetStage = SRLQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = SRLQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = SRLQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_lhsOffset = SRLQueue_io_deq_bits_runcfg_lhsOffset;
  assign io_deq_bits_runcfg_rhsOffset = SRLQueue_io_deq_bits_runcfg_rhsOffset;
  assign io_deq_bits_runcfg_numTiles = SRLQueue_io_deq_bits_runcfg_numTiles;
  assign io_deq_bits_runcfg_shiftAmount = SRLQueue_io_deq_bits_runcfg_shiftAmount;
  assign io_deq_bits_runcfg_negate = SRLQueue_io_deq_bits_runcfg_negate;
  assign io_deq_bits_runcfg_clear_before_first_accumulation = SRLQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  assign io_deq_bits_runcfg_writeEn = SRLQueue_io_deq_bits_runcfg_writeEn;
  assign io_deq_bits_runcfg_writeAddr = SRLQueue_io_deq_bits_runcfg_writeAddr;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_11 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_writeAddr( io_enq_bits_runcfg_writeAddr ),
       .io_enq_bits_runcfg_writeEn( io_enq_bits_runcfg_writeEn ),
       .io_enq_bits_runcfg_clear_before_first_accumulation( io_enq_bits_runcfg_clear_before_first_accumulation ),
       .io_enq_bits_runcfg_negate( io_enq_bits_runcfg_negate ),
       .io_enq_bits_runcfg_shiftAmount( io_enq_bits_runcfg_shiftAmount ),
       .io_enq_bits_runcfg_numTiles( io_enq_bits_runcfg_numTiles ),
       .io_enq_bits_runcfg_rhsOffset( io_enq_bits_runcfg_rhsOffset ),
       .io_enq_bits_runcfg_lhsOffset( io_enq_bits_runcfg_lhsOffset ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_runcfg_writeAddr( SRLQueue_io_deq_bits_runcfg_writeAddr ),
       .io_deq_bits_runcfg_writeEn( SRLQueue_io_deq_bits_runcfg_writeEn ),
       .io_deq_bits_runcfg_clear_before_first_accumulation( SRLQueue_io_deq_bits_runcfg_clear_before_first_accumulation ),
       .io_deq_bits_runcfg_negate( SRLQueue_io_deq_bits_runcfg_negate ),
       .io_deq_bits_runcfg_shiftAmount( SRLQueue_io_deq_bits_runcfg_shiftAmount ),
       .io_deq_bits_runcfg_numTiles( SRLQueue_io_deq_bits_runcfg_numTiles ),
       .io_deq_bits_runcfg_rhsOffset( SRLQueue_io_deq_bits_runcfg_rhsOffset ),
       .io_deq_bits_runcfg_lhsOffset( SRLQueue_io_deq_bits_runcfg_lhsOffset ),
       .io_deq_bits_unused( SRLQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( SRLQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( SRLQueue_io_deq_bits_targetStage ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module BRAMQueue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_runcfg_writeAddr,
    input  io_enq_bits_runcfg_writeEn,
    input  io_enq_bits_runcfg_clear_before_first_accumulation,
    input  io_enq_bits_runcfg_negate,
    input  io_enq_bits_runcfg_shiftAmount,
    input [15:0] io_enq_bits_runcfg_numTiles,
    input [15:0] io_enq_bits_runcfg_rhsOffset,
    input [15:0] io_enq_bits_runcfg_lhsOffset,
    input [67:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_runcfg_writeAddr,
    output io_deq_bits_runcfg_writeEn,
    output io_deq_bits_runcfg_clear_before_first_accumulation,
    output io_deq_bits_runcfg_negate,
    output io_deq_bits_runcfg_shiftAmount,
    output[15:0] io_deq_bits_runcfg_numTiles,
    output[15:0] io_deq_bits_runcfg_rhsOffset,
    output[15:0] io_deq_bits_runcfg_lhsOffset,
    output[67:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire do_enq;
  wire[123:0] T0;
  wire[123:0] T1;
  wire[118:0] T2;
  wire[70:0] T3;
  wire[2:0] T4;
  wire[47:0] T5;
  wire[31:0] T6;
  wire[4:0] T7;
  wire[2:0] T8;
  wire[1:0] T9;
  wire[1:0] T10;
  reg [8:0] R11;
  wire[8:0] T37;
  wire[8:0] T12;
  wire[8:0] T13;
  reg [8:0] R14;
  wire[8:0] T38;
  wire[8:0] T15;
  wire[8:0] T16;
  wire do_deq;
  wire T17;
  wire empty;
  wire T18;
  reg  maybe_full;
  wire T39;
  wire T19;
  wire T20;
  wire ptr_match;
  wire canPrefetch;
  wire[1:0] T21;
  wire T22;
  wire[67:0] T23;
  wire[15:0] T24;
  wire[15:0] T25;
  wire[15:0] T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  reg  R32;
  wire T40;
  wire[9:0] T33;
  wire[9:0] T41;
  wire[9:0] T34;
  wire[8:0] ptr_diff;
  wire T35;
  wire T36;
  wire full;
  wire[123:0] DualPortBRAM_b_dout;
  wire FPGAQueue_io_deq_valid;
  wire FPGAQueue_io_deq_bits_runcfg_writeAddr;
  wire FPGAQueue_io_deq_bits_runcfg_writeEn;
  wire FPGAQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  wire FPGAQueue_io_deq_bits_runcfg_negate;
  wire FPGAQueue_io_deq_bits_runcfg_shiftAmount;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_numTiles;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_rhsOffset;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_lhsOffset;
  wire[67:0] FPGAQueue_io_deq_bits_unused;
  wire FPGAQueue_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_io_deq_bits_targetStage;
  wire[1:0] FPGAQueue_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R11 = {1{$random}};
    R14 = {1{$random}};
    maybe_full = {1{$random}};
    R32 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign do_enq = io_enq_ready & io_enq_valid;
  assign T0 = T1;
  assign T1 = {T7, T2};
  assign T2 = {T5, T3};
  assign T3 = {io_enq_bits_unused, T4};
  assign T4 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T5 = {io_enq_bits_runcfg_numTiles, T6};
  assign T6 = {io_enq_bits_runcfg_rhsOffset, io_enq_bits_runcfg_lhsOffset};
  assign T7 = {T10, T8};
  assign T8 = {io_enq_bits_runcfg_clear_before_first_accumulation, T9};
  assign T9 = {io_enq_bits_runcfg_negate, io_enq_bits_runcfg_shiftAmount};
  assign T10 = {io_enq_bits_runcfg_writeAddr, io_enq_bits_runcfg_writeEn};
  assign T37 = reset ? 9'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 9'h1;
  assign T38 = reset ? 9'h0 : T15;
  assign T15 = do_deq ? T16 : R14;
  assign T16 = R14 + 9'h1;
  assign do_deq = canPrefetch & T17;
  assign T17 = empty ^ 1'h1;
  assign empty = ptr_match & T18;
  assign T18 = maybe_full ^ 1'h1;
  assign T39 = reset ? 1'h0 : T19;
  assign T19 = T20 ? do_enq : maybe_full;
  assign T20 = do_enq != do_deq;
  assign ptr_match = R11 == R14;
  assign canPrefetch = FPGAQueue_io_count < 2'h2;
  assign T21 = DualPortBRAM_b_dout[1:0];
  assign T22 = DualPortBRAM_b_dout[2];
  assign T23 = DualPortBRAM_b_dout[70:3];
  assign T24 = DualPortBRAM_b_dout[86:71];
  assign T25 = DualPortBRAM_b_dout[102:87];
  assign T26 = DualPortBRAM_b_dout[118:103];
  assign T27 = DualPortBRAM_b_dout[119];
  assign T28 = DualPortBRAM_b_dout[120];
  assign T29 = DualPortBRAM_b_dout[121];
  assign T30 = DualPortBRAM_b_dout[122];
  assign T31 = DualPortBRAM_b_dout[123];
  assign T40 = reset ? 1'h0 : do_deq;
  assign io_count = T33;
  assign T33 = T34 + T41;
  assign T41 = {8'h0, FPGAQueue_io_count};
  assign T34 = {T35, ptr_diff};
  assign ptr_diff = R11 - R14;
  assign T35 = maybe_full & ptr_match;
  assign io_deq_bits_targetStage = FPGAQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = FPGAQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = FPGAQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_lhsOffset = FPGAQueue_io_deq_bits_runcfg_lhsOffset;
  assign io_deq_bits_runcfg_rhsOffset = FPGAQueue_io_deq_bits_runcfg_rhsOffset;
  assign io_deq_bits_runcfg_numTiles = FPGAQueue_io_deq_bits_runcfg_numTiles;
  assign io_deq_bits_runcfg_shiftAmount = FPGAQueue_io_deq_bits_runcfg_shiftAmount;
  assign io_deq_bits_runcfg_negate = FPGAQueue_io_deq_bits_runcfg_negate;
  assign io_deq_bits_runcfg_clear_before_first_accumulation = FPGAQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  assign io_deq_bits_runcfg_writeEn = FPGAQueue_io_deq_bits_runcfg_writeEn;
  assign io_deq_bits_runcfg_writeAddr = FPGAQueue_io_deq_bits_runcfg_writeAddr;
  assign io_deq_valid = FPGAQueue_io_deq_valid;
  assign io_enq_ready = T36;
  assign T36 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;
  FPGAQueue_11 FPGAQueue(.clk(clk), .reset(reset),
       //.io_enq_ready(  )
       .io_enq_valid( R32 ),
       .io_enq_bits_runcfg_writeAddr( T31 ),
       .io_enq_bits_runcfg_writeEn( T30 ),
       .io_enq_bits_runcfg_clear_before_first_accumulation( T29 ),
       .io_enq_bits_runcfg_negate( T28 ),
       .io_enq_bits_runcfg_shiftAmount( T27 ),
       .io_enq_bits_runcfg_numTiles( T26 ),
       .io_enq_bits_runcfg_rhsOffset( T25 ),
       .io_enq_bits_runcfg_lhsOffset( T24 ),
       .io_enq_bits_unused( T23 ),
       .io_enq_bits_isRunCfg( T22 ),
       .io_enq_bits_targetStage( T21 ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits_runcfg_writeAddr( FPGAQueue_io_deq_bits_runcfg_writeAddr ),
       .io_deq_bits_runcfg_writeEn( FPGAQueue_io_deq_bits_runcfg_writeEn ),
       .io_deq_bits_runcfg_clear_before_first_accumulation( FPGAQueue_io_deq_bits_runcfg_clear_before_first_accumulation ),
       .io_deq_bits_runcfg_negate( FPGAQueue_io_deq_bits_runcfg_negate ),
       .io_deq_bits_runcfg_shiftAmount( FPGAQueue_io_deq_bits_runcfg_shiftAmount ),
       .io_deq_bits_runcfg_numTiles( FPGAQueue_io_deq_bits_runcfg_numTiles ),
       .io_deq_bits_runcfg_rhsOffset( FPGAQueue_io_deq_bits_runcfg_rhsOffset ),
       .io_deq_bits_runcfg_lhsOffset( FPGAQueue_io_deq_bits_runcfg_lhsOffset ),
       .io_deq_bits_unused( FPGAQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_io_count )
  );
  DualPortBRAM # (
    .DATA(124),
    .ADDR(9)
  ) DualPortBRAM(.clk(clk),
       .b_addr( R14 ),
       .b_din( 124'h0 ),
       .b_wr( 1'h0 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( R11 ),
       .a_din( T0 ),
       .a_wr( do_enq )
       //.a_dout(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      R11 <= 9'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if(reset) begin
      R14 <= 9'h0;
    end else if(do_deq) begin
      R14 <= T16;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T20) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R32 <= 1'h0;
    end else begin
      R32 <= do_deq;
    end
  end
endmodule

module FPGAQueue_15(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_runcfg_writeAddr,
    input  io_enq_bits_runcfg_writeEn,
    input  io_enq_bits_runcfg_clear_before_first_accumulation,
    input  io_enq_bits_runcfg_negate,
    input  io_enq_bits_runcfg_shiftAmount,
    input [15:0] io_enq_bits_runcfg_numTiles,
    input [15:0] io_enq_bits_runcfg_rhsOffset,
    input [15:0] io_enq_bits_runcfg_lhsOffset,
    input [67:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_runcfg_writeAddr,
    output io_deq_bits_runcfg_writeEn,
    output io_deq_bits_runcfg_clear_before_first_accumulation,
    output io_deq_bits_runcfg_negate,
    output io_deq_bits_runcfg_shiftAmount,
    output[15:0] io_deq_bits_runcfg_numTiles,
    output[15:0] io_deq_bits_runcfg_rhsOffset,
    output[15:0] io_deq_bits_runcfg_lhsOffset,
    output[67:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire BRAMQueue_io_enq_ready;
  wire BRAMQueue_io_deq_valid;
  wire BRAMQueue_io_deq_bits_runcfg_writeAddr;
  wire BRAMQueue_io_deq_bits_runcfg_writeEn;
  wire BRAMQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  wire BRAMQueue_io_deq_bits_runcfg_negate;
  wire BRAMQueue_io_deq_bits_runcfg_shiftAmount;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_numTiles;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_rhsOffset;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_lhsOffset;
  wire[67:0] BRAMQueue_io_deq_bits_unused;
  wire BRAMQueue_io_deq_bits_isRunCfg;
  wire[1:0] BRAMQueue_io_deq_bits_targetStage;
  wire[9:0] BRAMQueue_io_count;


  assign io_count = BRAMQueue_io_count;
  assign io_deq_bits_targetStage = BRAMQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = BRAMQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = BRAMQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_lhsOffset = BRAMQueue_io_deq_bits_runcfg_lhsOffset;
  assign io_deq_bits_runcfg_rhsOffset = BRAMQueue_io_deq_bits_runcfg_rhsOffset;
  assign io_deq_bits_runcfg_numTiles = BRAMQueue_io_deq_bits_runcfg_numTiles;
  assign io_deq_bits_runcfg_shiftAmount = BRAMQueue_io_deq_bits_runcfg_shiftAmount;
  assign io_deq_bits_runcfg_negate = BRAMQueue_io_deq_bits_runcfg_negate;
  assign io_deq_bits_runcfg_clear_before_first_accumulation = BRAMQueue_io_deq_bits_runcfg_clear_before_first_accumulation;
  assign io_deq_bits_runcfg_writeEn = BRAMQueue_io_deq_bits_runcfg_writeEn;
  assign io_deq_bits_runcfg_writeAddr = BRAMQueue_io_deq_bits_runcfg_writeAddr;
  assign io_deq_valid = BRAMQueue_io_deq_valid;
  assign io_enq_ready = BRAMQueue_io_enq_ready;
  BRAMQueue_1 BRAMQueue(.clk(clk), .reset(reset),
       .io_enq_ready( BRAMQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_writeAddr( io_enq_bits_runcfg_writeAddr ),
       .io_enq_bits_runcfg_writeEn( io_enq_bits_runcfg_writeEn ),
       .io_enq_bits_runcfg_clear_before_first_accumulation( io_enq_bits_runcfg_clear_before_first_accumulation ),
       .io_enq_bits_runcfg_negate( io_enq_bits_runcfg_negate ),
       .io_enq_bits_runcfg_shiftAmount( io_enq_bits_runcfg_shiftAmount ),
       .io_enq_bits_runcfg_numTiles( io_enq_bits_runcfg_numTiles ),
       .io_enq_bits_runcfg_rhsOffset( io_enq_bits_runcfg_rhsOffset ),
       .io_enq_bits_runcfg_lhsOffset( io_enq_bits_runcfg_lhsOffset ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( BRAMQueue_io_deq_valid ),
       .io_deq_bits_runcfg_writeAddr( BRAMQueue_io_deq_bits_runcfg_writeAddr ),
       .io_deq_bits_runcfg_writeEn( BRAMQueue_io_deq_bits_runcfg_writeEn ),
       .io_deq_bits_runcfg_clear_before_first_accumulation( BRAMQueue_io_deq_bits_runcfg_clear_before_first_accumulation ),
       .io_deq_bits_runcfg_negate( BRAMQueue_io_deq_bits_runcfg_negate ),
       .io_deq_bits_runcfg_shiftAmount( BRAMQueue_io_deq_bits_runcfg_shiftAmount ),
       .io_deq_bits_runcfg_numTiles( BRAMQueue_io_deq_bits_runcfg_numTiles ),
       .io_deq_bits_runcfg_rhsOffset( BRAMQueue_io_deq_bits_runcfg_rhsOffset ),
       .io_deq_bits_runcfg_lhsOffset( BRAMQueue_io_deq_bits_runcfg_lhsOffset ),
       .io_deq_bits_unused( BRAMQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( BRAMQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( BRAMQueue_io_deq_bits_targetStage ),
       .io_count( BRAMQueue_io_count )
  );
endmodule

module SRLQueue_12(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_waitCompleteBytes,
    input [15:0] io_enq_bits_runcfg_dram_skip,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input  io_enq_bits_runcfg_resmem_addr,
    input  io_enq_bits_runcfg_nop,
    input [58:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_waitCompleteBytes,
    output[15:0] io_deq_bits_runcfg_dram_skip,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output io_deq_bits_runcfg_resmem_addr,
    output io_deq_bits_runcfg_nop,
    output[58:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire T0;
  wire[127:0] T1;
  wire[127:0] T2;
  wire[62:0] T3;
  wire[2:0] T4;
  wire[59:0] T5;
  wire[64:0] T6;
  wire[32:0] T7;
  wire[31:0] T8;
  wire[1:0] T9;
  wire T10;
  wire[58:0] T11;
  wire T12;
  wire T13;
  wire[31:0] T14;
  wire[15:0] T15;
  wire[15:0] T16;
  wire T17;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[127:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {T6, T3};
  assign T3 = {T5, T4};
  assign T4 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T5 = {io_enq_bits_runcfg_nop, io_enq_bits_unused};
  assign T6 = {T8, T7};
  assign T7 = {io_enq_bits_runcfg_dram_base, io_enq_bits_runcfg_resmem_addr};
  assign T8 = {io_enq_bits_runcfg_waitCompleteBytes, io_enq_bits_runcfg_dram_skip};
  assign io_count = Q_srl_count;
  assign io_deq_bits_targetStage = T9;
  assign T9 = Q_srl_o_d[1:0];
  assign io_deq_bits_isRunCfg = T10;
  assign T10 = Q_srl_o_d[2];
  assign io_deq_bits_unused = T11;
  assign T11 = Q_srl_o_d[61:3];
  assign io_deq_bits_runcfg_nop = T12;
  assign T12 = Q_srl_o_d[62];
  assign io_deq_bits_runcfg_resmem_addr = T13;
  assign T13 = Q_srl_o_d[63];
  assign io_deq_bits_runcfg_dram_base = T14;
  assign T14 = Q_srl_o_d[95:64];
  assign io_deq_bits_runcfg_dram_skip = T15;
  assign T15 = Q_srl_o_d[111:96];
  assign io_deq_bits_runcfg_waitCompleteBytes = T16;
  assign T16 = Q_srl_o_d[127:112];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T17;
  assign T17 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(3),
    .width(128)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_12(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_waitCompleteBytes,
    input [15:0] io_enq_bits_runcfg_dram_skip,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input  io_enq_bits_runcfg_resmem_addr,
    input  io_enq_bits_runcfg_nop,
    input [58:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_waitCompleteBytes,
    output[15:0] io_deq_bits_runcfg_dram_skip,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output io_deq_bits_runcfg_resmem_addr,
    output io_deq_bits_runcfg_nop,
    output[58:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_waitCompleteBytes;
  wire[15:0] SRLQueue_io_deq_bits_runcfg_dram_skip;
  wire[31:0] SRLQueue_io_deq_bits_runcfg_dram_base;
  wire SRLQueue_io_deq_bits_runcfg_resmem_addr;
  wire SRLQueue_io_deq_bits_runcfg_nop;
  wire[58:0] SRLQueue_io_deq_bits_unused;
  wire SRLQueue_io_deq_bits_isRunCfg;
  wire[1:0] SRLQueue_io_deq_bits_targetStage;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_targetStage = SRLQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = SRLQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = SRLQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_nop = SRLQueue_io_deq_bits_runcfg_nop;
  assign io_deq_bits_runcfg_resmem_addr = SRLQueue_io_deq_bits_runcfg_resmem_addr;
  assign io_deq_bits_runcfg_dram_base = SRLQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_skip = SRLQueue_io_deq_bits_runcfg_dram_skip;
  assign io_deq_bits_runcfg_waitCompleteBytes = SRLQueue_io_deq_bits_runcfg_waitCompleteBytes;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_12 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_waitCompleteBytes( io_enq_bits_runcfg_waitCompleteBytes ),
       .io_enq_bits_runcfg_dram_skip( io_enq_bits_runcfg_dram_skip ),
       .io_enq_bits_runcfg_dram_base( io_enq_bits_runcfg_dram_base ),
       .io_enq_bits_runcfg_resmem_addr( io_enq_bits_runcfg_resmem_addr ),
       .io_enq_bits_runcfg_nop( io_enq_bits_runcfg_nop ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_runcfg_waitCompleteBytes( SRLQueue_io_deq_bits_runcfg_waitCompleteBytes ),
       .io_deq_bits_runcfg_dram_skip( SRLQueue_io_deq_bits_runcfg_dram_skip ),
       .io_deq_bits_runcfg_dram_base( SRLQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_resmem_addr( SRLQueue_io_deq_bits_runcfg_resmem_addr ),
       .io_deq_bits_runcfg_nop( SRLQueue_io_deq_bits_runcfg_nop ),
       .io_deq_bits_unused( SRLQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( SRLQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( SRLQueue_io_deq_bits_targetStage ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module BRAMQueue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_waitCompleteBytes,
    input [15:0] io_enq_bits_runcfg_dram_skip,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input  io_enq_bits_runcfg_resmem_addr,
    input  io_enq_bits_runcfg_nop,
    input [58:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_waitCompleteBytes,
    output[15:0] io_deq_bits_runcfg_dram_skip,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output io_deq_bits_runcfg_resmem_addr,
    output io_deq_bits_runcfg_nop,
    output[58:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire do_enq;
  wire[127:0] T0;
  wire[127:0] T1;
  wire[62:0] T2;
  wire[2:0] T3;
  wire[59:0] T4;
  wire[64:0] T5;
  wire[32:0] T6;
  wire[31:0] T7;
  reg [8:0] R8;
  wire[8:0] T31;
  wire[8:0] T9;
  wire[8:0] T10;
  reg [8:0] R11;
  wire[8:0] T32;
  wire[8:0] T12;
  wire[8:0] T13;
  wire do_deq;
  wire T14;
  wire empty;
  wire T15;
  reg  maybe_full;
  wire T33;
  wire T16;
  wire T17;
  wire ptr_match;
  wire canPrefetch;
  wire[1:0] T18;
  wire T19;
  wire[58:0] T20;
  wire T21;
  wire T22;
  wire[31:0] T23;
  wire[15:0] T24;
  wire[15:0] T25;
  reg  R26;
  wire T34;
  wire[9:0] T27;
  wire[9:0] T35;
  wire[9:0] T28;
  wire[8:0] ptr_diff;
  wire T29;
  wire T30;
  wire full;
  wire[127:0] DualPortBRAM_b_dout;
  wire FPGAQueue_io_deq_valid;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_waitCompleteBytes;
  wire[15:0] FPGAQueue_io_deq_bits_runcfg_dram_skip;
  wire[31:0] FPGAQueue_io_deq_bits_runcfg_dram_base;
  wire FPGAQueue_io_deq_bits_runcfg_resmem_addr;
  wire FPGAQueue_io_deq_bits_runcfg_nop;
  wire[58:0] FPGAQueue_io_deq_bits_unused;
  wire FPGAQueue_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_io_deq_bits_targetStage;
  wire[1:0] FPGAQueue_io_count;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R8 = {1{$random}};
    R11 = {1{$random}};
    maybe_full = {1{$random}};
    R26 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign do_enq = io_enq_ready & io_enq_valid;
  assign T0 = T1;
  assign T1 = {T5, T2};
  assign T2 = {T4, T3};
  assign T3 = {io_enq_bits_isRunCfg, io_enq_bits_targetStage};
  assign T4 = {io_enq_bits_runcfg_nop, io_enq_bits_unused};
  assign T5 = {T7, T6};
  assign T6 = {io_enq_bits_runcfg_dram_base, io_enq_bits_runcfg_resmem_addr};
  assign T7 = {io_enq_bits_runcfg_waitCompleteBytes, io_enq_bits_runcfg_dram_skip};
  assign T31 = reset ? 9'h0 : T9;
  assign T9 = do_enq ? T10 : R8;
  assign T10 = R8 + 9'h1;
  assign T32 = reset ? 9'h0 : T12;
  assign T12 = do_deq ? T13 : R11;
  assign T13 = R11 + 9'h1;
  assign do_deq = canPrefetch & T14;
  assign T14 = empty ^ 1'h1;
  assign empty = ptr_match & T15;
  assign T15 = maybe_full ^ 1'h1;
  assign T33 = reset ? 1'h0 : T16;
  assign T16 = T17 ? do_enq : maybe_full;
  assign T17 = do_enq != do_deq;
  assign ptr_match = R8 == R11;
  assign canPrefetch = FPGAQueue_io_count < 2'h2;
  assign T18 = DualPortBRAM_b_dout[1:0];
  assign T19 = DualPortBRAM_b_dout[2];
  assign T20 = DualPortBRAM_b_dout[61:3];
  assign T21 = DualPortBRAM_b_dout[62];
  assign T22 = DualPortBRAM_b_dout[63];
  assign T23 = DualPortBRAM_b_dout[95:64];
  assign T24 = DualPortBRAM_b_dout[111:96];
  assign T25 = DualPortBRAM_b_dout[127:112];
  assign T34 = reset ? 1'h0 : do_deq;
  assign io_count = T27;
  assign T27 = T28 + T35;
  assign T35 = {8'h0, FPGAQueue_io_count};
  assign T28 = {T29, ptr_diff};
  assign ptr_diff = R8 - R11;
  assign T29 = maybe_full & ptr_match;
  assign io_deq_bits_targetStage = FPGAQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = FPGAQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = FPGAQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_nop = FPGAQueue_io_deq_bits_runcfg_nop;
  assign io_deq_bits_runcfg_resmem_addr = FPGAQueue_io_deq_bits_runcfg_resmem_addr;
  assign io_deq_bits_runcfg_dram_base = FPGAQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_skip = FPGAQueue_io_deq_bits_runcfg_dram_skip;
  assign io_deq_bits_runcfg_waitCompleteBytes = FPGAQueue_io_deq_bits_runcfg_waitCompleteBytes;
  assign io_deq_valid = FPGAQueue_io_deq_valid;
  assign io_enq_ready = T30;
  assign T30 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;
  FPGAQueue_12 FPGAQueue(.clk(clk), .reset(reset),
       //.io_enq_ready(  )
       .io_enq_valid( R26 ),
       .io_enq_bits_runcfg_waitCompleteBytes( T25 ),
       .io_enq_bits_runcfg_dram_skip( T24 ),
       .io_enq_bits_runcfg_dram_base( T23 ),
       .io_enq_bits_runcfg_resmem_addr( T22 ),
       .io_enq_bits_runcfg_nop( T21 ),
       .io_enq_bits_unused( T20 ),
       .io_enq_bits_isRunCfg( T19 ),
       .io_enq_bits_targetStage( T18 ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits_runcfg_waitCompleteBytes( FPGAQueue_io_deq_bits_runcfg_waitCompleteBytes ),
       .io_deq_bits_runcfg_dram_skip( FPGAQueue_io_deq_bits_runcfg_dram_skip ),
       .io_deq_bits_runcfg_dram_base( FPGAQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_resmem_addr( FPGAQueue_io_deq_bits_runcfg_resmem_addr ),
       .io_deq_bits_runcfg_nop( FPGAQueue_io_deq_bits_runcfg_nop ),
       .io_deq_bits_unused( FPGAQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_io_count )
  );
  DualPortBRAM # (
    .DATA(128),
    .ADDR(9)
  ) DualPortBRAM(.clk(clk),
       .b_addr( R11 ),
       .b_din( 128'h0 ),
       .b_wr( 1'h0 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( R8 ),
       .a_din( T0 ),
       .a_wr( do_enq )
       //.a_dout(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      R8 <= 9'h0;
    end else if(do_enq) begin
      R8 <= T10;
    end
    if(reset) begin
      R11 <= 9'h0;
    end else if(do_deq) begin
      R11 <= T13;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T17) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R26 <= 1'h0;
    end else begin
      R26 <= do_deq;
    end
  end
endmodule

module FPGAQueue_16(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [15:0] io_enq_bits_runcfg_waitCompleteBytes,
    input [15:0] io_enq_bits_runcfg_dram_skip,
    input [31:0] io_enq_bits_runcfg_dram_base,
    input  io_enq_bits_runcfg_resmem_addr,
    input  io_enq_bits_runcfg_nop,
    input [58:0] io_enq_bits_unused,
    input  io_enq_bits_isRunCfg,
    input [1:0] io_enq_bits_targetStage,
    input  io_deq_ready,
    output io_deq_valid,
    output[15:0] io_deq_bits_runcfg_waitCompleteBytes,
    output[15:0] io_deq_bits_runcfg_dram_skip,
    output[31:0] io_deq_bits_runcfg_dram_base,
    output io_deq_bits_runcfg_resmem_addr,
    output io_deq_bits_runcfg_nop,
    output[58:0] io_deq_bits_unused,
    output io_deq_bits_isRunCfg,
    output[1:0] io_deq_bits_targetStage,
    output[9:0] io_count
);

  wire BRAMQueue_io_enq_ready;
  wire BRAMQueue_io_deq_valid;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_waitCompleteBytes;
  wire[15:0] BRAMQueue_io_deq_bits_runcfg_dram_skip;
  wire[31:0] BRAMQueue_io_deq_bits_runcfg_dram_base;
  wire BRAMQueue_io_deq_bits_runcfg_resmem_addr;
  wire BRAMQueue_io_deq_bits_runcfg_nop;
  wire[58:0] BRAMQueue_io_deq_bits_unused;
  wire BRAMQueue_io_deq_bits_isRunCfg;
  wire[1:0] BRAMQueue_io_deq_bits_targetStage;
  wire[9:0] BRAMQueue_io_count;


  assign io_count = BRAMQueue_io_count;
  assign io_deq_bits_targetStage = BRAMQueue_io_deq_bits_targetStage;
  assign io_deq_bits_isRunCfg = BRAMQueue_io_deq_bits_isRunCfg;
  assign io_deq_bits_unused = BRAMQueue_io_deq_bits_unused;
  assign io_deq_bits_runcfg_nop = BRAMQueue_io_deq_bits_runcfg_nop;
  assign io_deq_bits_runcfg_resmem_addr = BRAMQueue_io_deq_bits_runcfg_resmem_addr;
  assign io_deq_bits_runcfg_dram_base = BRAMQueue_io_deq_bits_runcfg_dram_base;
  assign io_deq_bits_runcfg_dram_skip = BRAMQueue_io_deq_bits_runcfg_dram_skip;
  assign io_deq_bits_runcfg_waitCompleteBytes = BRAMQueue_io_deq_bits_runcfg_waitCompleteBytes;
  assign io_deq_valid = BRAMQueue_io_deq_valid;
  assign io_enq_ready = BRAMQueue_io_enq_ready;
  BRAMQueue_2 BRAMQueue(.clk(clk), .reset(reset),
       .io_enq_ready( BRAMQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_runcfg_waitCompleteBytes( io_enq_bits_runcfg_waitCompleteBytes ),
       .io_enq_bits_runcfg_dram_skip( io_enq_bits_runcfg_dram_skip ),
       .io_enq_bits_runcfg_dram_base( io_enq_bits_runcfg_dram_base ),
       .io_enq_bits_runcfg_resmem_addr( io_enq_bits_runcfg_resmem_addr ),
       .io_enq_bits_runcfg_nop( io_enq_bits_runcfg_nop ),
       .io_enq_bits_unused( io_enq_bits_unused ),
       .io_enq_bits_isRunCfg( io_enq_bits_isRunCfg ),
       .io_enq_bits_targetStage( io_enq_bits_targetStage ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( BRAMQueue_io_deq_valid ),
       .io_deq_bits_runcfg_waitCompleteBytes( BRAMQueue_io_deq_bits_runcfg_waitCompleteBytes ),
       .io_deq_bits_runcfg_dram_skip( BRAMQueue_io_deq_bits_runcfg_dram_skip ),
       .io_deq_bits_runcfg_dram_base( BRAMQueue_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_resmem_addr( BRAMQueue_io_deq_bits_runcfg_resmem_addr ),
       .io_deq_bits_runcfg_nop( BRAMQueue_io_deq_bits_runcfg_nop ),
       .io_deq_bits_unused( BRAMQueue_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( BRAMQueue_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( BRAMQueue_io_deq_bits_targetStage ),
       .io_count( BRAMQueue_io_count )
  );
endmodule

module PipelinedDualPortBRAM_1(input clk,
    input [9:0] b_addr,
    input [63:0] b_din,
    input  b_wr,
    output[63:0] b_dout,
    input [9:0] a_addr,
    input [63:0] a_din,
    input  a_wr,
    output[63:0] a_dout
);

  reg  R0;
  reg [63:0] R1;
  reg [9:0] R2;
  reg  R3;
  reg [63:0] R4;
  reg [9:0] R5;
  reg [63:0] R6;
  reg [63:0] R7;
  wire[63:0] DualPortBRAM_b_dout;
  wire[63:0] DualPortBRAM_a_dout;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R0 = {1{$random}};
    R1 = {2{$random}};
    R2 = {1{$random}};
    R3 = {1{$random}};
    R4 = {2{$random}};
    R5 = {1{$random}};
    R6 = {2{$random}};
    R7 = {2{$random}};
  end
// synthesis translate_on
`endif

  assign a_dout = R6;
  assign b_dout = R7;
  DualPortBRAM # (
    .DATA(64),
    .ADDR(10)
  ) DualPortBRAM(.clk(clk),
       .b_addr( R5 ),
       .b_din( R4 ),
       .b_wr( R3 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( R2 ),
       .a_din( R1 ),
       .a_wr( R0 ),
       .a_dout( DualPortBRAM_a_dout )
  );

  always @(posedge clk) begin
    R0 <= a_wr;
    R1 <= a_din;
    R2 <= a_addr;
    R3 <= b_wr;
    R4 <= b_din;
    R5 <= b_addr;
    R6 <= DualPortBRAM_a_dout;
    R7 <= DualPortBRAM_b_dout;
  end
endmodule

module AsymPipelinedDualPortBRAM(input clk,
    input [9:0] io_ports_1_req_addr,
    input [63:0] io_ports_1_req_writeData,
    input  io_ports_1_req_writeEn,
    output[63:0] io_ports_1_rsp_readData,
    input [9:0] io_ports_0_req_addr,
    input [63:0] io_ports_0_req_writeData,
    input  io_ports_0_req_writeEn,
    output[63:0] io_ports_0_rsp_readData
);

  wire[63:0] PipelinedDualPortBRAM_b_dout;
  wire[63:0] PipelinedDualPortBRAM_a_dout;


  assign io_ports_0_rsp_readData = PipelinedDualPortBRAM_a_dout;
  assign io_ports_1_rsp_readData = PipelinedDualPortBRAM_b_dout;
  PipelinedDualPortBRAM_1 PipelinedDualPortBRAM(.clk(clk),
       .b_addr( io_ports_1_req_addr ),
       .b_din( io_ports_1_req_writeData ),
       .b_wr( io_ports_1_req_writeEn ),
       .b_dout( PipelinedDualPortBRAM_b_dout ),
       .a_addr( io_ports_0_req_addr ),
       .a_din( io_ports_0_req_writeData ),
       .a_wr( io_ports_0_req_writeEn ),
       .a_dout( PipelinedDualPortBRAM_a_dout )
  );
endmodule

module DualPortBRAM_NoBlackBox(input clk,
    input  b_addr,
    input [31:0] b_din,
    input  b_wr,
    output[31:0] b_dout,
    input  a_addr,
    input [31:0] a_din,
    input  a_wr,
    output[31:0] a_dout
);

  wire[31:0] T0;
  reg [31:0] mem [1:0];
  wire[31:0] T1;
  wire[31:0] T2;
  reg  R3;
  wire[31:0] T4;
  reg  R5;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      mem[initvar] = {1{$random}};
    R3 = {1{$random}};
    R5 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign a_dout = T0;
  assign T0 = mem[R3];
  assign b_dout = T4;
  assign T4 = mem[R5];

  always @(posedge clk) begin
    if (b_wr)
      mem[b_addr] <= b_din;
    if (a_wr)
      mem[a_addr] <= a_din;
    R3 <= a_addr;
    R5 <= b_addr;
  end
endmodule

module PipelinedDualPortBRAM_0(input clk,
    input  b_addr,
    input [31:0] b_din,
    input  b_wr,
    output[31:0] b_dout,
    input  a_addr,
    input [31:0] a_din,
    input  a_wr,
    output[31:0] a_dout
);

  wire[31:0] DualPortBRAM_NoBlackBox_b_dout;
  wire[31:0] DualPortBRAM_NoBlackBox_a_dout;


  assign a_dout = DualPortBRAM_NoBlackBox_a_dout;
  assign b_dout = DualPortBRAM_NoBlackBox_b_dout;
  DualPortBRAM_NoBlackBox DualPortBRAM_NoBlackBox(.clk(clk),
       .b_addr( b_addr ),
       .b_din( b_din ),
       .b_wr( b_wr ),
       .b_dout( DualPortBRAM_NoBlackBox_b_dout ),
       .a_addr( a_addr ),
       .a_din( a_din ),
       .a_wr( a_wr ),
       .a_dout( DualPortBRAM_NoBlackBox_a_dout )
  );
endmodule

module SRLQueue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    output[3:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire Q_srl_o_d;
  wire[3:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(8),
    .width(1)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    output[3:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire SRLQueue_io_deq_bits;
  wire[3:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_0 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module StreamDeinterleaver(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [127:0] io_in_bits,
    input  io_out_2_ready,
    output io_out_2_valid,
    output[127:0] io_out_2_bits,
    input  io_out_1_ready,
    output io_out_1_valid,
    output[127:0] io_out_1_bits,
    input  io_out_0_ready,
    output io_out_0_valid,
    output[127:0] io_out_0_bits,
    output[31:0] io_decodeErrors
);

  reg [31:0] regDecodeErrors;
  wire[31:0] T17;
  wire[31:0] T0;
  wire[31:0] T1;
  wire invalidChannel;
  wire[1:0] destPipe;
  wire T2;
  wire T3;
  wire[3:0] T4;
  wire[1:0] T5;
  wire T6;
  wire canProceed;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regDecodeErrors = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_decodeErrors = regDecodeErrors;
  assign T17 = reset ? 32'h0 : T0;
  assign T0 = invalidChannel ? T1 : regDecodeErrors;
  assign T1 = regDecodeErrors + 32'h1;
  assign invalidChannel = 2'h3 <= destPipe;
  assign destPipe = io_in_bits[1:0];
  assign io_out_0_bits = io_in_bits;
  assign io_out_0_valid = T2;
  assign T2 = T6 & T3;
  assign T3 = T4[0];
  assign T4 = 1'h1 << T5;
  assign T5 = destPipe;
  assign T6 = T11 & canProceed;
  assign canProceed = io_in_valid & T7;
  assign T7 = T10 ? io_out_2_ready : T8;
  assign T8 = T9 ? io_out_1_ready : io_out_0_ready;
  assign T9 = T5[0];
  assign T10 = T5[1];
  assign T11 = invalidChannel ^ 1'h1;
  assign io_out_1_bits = io_in_bits;
  assign io_out_1_valid = T12;
  assign T12 = T6 & T13;
  assign T13 = T4[1];
  assign io_out_2_bits = io_in_bits;
  assign io_out_2_valid = T14;
  assign T14 = T6 & T15;
  assign T15 = T4[2];
  assign io_in_ready = T16;
  assign T16 = T6 ? 1'h1 : invalidChannel;

  always @(posedge clk) begin
    if(reset) begin
      regDecodeErrors <= 32'h0;
    end else if(invalidChannel) begin
      regDecodeErrors <= T1;
    end
  end
endmodule

module SRLQueue_5(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [127:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[127:0] io_deq_bits,
    output[1:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[127:0] Q_srl_o_d;
  wire[1:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(2),
    .width(128)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_5(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [127:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[127:0] io_deq_bits,
    output[1:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[127:0] SRLQueue_io_deq_bits;
  wire[1:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_5 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module StreamDeinterleaverQueued(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [127:0] io_in_bits,
    input  io_out_2_ready,
    output io_out_2_valid,
    output[127:0] io_out_2_bits,
    input  io_out_1_ready,
    output io_out_1_valid,
    output[127:0] io_out_1_bits,
    input  io_out_0_ready,
    output io_out_0_valid,
    output[127:0] io_out_0_bits,
    output[31:0] io_decodeErrors
);

  wire StreamDeinterleaver_io_in_ready;
  wire StreamDeinterleaver_io_out_2_valid;
  wire[127:0] StreamDeinterleaver_io_out_2_bits;
  wire StreamDeinterleaver_io_out_1_valid;
  wire[127:0] StreamDeinterleaver_io_out_1_bits;
  wire StreamDeinterleaver_io_out_0_valid;
  wire[127:0] StreamDeinterleaver_io_out_0_bits;
  wire[31:0] StreamDeinterleaver_io_decodeErrors;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[127:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[127:0] FPGAQueue_1_io_deq_bits;
  wire FPGAQueue_2_io_enq_ready;
  wire FPGAQueue_2_io_deq_valid;
  wire[127:0] FPGAQueue_2_io_deq_bits;
  wire FPGAQueue_3_io_enq_ready;
  wire FPGAQueue_3_io_deq_valid;
  wire[127:0] FPGAQueue_3_io_deq_bits;


  assign io_decodeErrors = StreamDeinterleaver_io_decodeErrors;
  assign io_out_0_bits = FPGAQueue_1_io_deq_bits;
  assign io_out_0_valid = FPGAQueue_1_io_deq_valid;
  assign io_out_1_bits = FPGAQueue_2_io_deq_bits;
  assign io_out_1_valid = FPGAQueue_2_io_deq_valid;
  assign io_out_2_bits = FPGAQueue_3_io_deq_bits;
  assign io_out_2_valid = FPGAQueue_3_io_deq_valid;
  assign io_in_ready = FPGAQueue_io_enq_ready;
  StreamDeinterleaver StreamDeinterleaver(.clk(clk), .reset(reset),
       .io_in_ready( StreamDeinterleaver_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits( FPGAQueue_io_deq_bits ),
       .io_out_2_ready( FPGAQueue_3_io_enq_ready ),
       .io_out_2_valid( StreamDeinterleaver_io_out_2_valid ),
       .io_out_2_bits( StreamDeinterleaver_io_out_2_bits ),
       .io_out_1_ready( FPGAQueue_2_io_enq_ready ),
       .io_out_1_valid( StreamDeinterleaver_io_out_1_valid ),
       .io_out_1_bits( StreamDeinterleaver_io_out_1_bits ),
       .io_out_0_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_0_valid( StreamDeinterleaver_io_out_0_valid ),
       .io_out_0_bits( StreamDeinterleaver_io_out_0_bits ),
       .io_decodeErrors( StreamDeinterleaver_io_decodeErrors )
  );
  FPGAQueue_5 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( StreamDeinterleaver_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_5 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( StreamDeinterleaver_io_out_0_valid ),
       .io_enq_bits( StreamDeinterleaver_io_out_0_bits ),
       .io_deq_ready( io_out_0_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits( FPGAQueue_1_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_5 FPGAQueue_2(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_2_io_enq_ready ),
       .io_enq_valid( StreamDeinterleaver_io_out_1_valid ),
       .io_enq_bits( StreamDeinterleaver_io_out_1_bits ),
       .io_deq_ready( io_out_1_ready ),
       .io_deq_valid( FPGAQueue_2_io_deq_valid ),
       .io_deq_bits( FPGAQueue_2_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_5 FPGAQueue_3(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_3_io_enq_ready ),
       .io_enq_valid( StreamDeinterleaver_io_out_2_valid ),
       .io_enq_bits( StreamDeinterleaver_io_out_2_bits ),
       .io_deq_ready( io_out_2_ready ),
       .io_deq_valid( FPGAQueue_3_io_deq_valid ),
       .io_deq_bits( FPGAQueue_3_io_deq_bits )
       //.io_count(  )
  );
endmodule

module SRLQueue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [207:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[207:0] io_deq_bits,
    output[2:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[207:0] Q_srl_o_d;
  wire[2:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(4),
    .width(208)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [207:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[207:0] io_deq_bits,
    output[2:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[207:0] SRLQueue_io_deq_bits;
  wire[2:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_1 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module DecoupledInputMux_0(
    input  io_sel,
    output io_in_1_ready,
    input  io_in_1_valid,
    input [127:0] io_in_1_bits,
    output io_in_0_ready,
    input  io_in_0_valid,
    input [127:0] io_in_0_bits,
    input  io_out_ready,
    output io_out_valid,
    output[127:0] io_out_bits
);

  wire[127:0] T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;


  assign io_out_bits = T0;
  assign T0 = T1 ? io_in_1_bits : io_in_0_bits;
  assign T1 = io_sel;
  assign io_out_valid = T2;
  assign T2 = T1 ? io_in_1_valid : io_in_0_valid;
  assign io_in_0_ready = T3;
  assign T3 = io_out_ready & T4;
  assign T4 = io_sel == 1'h0;
  assign io_in_1_ready = T5;
  assign T5 = io_out_ready & T6;
  assign T6 = io_sel == 1'h1;
endmodule

module Arbiter(
    output io_in_1_ready,
    input  io_in_1_valid,
    input  io_in_1_bits,
    output io_in_0_ready,
    input  io_in_0_valid,
    input  io_in_0_bits,
    input  io_out_ready,
    output io_out_valid,
    output io_out_bits,
    output io_chosen
);

  wire chosen;
  wire choose;
  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;


  assign io_chosen = chosen;
  assign chosen = choose;
  assign choose = io_in_0_valid == 1'h0;
  assign io_out_bits = T0;
  assign T0 = T1 ? io_in_1_bits : io_in_0_bits;
  assign T1 = chosen;
  assign io_out_valid = T2;
  assign T2 = T1 ? io_in_1_valid : io_in_0_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = T3;
  assign T3 = T4 & io_out_ready;
  assign T4 = io_in_0_valid ^ 1'h1;
endmodule

module BlockStridedRqGen_2(input clk, input reset,
    input [31:0] io_block_intra_step,
    input [31:0] io_block_intra_count,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_base,
    input [31:0] io_in_bits_block_step,
    input [31:0] io_in_bits_block_count,
    input  io_out_ready,
    output io_out_valid,
    output[5:0] io_out_bits_channelID,
    output io_out_bits_isWrite,
    output[31:0] io_out_bits_addr,
    output[7:0] io_out_bits_numBytes,
    output io_out_bits_metaData
);

  wire[7:0] T0;
  wire MultiSeqGen_io_in_ready;
  wire MultiSeqGen_io_out_valid;
  wire[31:0] MultiSeqGen_io_out_bits;
  wire BurstyMultiSeqGen_io_in_ready;
  wire BurstyMultiSeqGen_io_out_valid;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_ind;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_step;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[31:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[31:0] FPGAQueue_1_io_deq_bits_ind;
  wire[31:0] FPGAQueue_1_io_deq_bits_step;


  assign io_out_bits_metaData = 1'h0;
  assign io_out_bits_numBytes = T0;
  assign T0 = FPGAQueue_1_io_deq_bits_step[7:0];
  assign io_out_bits_addr = FPGAQueue_1_io_deq_bits_ind;
  assign io_out_bits_isWrite = 1'h0;
  assign io_out_bits_channelID = 6'h1;
  assign io_out_valid = FPGAQueue_1_io_deq_valid;
  assign io_in_ready = MultiSeqGen_io_in_ready;
  MultiSeqGen MultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( MultiSeqGen_io_in_ready ),
       .io_in_valid( io_in_valid ),
       .io_in_bits_init( io_in_bits_base ),
       .io_in_bits_count( io_in_bits_block_count ),
       .io_in_bits_step( io_in_bits_block_step ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( MultiSeqGen_io_out_valid ),
       .io_out_bits( MultiSeqGen_io_out_bits )
  );
  BurstyMultiSeqGen BurstyMultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits_init( FPGAQueue_io_deq_bits ),
       .io_in_bits_count( io_block_intra_count ),
       .io_in_bits_step( io_block_intra_step ),
       .io_out_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_out_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_out_bits_step( BurstyMultiSeqGen_io_out_bits_step )
  );
  FPGAQueue_8 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( MultiSeqGen_io_out_valid ),
       .io_enq_bits( MultiSeqGen_io_out_bits ),
       .io_deq_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_9 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_enq_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_enq_bits_step( BurstyMultiSeqGen_io_out_bits_step ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits_ind( FPGAQueue_1_io_deq_bits_ind ),
       .io_deq_bits_step( FPGAQueue_1_io_deq_bits_step )
       //.io_count(  )
  );
endmodule

module BlockStridedRqGen_3(input clk, input reset,
    input [31:0] io_block_intra_step,
    input [31:0] io_block_intra_count,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_base,
    input [31:0] io_in_bits_block_step,
    input [31:0] io_in_bits_block_count,
    input  io_out_ready,
    output io_out_valid,
    output[5:0] io_out_bits_channelID,
    output io_out_bits_isWrite,
    output[31:0] io_out_bits_addr,
    output[7:0] io_out_bits_numBytes,
    output io_out_bits_metaData
);

  wire[7:0] T0;
  wire MultiSeqGen_io_in_ready;
  wire MultiSeqGen_io_out_valid;
  wire[31:0] MultiSeqGen_io_out_bits;
  wire BurstyMultiSeqGen_io_in_ready;
  wire BurstyMultiSeqGen_io_out_valid;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_ind;
  wire[31:0] BurstyMultiSeqGen_io_out_bits_step;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[31:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[31:0] FPGAQueue_1_io_deq_bits_ind;
  wire[31:0] FPGAQueue_1_io_deq_bits_step;


  assign io_out_bits_metaData = 1'h0;
  assign io_out_bits_numBytes = T0;
  assign T0 = FPGAQueue_1_io_deq_bits_step[7:0];
  assign io_out_bits_addr = FPGAQueue_1_io_deq_bits_ind;
  assign io_out_bits_isWrite = 1'h1;
  assign io_out_bits_channelID = 6'h1;
  assign io_out_valid = FPGAQueue_1_io_deq_valid;
  assign io_in_ready = MultiSeqGen_io_in_ready;
  MultiSeqGen MultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( MultiSeqGen_io_in_ready ),
       .io_in_valid( io_in_valid ),
       .io_in_bits_init( io_in_bits_base ),
       .io_in_bits_count( io_in_bits_block_count ),
       .io_in_bits_step( io_in_bits_block_step ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( MultiSeqGen_io_out_valid ),
       .io_out_bits( MultiSeqGen_io_out_bits )
  );
  BurstyMultiSeqGen BurstyMultiSeqGen(.clk(clk), .reset(reset),
       .io_in_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits_init( FPGAQueue_io_deq_bits ),
       .io_in_bits_count( io_block_intra_count ),
       .io_in_bits_step( io_block_intra_step ),
       .io_out_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_out_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_out_bits_step( BurstyMultiSeqGen_io_out_bits_step )
  );
  FPGAQueue_8 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( MultiSeqGen_io_out_valid ),
       .io_enq_bits( MultiSeqGen_io_out_bits ),
       .io_deq_ready( BurstyMultiSeqGen_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_9 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( BurstyMultiSeqGen_io_out_valid ),
       .io_enq_bits_ind( BurstyMultiSeqGen_io_out_bits_ind ),
       .io_enq_bits_step( BurstyMultiSeqGen_io_out_bits_step ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits_ind( FPGAQueue_1_io_deq_bits_ind ),
       .io_deq_bits_step( FPGAQueue_1_io_deq_bits_step )
       //.io_count(  )
  );
endmodule

module Counter(input clk, input reset,
    input [3:0] io_nsteps,
    output[3:0] io_current,
    input  io_enable,
    output io_full
);

  wire limitReached;
  reg [3:0] regMax;
  wire[3:0] T0;
  reg [3:0] regCount;
  wire[3:0] T4;
  wire[3:0] T1;
  wire[3:0] T2;
  wire[3:0] T3;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regMax = {1{$random}};
    regCount = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_full = limitReached;
  assign limitReached = regCount == regMax;
  assign T0 = io_nsteps - 4'h1;
  assign T4 = reset ? 4'h0 : T1;
  assign T1 = io_enable ? T2 : regCount;
  assign T2 = limitReached ? 4'h0 : T3;
  assign T3 = regCount + 4'h1;
  assign io_current = regCount;

  always @(posedge clk) begin
    regMax <= T0;
    if(reset) begin
      regCount <= 4'h0;
    end else if(io_enable) begin
      regCount <= T2;
    end
  end
endmodule

module SerialInParallelOut(input clk, input reset,
    input [7:0] io_serIn,
    output[63:0] io_parOut,
    input  io_shiftEn
);

  wire[63:0] T0;
  wire[31:0] T1;
  wire[15:0] T2;
  reg [7:0] stages_0;
  wire[7:0] T15;
  wire[7:0] T3;
  reg [7:0] stages_1;
  wire[7:0] T16;
  wire[7:0] T4;
  reg [7:0] stages_2;
  wire[7:0] T17;
  wire[7:0] T5;
  reg [7:0] stages_3;
  wire[7:0] T18;
  wire[7:0] T6;
  reg [7:0] stages_4;
  wire[7:0] T19;
  wire[7:0] T7;
  reg [7:0] stages_5;
  wire[7:0] T20;
  wire[7:0] T8;
  reg [7:0] stages_6;
  wire[7:0] T21;
  wire[7:0] T9;
  reg [7:0] stages_7;
  wire[7:0] T22;
  wire[7:0] T10;
  wire[15:0] T11;
  wire[31:0] T12;
  wire[15:0] T13;
  wire[15:0] T14;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    stages_0 = {1{$random}};
    stages_1 = {1{$random}};
    stages_2 = {1{$random}};
    stages_3 = {1{$random}};
    stages_4 = {1{$random}};
    stages_5 = {1{$random}};
    stages_6 = {1{$random}};
    stages_7 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_parOut = T0;
  assign T0 = {T12, T1};
  assign T1 = {T11, T2};
  assign T2 = {stages_1, stages_0};
  assign T15 = reset ? 8'h0 : T3;
  assign T3 = io_shiftEn ? stages_1 : stages_0;
  assign T16 = reset ? 8'h0 : T4;
  assign T4 = io_shiftEn ? stages_2 : stages_1;
  assign T17 = reset ? 8'h0 : T5;
  assign T5 = io_shiftEn ? stages_3 : stages_2;
  assign T18 = reset ? 8'h0 : T6;
  assign T6 = io_shiftEn ? stages_4 : stages_3;
  assign T19 = reset ? 8'h0 : T7;
  assign T7 = io_shiftEn ? stages_5 : stages_4;
  assign T20 = reset ? 8'h0 : T8;
  assign T8 = io_shiftEn ? stages_6 : stages_5;
  assign T21 = reset ? 8'h0 : T9;
  assign T9 = io_shiftEn ? stages_7 : stages_6;
  assign T22 = reset ? 8'h0 : T10;
  assign T10 = io_shiftEn ? io_serIn : stages_7;
  assign T11 = {stages_3, stages_2};
  assign T12 = {T14, T13};
  assign T13 = {stages_5, stages_4};
  assign T14 = {stages_7, stages_6};

  always @(posedge clk) begin
    if(reset) begin
      stages_0 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_0 <= stages_1;
    end
    if(reset) begin
      stages_1 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_1 <= stages_2;
    end
    if(reset) begin
      stages_2 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_2 <= stages_3;
    end
    if(reset) begin
      stages_3 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_3 <= stages_4;
    end
    if(reset) begin
      stages_4 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_4 <= stages_5;
    end
    if(reset) begin
      stages_5 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_5 <= stages_6;
    end
    if(reset) begin
      stages_6 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_6 <= stages_7;
    end
    if(reset) begin
      stages_7 <= 8'h0;
    end else if(io_shiftEn) begin
      stages_7 <= io_serIn;
    end
  end
endmodule

module P2SKernel_Fast(input clk, input reset,
    input [3:0] io_actualPrecision,
    output io_inputStream_ready,
    input  io_inputStream_valid,
    input [63:0] io_inputStream_bits,
    input  io_outStream_ready,
    output io_outStream_valid,
    output[63:0] io_outStream_bits
);

  wire T0;
  wire[7:0] T1;
  wire[3:0] T2;
  wire[1:0] T3;
  wire T4;
  wire[7:0] T5;
  wire T6;
  wire[7:0] T7;
  wire[1:0] T8;
  wire T9;
  wire[7:0] T10;
  wire T11;
  wire[7:0] T12;
  wire[3:0] T13;
  wire[1:0] T14;
  wire T15;
  wire[7:0] T16;
  wire T17;
  wire[7:0] T18;
  wire[1:0] T19;
  wire T20;
  wire[7:0] T21;
  wire T22;
  wire[7:0] T23;
  wire T24;
  wire[7:0] T25;
  wire[3:0] T26;
  wire[1:0] T27;
  wire T28;
  wire T29;
  wire[1:0] T30;
  wire T31;
  wire T32;
  wire[3:0] T33;
  wire[1:0] T34;
  wire T35;
  wire T36;
  wire[1:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire[7:0] T41;
  wire[3:0] T42;
  wire[1:0] T43;
  wire T44;
  wire T45;
  wire[1:0] T46;
  wire T47;
  wire T48;
  wire[3:0] T49;
  wire[1:0] T50;
  wire T51;
  wire T52;
  wire[1:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[7:0] T57;
  wire[3:0] T58;
  wire[1:0] T59;
  wire T60;
  wire T61;
  wire[1:0] T62;
  wire T63;
  wire T64;
  wire[3:0] T65;
  wire[1:0] T66;
  wire T67;
  wire T68;
  wire[1:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[7:0] T73;
  wire[3:0] T74;
  wire[1:0] T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire T79;
  wire T80;
  wire[3:0] T81;
  wire[1:0] T82;
  wire T83;
  wire T84;
  wire[1:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[7:0] T89;
  wire[3:0] T90;
  wire[1:0] T91;
  wire T92;
  wire T93;
  wire[1:0] T94;
  wire T95;
  wire T96;
  wire[3:0] T97;
  wire[1:0] T98;
  wire T99;
  wire T100;
  wire[1:0] T101;
  wire T102;
  wire T103;
  wire T104;
  wire[7:0] T105;
  wire[3:0] T106;
  wire[1:0] T107;
  wire T108;
  wire T109;
  wire[1:0] T110;
  wire T111;
  wire T112;
  wire[3:0] T113;
  wire[1:0] T114;
  wire T115;
  wire T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire[7:0] T121;
  wire[3:0] T122;
  wire[1:0] T123;
  wire T124;
  wire T125;
  wire[1:0] T126;
  wire T127;
  wire T128;
  wire[3:0] T129;
  wire[1:0] T130;
  wire T131;
  wire T132;
  wire[1:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  reg  regState;
  wire T162;
  wire T138;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire[63:0] T147;
  wire[63:0] T148;
  wire[63:0] T149;
  wire T150;
  wire[2:0] T151;
  wire[2:0] T163;
  wire[63:0] T152;
  wire T153;
  wire T154;
  wire[63:0] T155;
  wire[63:0] T156;
  wire T157;
  wire[63:0] T158;
  wire T159;
  wire T160;
  wire T161;
  wire[3:0] Counter_io_current;
  wire Counter_io_full;
  wire Counter_1_io_full;
  wire[63:0] SerialInParallelOut_io_parOut;
  wire[63:0] SerialInParallelOut_1_io_parOut;
  wire[63:0] SerialInParallelOut_2_io_parOut;
  wire[63:0] SerialInParallelOut_3_io_parOut;
  wire[63:0] SerialInParallelOut_4_io_parOut;
  wire[63:0] SerialInParallelOut_5_io_parOut;
  wire[63:0] SerialInParallelOut_6_io_parOut;
  wire[63:0] SerialInParallelOut_7_io_parOut;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regState = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = io_inputStream_ready & io_inputStream_valid;
  assign T1 = {T13, T2};
  assign T2 = {T8, T3};
  assign T3 = {T6, T4};
  assign T4 = T5[7];
  assign T5 = io_inputStream_bits[7:0];
  assign T6 = T7[7];
  assign T7 = io_inputStream_bits[15:8];
  assign T8 = {T11, T9};
  assign T9 = T10[7];
  assign T10 = io_inputStream_bits[23:16];
  assign T11 = T12[7];
  assign T12 = io_inputStream_bits[31:24];
  assign T13 = {T19, T14};
  assign T14 = {T17, T15};
  assign T15 = T16[7];
  assign T16 = io_inputStream_bits[39:32];
  assign T17 = T18[7];
  assign T18 = io_inputStream_bits[47:40];
  assign T19 = {T22, T20};
  assign T20 = T21[7];
  assign T21 = io_inputStream_bits[55:48];
  assign T22 = T23[7];
  assign T23 = io_inputStream_bits[63:56];
  assign T24 = io_inputStream_ready & io_inputStream_valid;
  assign T25 = {T33, T26};
  assign T26 = {T30, T27};
  assign T27 = {T29, T28};
  assign T28 = T5[6];
  assign T29 = T7[6];
  assign T30 = {T32, T31};
  assign T31 = T10[6];
  assign T32 = T12[6];
  assign T33 = {T37, T34};
  assign T34 = {T36, T35};
  assign T35 = T16[6];
  assign T36 = T18[6];
  assign T37 = {T39, T38};
  assign T38 = T21[6];
  assign T39 = T23[6];
  assign T40 = io_inputStream_ready & io_inputStream_valid;
  assign T41 = {T49, T42};
  assign T42 = {T46, T43};
  assign T43 = {T45, T44};
  assign T44 = T5[5];
  assign T45 = T7[5];
  assign T46 = {T48, T47};
  assign T47 = T10[5];
  assign T48 = T12[5];
  assign T49 = {T53, T50};
  assign T50 = {T52, T51};
  assign T51 = T16[5];
  assign T52 = T18[5];
  assign T53 = {T55, T54};
  assign T54 = T21[5];
  assign T55 = T23[5];
  assign T56 = io_inputStream_ready & io_inputStream_valid;
  assign T57 = {T65, T58};
  assign T58 = {T62, T59};
  assign T59 = {T61, T60};
  assign T60 = T5[4];
  assign T61 = T7[4];
  assign T62 = {T64, T63};
  assign T63 = T10[4];
  assign T64 = T12[4];
  assign T65 = {T69, T66};
  assign T66 = {T68, T67};
  assign T67 = T16[4];
  assign T68 = T18[4];
  assign T69 = {T71, T70};
  assign T70 = T21[4];
  assign T71 = T23[4];
  assign T72 = io_inputStream_ready & io_inputStream_valid;
  assign T73 = {T81, T74};
  assign T74 = {T78, T75};
  assign T75 = {T77, T76};
  assign T76 = T5[3];
  assign T77 = T7[3];
  assign T78 = {T80, T79};
  assign T79 = T10[3];
  assign T80 = T12[3];
  assign T81 = {T85, T82};
  assign T82 = {T84, T83};
  assign T83 = T16[3];
  assign T84 = T18[3];
  assign T85 = {T87, T86};
  assign T86 = T21[3];
  assign T87 = T23[3];
  assign T88 = io_inputStream_ready & io_inputStream_valid;
  assign T89 = {T97, T90};
  assign T90 = {T94, T91};
  assign T91 = {T93, T92};
  assign T92 = T5[2];
  assign T93 = T7[2];
  assign T94 = {T96, T95};
  assign T95 = T10[2];
  assign T96 = T12[2];
  assign T97 = {T101, T98};
  assign T98 = {T100, T99};
  assign T99 = T16[2];
  assign T100 = T18[2];
  assign T101 = {T103, T102};
  assign T102 = T21[2];
  assign T103 = T23[2];
  assign T104 = io_inputStream_ready & io_inputStream_valid;
  assign T105 = {T113, T106};
  assign T106 = {T110, T107};
  assign T107 = {T109, T108};
  assign T108 = T5[1];
  assign T109 = T7[1];
  assign T110 = {T112, T111};
  assign T111 = T10[1];
  assign T112 = T12[1];
  assign T113 = {T117, T114};
  assign T114 = {T116, T115};
  assign T115 = T16[1];
  assign T116 = T18[1];
  assign T117 = {T119, T118};
  assign T118 = T21[1];
  assign T119 = T23[1];
  assign T120 = io_inputStream_ready & io_inputStream_valid;
  assign T121 = {T129, T122};
  assign T122 = {T126, T123};
  assign T123 = {T125, T124};
  assign T124 = T5[0];
  assign T125 = T7[0];
  assign T126 = {T128, T127};
  assign T127 = T10[0];
  assign T128 = T12[0];
  assign T129 = {T133, T130};
  assign T130 = {T132, T131};
  assign T131 = T16[0];
  assign T132 = T18[0];
  assign T133 = {T135, T134};
  assign T134 = T21[0];
  assign T135 = T23[0];
  assign T136 = T137 & io_inputStream_valid;
  assign T137 = 1'h0 == regState;
  assign T162 = reset ? 1'h0 : T138;
  assign T138 = T144 ? 1'h0 : T139;
  assign T139 = T142 ? 1'h0 : T140;
  assign T140 = T141 ? 1'h1 : regState;
  assign T141 = T136 & Counter_1_io_full;
  assign T142 = T136 & T143;
  assign T143 = Counter_1_io_full ^ 1'h1;
  assign T144 = T145 & Counter_io_full;
  assign T145 = T146 & io_outStream_ready;
  assign T146 = 1'h1 == regState;
  assign io_outStream_bits = T147;
  assign T147 = T161 ? T155 : T148;
  assign T148 = T154 ? T152 : T149;
  assign T149 = T150 ? SerialInParallelOut_1_io_parOut : SerialInParallelOut_io_parOut;
  assign T150 = T151[0];
  assign T151 = T163;
  assign T163 = Counter_io_current[2:0];
  assign T152 = T153 ? SerialInParallelOut_3_io_parOut : SerialInParallelOut_2_io_parOut;
  assign T153 = T151[0];
  assign T154 = T151[1];
  assign T155 = T160 ? T158 : T156;
  assign T156 = T157 ? SerialInParallelOut_5_io_parOut : SerialInParallelOut_4_io_parOut;
  assign T157 = T151[0];
  assign T158 = T159 ? SerialInParallelOut_7_io_parOut : SerialInParallelOut_6_io_parOut;
  assign T159 = T151[0];
  assign T160 = T151[1];
  assign T161 = T151[2];
  assign io_outStream_valid = T146;
  assign io_inputStream_ready = T137;
  Counter Counter(.clk(clk), .reset(reset),
       .io_nsteps( io_actualPrecision ),
       .io_current( Counter_io_current ),
       .io_enable( T145 ),
       .io_full( Counter_io_full )
  );
  Counter Counter_1(.clk(clk), .reset(reset),
       .io_nsteps( 4'h8 ),
       //.io_current(  )
       .io_enable( T136 ),
       .io_full( Counter_1_io_full )
  );
  SerialInParallelOut SerialInParallelOut(.clk(clk), .reset(reset),
       .io_serIn( T121 ),
       .io_parOut( SerialInParallelOut_io_parOut ),
       .io_shiftEn( T120 )
  );
  SerialInParallelOut SerialInParallelOut_1(.clk(clk), .reset(reset),
       .io_serIn( T105 ),
       .io_parOut( SerialInParallelOut_1_io_parOut ),
       .io_shiftEn( T104 )
  );
  SerialInParallelOut SerialInParallelOut_2(.clk(clk), .reset(reset),
       .io_serIn( T89 ),
       .io_parOut( SerialInParallelOut_2_io_parOut ),
       .io_shiftEn( T88 )
  );
  SerialInParallelOut SerialInParallelOut_3(.clk(clk), .reset(reset),
       .io_serIn( T73 ),
       .io_parOut( SerialInParallelOut_3_io_parOut ),
       .io_shiftEn( T72 )
  );
  SerialInParallelOut SerialInParallelOut_4(.clk(clk), .reset(reset),
       .io_serIn( T57 ),
       .io_parOut( SerialInParallelOut_4_io_parOut ),
       .io_shiftEn( T56 )
  );
  SerialInParallelOut SerialInParallelOut_5(.clk(clk), .reset(reset),
       .io_serIn( T41 ),
       .io_parOut( SerialInParallelOut_5_io_parOut ),
       .io_shiftEn( T40 )
  );
  SerialInParallelOut SerialInParallelOut_6(.clk(clk), .reset(reset),
       .io_serIn( T25 ),
       .io_parOut( SerialInParallelOut_6_io_parOut ),
       .io_shiftEn( T24 )
  );
  SerialInParallelOut SerialInParallelOut_7(.clk(clk), .reset(reset),
       .io_serIn( T1 ),
       .io_parOut( SerialInParallelOut_7_io_parOut ),
       .io_shiftEn( T0 )
  );

  always @(posedge clk) begin
    if(reset) begin
      regState <= 1'h0;
    end else if(T144) begin
      regState <= 1'h0;
    end else if(T142) begin
      regState <= 1'h0;
    end else if(T141) begin
      regState <= 1'h1;
    end
  end
endmodule

module StreamingSignCorrection(
    input [3:0] io_actualPrecision,
    input  io_signed,
    output io_in_ready,
    input  io_in_valid,
    input [63:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits
);

  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] sign_actual_prec;
  wire[3:0] T2;
  wire[63:0] T3;


  assign io_out_bits = T0;
  assign T0 = io_signed ? T1 : io_in_bits;
  assign T1 = io_in_bits | sign_actual_prec;
  assign sign_actual_prec = T3 >> T2;
  assign T2 = 4'h8 - io_actualPrecision;
  assign T3 = io_in_bits & 64'h8080808080808080;
  assign io_out_valid = io_in_valid;
  assign io_in_ready = io_out_ready;
endmodule

module StreamFilter_1(
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits_channelID,
    input [63:0] io_in_bits_readData,
    input  io_in_bits_isWrite,
    input  io_in_bits_isLast,
    input  io_in_bits_metaData,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits
);



  assign io_out_bits = io_in_bits_readData;
  assign io_out_valid = io_in_valid;
  assign io_in_ready = io_out_ready;
endmodule

module SRLQueue_6(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[2:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[63:0] Q_srl_o_d;
  wire[2:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(4),
    .width(64)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_6(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[2:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[63:0] SRLQueue_io_deq_bits;
  wire[2:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_6 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module SRLQueue_7(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [5:0] io_enq_bits_channelID,
    input  io_enq_bits_isWrite,
    input [31:0] io_enq_bits_addr,
    input [7:0] io_enq_bits_numBytes,
    input  io_enq_bits_metaData,
    input  io_deq_ready,
    output io_deq_valid,
    output[5:0] io_deq_bits_channelID,
    output io_deq_bits_isWrite,
    output[31:0] io_deq_bits_addr,
    output[7:0] io_deq_bits_numBytes,
    output io_deq_bits_metaData,
    output[2:0] io_count
);

  wire T0;
  wire[47:0] T1;
  wire[47:0] T2;
  wire[40:0] T3;
  wire[8:0] T4;
  wire[6:0] T5;
  wire T6;
  wire[7:0] T7;
  wire[31:0] T8;
  wire T9;
  wire[5:0] T10;
  wire T11;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[47:0] Q_srl_o_d;
  wire[2:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {T5, T3};
  assign T3 = {io_enq_bits_addr, T4};
  assign T4 = {io_enq_bits_numBytes, io_enq_bits_metaData};
  assign T5 = {io_enq_bits_channelID, io_enq_bits_isWrite};
  assign io_count = Q_srl_count;
  assign io_deq_bits_metaData = T6;
  assign T6 = Q_srl_o_d[0];
  assign io_deq_bits_numBytes = T7;
  assign T7 = Q_srl_o_d[8:1];
  assign io_deq_bits_addr = T8;
  assign T8 = Q_srl_o_d[40:9];
  assign io_deq_bits_isWrite = T9;
  assign T9 = Q_srl_o_d[41];
  assign io_deq_bits_channelID = T10;
  assign T10 = Q_srl_o_d[47:42];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T11;
  assign T11 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(4),
    .width(48)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_7(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [5:0] io_enq_bits_channelID,
    input  io_enq_bits_isWrite,
    input [31:0] io_enq_bits_addr,
    input [7:0] io_enq_bits_numBytes,
    input  io_enq_bits_metaData,
    input  io_deq_ready,
    output io_deq_valid,
    output[5:0] io_deq_bits_channelID,
    output io_deq_bits_isWrite,
    output[31:0] io_deq_bits_addr,
    output[7:0] io_deq_bits_numBytes,
    output io_deq_bits_metaData,
    output[2:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[5:0] SRLQueue_io_deq_bits_channelID;
  wire SRLQueue_io_deq_bits_isWrite;
  wire[31:0] SRLQueue_io_deq_bits_addr;
  wire[7:0] SRLQueue_io_deq_bits_numBytes;
  wire SRLQueue_io_deq_bits_metaData;
  wire[2:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_metaData = SRLQueue_io_deq_bits_metaData;
  assign io_deq_bits_numBytes = SRLQueue_io_deq_bits_numBytes;
  assign io_deq_bits_addr = SRLQueue_io_deq_bits_addr;
  assign io_deq_bits_isWrite = SRLQueue_io_deq_bits_isWrite;
  assign io_deq_bits_channelID = SRLQueue_io_deq_bits_channelID;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_7 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_channelID( io_enq_bits_channelID ),
       .io_enq_bits_isWrite( io_enq_bits_isWrite ),
       .io_enq_bits_addr( io_enq_bits_addr ),
       .io_enq_bits_numBytes( io_enq_bits_numBytes ),
       .io_enq_bits_metaData( io_enq_bits_metaData ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_channelID( SRLQueue_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( SRLQueue_io_deq_bits_isWrite ),
       .io_deq_bits_addr( SRLQueue_io_deq_bits_addr ),
       .io_deq_bits_numBytes( SRLQueue_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( SRLQueue_io_deq_bits_metaData ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module StandAloneP2SAccel(input clk, input reset,
    input  io_memPort_0_memRdReq_ready,
    output io_memPort_0_memRdReq_valid,
    output[31:0] io_memPort_0_memRdReq_bits_channelID,
    output io_memPort_0_memRdReq_bits_isWrite,
    output[47:0] io_memPort_0_memRdReq_bits_addr,
    output[7:0] io_memPort_0_memRdReq_bits_numBytes,
    output io_memPort_0_memRdReq_bits_metaData,
    output io_memPort_0_memRdRsp_ready,
    input  io_memPort_0_memRdRsp_valid,
    input [31:0] io_memPort_0_memRdRsp_bits_channelID,
    input [63:0] io_memPort_0_memRdRsp_bits_readData,
    input  io_memPort_0_memRdRsp_bits_isWrite,
    input  io_memPort_0_memRdRsp_bits_isLast,
    input  io_memPort_0_memRdRsp_bits_metaData,
    input  io_memPort_0_memWrReq_ready,
    output io_memPort_0_memWrReq_valid,
    output[31:0] io_memPort_0_memWrReq_bits_channelID,
    output io_memPort_0_memWrReq_bits_isWrite,
    output[47:0] io_memPort_0_memWrReq_bits_addr,
    output[7:0] io_memPort_0_memWrReq_bits_numBytes,
    output io_memPort_0_memWrReq_bits_metaData,
    input  io_memPort_0_memWrDat_ready,
    output io_memPort_0_memWrDat_valid,
    output[63:0] io_memPort_0_memWrDat_bits,
    output io_memPort_0_memWrRsp_ready,
    input  io_memPort_0_memWrRsp_valid,
    input [31:0] io_memPort_0_memWrRsp_bits_channelID,
    input [63:0] io_memPort_0_memWrRsp_bits_readData,
    input  io_memPort_0_memWrRsp_bits_isWrite,
    input  io_memPort_0_memWrRsp_bits_isLast,
    input  io_memPort_0_memWrRsp_bits_metaData,
    //output[31:0] io_signature
    output io_p2sCmd_ready,
    input  io_p2sCmd_valid,
    input [31:0] io_p2sCmd_bits_dramBaseAddrSrc,
    input [31:0] io_p2sCmd_bits_dramBaseAddrDst,
    input [31:0] io_p2sCmd_bits_matrixRows,
    input [31:0] io_p2sCmd_bits_matrixColsGroup,
    input [3:0] io_p2sCmd_bits_actualPrecision,
    input [31:0] io_p2sCmd_bits_waitCompleteBytes,
    input  io_p2sCmd_bits_signed,
    input  io_ack_ready,
    output io_ack_valid,
    output[31:0] io_ack_bits
);

  reg  regCmd_signed;
  wire T0;
  wire T1;
  wire T2;
  reg [2:0] regState;
  wire[2:0] T36;
  wire[2:0] T3;
  wire[2:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire[2:0] T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire writeComplete;
  reg [31:0] regCmd_waitCompleteBytes;
  wire[31:0] T13;
  reg [31:0] regCompletedWrBytes;
  wire[31:0] T37;
  wire[31:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  reg [3:0] regCmd_actualPrecision;
  wire[3:0] T21;
  wire[31:0] T38;
  wire[63:0] T22;
  reg [31:0] regCmd_matrixRows;
  wire[31:0] T23;
  reg [31:0] regCmd_matrixColsGroup;
  wire[31:0] T24;
  reg [31:0] regCmd_dramBaseAddrDst;
  wire[31:0] T25;
  wire[31:0] T39;
  wire[31:0] T40;
  wire[67:0] T26;
  wire[63:0] T27;
  wire[31:0] T41;
  wire[39:0] T28;
  wire[35:0] T29;
  reg [31:0] regCmd_dramBaseAddrSrc;
  wire[31:0] T30;
  wire[31:0] T42;
  wire[35:0] T31;
  reg [31:0] regCycleCount;
  wire[31:0] T43;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire T35;
  wire[47:0] T44;
  wire[31:0] T45;
  wire[47:0] T46;
  wire[31:0] T47;
  wire StreamingSignCorrection_io_in_ready;
  wire StreamingSignCorrection_io_out_valid;
  wire[63:0] StreamingSignCorrection_io_out_bits;
  wire StreamFilter_io_in_ready;
  wire StreamFilter_io_out_valid;
  wire[63:0] StreamFilter_io_out_bits;
  wire P2SKernel_Fast_io_inputStream_ready;
  wire P2SKernel_Fast_io_outStream_valid;
  wire[63:0] P2SKernel_Fast_io_outStream_bits;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire[63:0] FPGAQueue_io_deq_bits;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire[5:0] FPGAQueue_1_io_deq_bits_channelID;
  wire FPGAQueue_1_io_deq_bits_isWrite;
  wire[31:0] FPGAQueue_1_io_deq_bits_addr;
  wire FPGAQueue_1_io_deq_bits_metaData;
  wire FPGAQueue_2_io_enq_ready;
  wire FPGAQueue_2_io_deq_valid;
  wire[63:0] FPGAQueue_2_io_deq_bits;
  wire BlockStridedRqGen_io_in_ready;
  wire BlockStridedRqGen_io_out_valid;
  wire[5:0] BlockStridedRqGen_io_out_bits_channelID;
  wire BlockStridedRqGen_io_out_bits_isWrite;
  wire[31:0] BlockStridedRqGen_io_out_bits_addr;
  wire[7:0] BlockStridedRqGen_io_out_bits_numBytes;
  wire BlockStridedRqGen_io_out_bits_metaData;
  wire BlockStridedRqGen_1_io_in_ready;
  wire BlockStridedRqGen_1_io_out_valid;
  wire[5:0] BlockStridedRqGen_1_io_out_bits_channelID;
  wire BlockStridedRqGen_1_io_out_bits_isWrite;
  wire[31:0] BlockStridedRqGen_1_io_out_bits_addr;
  wire[7:0] BlockStridedRqGen_1_io_out_bits_numBytes;
  wire BlockStridedRqGen_1_io_out_bits_metaData;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regCmd_signed = {1{$random}};
    regState = {1{$random}};
    regCmd_waitCompleteBytes = {1{$random}};
    regCompletedWrBytes = {1{$random}};
    regCmd_actualPrecision = {1{$random}};
    regCmd_matrixRows = {1{$random}};
    regCmd_matrixColsGroup = {1{$random}};
    regCmd_dramBaseAddrDst = {1{$random}};
    regCmd_dramBaseAddrSrc = {1{$random}};
    regCycleCount = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_signature = {1{$random}};
// synthesis translate_on
`endif
  assign T0 = T1 ? io_p2sCmd_bits_signed : regCmd_signed;
  assign T1 = T2 & io_p2sCmd_valid;
  assign T2 = 3'h0 == regState;
  assign T36 = reset ? 3'h0 : T3;
  assign T3 = T19 ? 3'h0 : T4;
  assign T4 = T12 ? 3'h4 : T5;
  assign T5 = T10 ? 3'h3 : T6;
  assign T6 = T8 ? 3'h2 : T7;
  assign T7 = T1 ? 3'h1 : regState;
  assign T8 = T9 & BlockStridedRqGen_io_in_ready;
  assign T9 = 3'h1 == regState;
  assign T10 = T11 & BlockStridedRqGen_1_io_in_ready;
  assign T11 = 3'h2 == regState;
  assign T12 = T18 & writeComplete;
  assign writeComplete = regCompletedWrBytes == regCmd_waitCompleteBytes;
  assign T13 = T1 ? io_p2sCmd_bits_waitCompleteBytes : regCmd_waitCompleteBytes;
  assign T37 = reset ? 32'h0 : T14;
  assign T14 = T2 ? 32'h0 : T15;
  assign T15 = T17 ? T16 : regCompletedWrBytes;
  assign T16 = regCompletedWrBytes + 32'h8;
  assign T17 = io_memPort_0_memWrRsp_ready & io_memPort_0_memWrRsp_valid;
  assign T18 = 3'h3 == regState;
  assign T19 = T20 & io_ack_ready;
  assign T20 = 3'h4 == regState;
  assign T21 = T1 ? io_p2sCmd_bits_actualPrecision : regCmd_actualPrecision;
  assign T38 = T22[31:0];
  assign T22 = regCmd_matrixColsGroup * regCmd_matrixRows;
  assign T23 = T1 ? io_p2sCmd_bits_matrixRows : regCmd_matrixRows;
  assign T24 = T1 ? io_p2sCmd_bits_matrixColsGroup : regCmd_matrixColsGroup;
  assign T25 = T1 ? io_p2sCmd_bits_dramBaseAddrDst : regCmd_dramBaseAddrDst;
  assign T39 = {28'h0, regCmd_actualPrecision};
  assign T40 = T26[31:0];
  assign T26 = T27 * 4'h8;
  assign T27 = regCmd_matrixColsGroup * regCmd_matrixRows;
  assign T41 = T28[31:0];
  assign T28 = T29 * 4'h8;
  assign T29 = regCmd_matrixColsGroup * 4'h8;
  assign T30 = T1 ? io_p2sCmd_bits_dramBaseAddrSrc : regCmd_dramBaseAddrSrc;
  assign T42 = T31[31:0];
  assign T31 = 4'h8 * regCmd_matrixColsGroup;
  assign io_ack_bits = regCycleCount;
  assign T43 = reset ? 32'h0 : T32;
  assign T32 = T2 ? 32'h0 : T33;
  assign T33 = T35 ? T34 : regCycleCount;
  assign T34 = regCycleCount + 32'h1;
  assign T35 = regState != 3'h0;
  assign io_ack_valid = T20;
  assign io_p2sCmd_ready = T2;
  assign io_memPort_0_memWrRsp_ready = 1'h1;
  assign io_memPort_0_memWrDat_bits = FPGAQueue_2_io_deq_bits;
  assign io_memPort_0_memWrDat_valid = FPGAQueue_2_io_deq_valid;
  assign io_memPort_0_memWrReq_bits_metaData = FPGAQueue_1_io_deq_bits_metaData;
  assign io_memPort_0_memWrReq_bits_numBytes = 8'h8;
  assign io_memPort_0_memWrReq_bits_addr = T44;
  assign T44 = {16'h0, FPGAQueue_1_io_deq_bits_addr};
  assign io_memPort_0_memWrReq_bits_isWrite = FPGAQueue_1_io_deq_bits_isWrite;
  assign io_memPort_0_memWrReq_bits_channelID = T45;
  assign T45 = {26'h0, FPGAQueue_1_io_deq_bits_channelID};
  assign io_memPort_0_memWrReq_valid = FPGAQueue_1_io_deq_valid;
  assign io_memPort_0_memRdRsp_ready = StreamFilter_io_in_ready;
  assign io_memPort_0_memRdReq_bits_metaData = BlockStridedRqGen_io_out_bits_metaData;
  assign io_memPort_0_memRdReq_bits_numBytes = BlockStridedRqGen_io_out_bits_numBytes;
  assign io_memPort_0_memRdReq_bits_addr = T46;
  assign T46 = {16'h0, BlockStridedRqGen_io_out_bits_addr};
  assign io_memPort_0_memRdReq_bits_isWrite = BlockStridedRqGen_io_out_bits_isWrite;
  assign io_memPort_0_memRdReq_bits_channelID = T47;
  assign T47 = {26'h0, BlockStridedRqGen_io_out_bits_channelID};
  assign io_memPort_0_memRdReq_valid = BlockStridedRqGen_io_out_valid;
  BlockStridedRqGen_2 BlockStridedRqGen(.clk(clk), .reset(reset),
       .io_block_intra_step( 32'h8 ),
       .io_block_intra_count( T42 ),
       .io_in_ready( BlockStridedRqGen_io_in_ready ),
       .io_in_valid( T9 ),
       .io_in_bits_base( regCmd_dramBaseAddrSrc ),
       .io_in_bits_block_step( T41 ),
       .io_in_bits_block_count( regCmd_matrixRows ),
       .io_out_ready( io_memPort_0_memRdReq_ready ),
       .io_out_valid( BlockStridedRqGen_io_out_valid ),
       .io_out_bits_channelID( BlockStridedRqGen_io_out_bits_channelID ),
       .io_out_bits_isWrite( BlockStridedRqGen_io_out_bits_isWrite ),
       .io_out_bits_addr( BlockStridedRqGen_io_out_bits_addr ),
       .io_out_bits_numBytes( BlockStridedRqGen_io_out_bits_numBytes ),
       .io_out_bits_metaData( BlockStridedRqGen_io_out_bits_metaData )
  );
  BlockStridedRqGen_3 BlockStridedRqGen_1(.clk(clk), .reset(reset),
       .io_block_intra_step( T40 ),
       .io_block_intra_count( T39 ),
       .io_in_ready( BlockStridedRqGen_1_io_in_ready ),
       .io_in_valid( T11 ),
       .io_in_bits_base( regCmd_dramBaseAddrDst ),
       .io_in_bits_block_step( 32'h8 ),
       .io_in_bits_block_count( T38 ),
       .io_out_ready( FPGAQueue_1_io_enq_ready ),
       .io_out_valid( BlockStridedRqGen_1_io_out_valid ),
       .io_out_bits_channelID( BlockStridedRqGen_1_io_out_bits_channelID ),
       .io_out_bits_isWrite( BlockStridedRqGen_1_io_out_bits_isWrite ),
       .io_out_bits_addr( BlockStridedRqGen_1_io_out_bits_addr ),
       .io_out_bits_numBytes( BlockStridedRqGen_1_io_out_bits_numBytes ),
       .io_out_bits_metaData( BlockStridedRqGen_1_io_out_bits_metaData )
  );
  P2SKernel_Fast P2SKernel_Fast(.clk(clk), .reset(reset),
       .io_actualPrecision( regCmd_actualPrecision ),
       .io_inputStream_ready( P2SKernel_Fast_io_inputStream_ready ),
       .io_inputStream_valid( StreamingSignCorrection_io_out_valid ),
       .io_inputStream_bits( StreamingSignCorrection_io_out_bits ),
       .io_outStream_ready( FPGAQueue_2_io_enq_ready ),
       .io_outStream_valid( P2SKernel_Fast_io_outStream_valid ),
       .io_outStream_bits( P2SKernel_Fast_io_outStream_bits )
  );
  StreamingSignCorrection StreamingSignCorrection(
       .io_actualPrecision( regCmd_actualPrecision ),
       .io_signed( regCmd_signed ),
       .io_in_ready( StreamingSignCorrection_io_in_ready ),
       .io_in_valid( FPGAQueue_io_deq_valid ),
       .io_in_bits( FPGAQueue_io_deq_bits ),
       .io_out_ready( P2SKernel_Fast_io_inputStream_ready ),
       .io_out_valid( StreamingSignCorrection_io_out_valid ),
       .io_out_bits( StreamingSignCorrection_io_out_bits )
  );
  StreamFilter_1 StreamFilter(
       .io_in_ready( StreamFilter_io_in_ready ),
       .io_in_valid( io_memPort_0_memRdRsp_valid ),
       .io_in_bits_channelID( io_memPort_0_memRdRsp_bits_channelID ),
       .io_in_bits_readData( io_memPort_0_memRdRsp_bits_readData ),
       .io_in_bits_isWrite( io_memPort_0_memRdRsp_bits_isWrite ),
       .io_in_bits_isLast( io_memPort_0_memRdRsp_bits_isLast ),
       .io_in_bits_metaData( io_memPort_0_memRdRsp_bits_metaData ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( StreamFilter_io_out_valid ),
       .io_out_bits( StreamFilter_io_out_bits )
  );
  FPGAQueue_6 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( StreamFilter_io_out_valid ),
       .io_enq_bits( StreamFilter_io_out_bits ),
       .io_deq_ready( StreamingSignCorrection_io_in_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits )
       //.io_count(  )
  );
  FPGAQueue_7 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( BlockStridedRqGen_1_io_out_valid ),
       .io_enq_bits_channelID( BlockStridedRqGen_1_io_out_bits_channelID ),
       .io_enq_bits_isWrite( BlockStridedRqGen_1_io_out_bits_isWrite ),
       .io_enq_bits_addr( BlockStridedRqGen_1_io_out_bits_addr ),
       .io_enq_bits_numBytes( BlockStridedRqGen_1_io_out_bits_numBytes ),
       .io_enq_bits_metaData( BlockStridedRqGen_1_io_out_bits_metaData ),
       .io_deq_ready( io_memPort_0_memWrReq_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits_channelID( FPGAQueue_1_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( FPGAQueue_1_io_deq_bits_isWrite ),
       .io_deq_bits_addr( FPGAQueue_1_io_deq_bits_addr ),
       //.io_deq_bits_numBytes(  )
       .io_deq_bits_metaData( FPGAQueue_1_io_deq_bits_metaData )
       //.io_count(  )
  );
  FPGAQueue_6 FPGAQueue_2(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_2_io_enq_ready ),
       .io_enq_valid( P2SKernel_Fast_io_outStream_valid ),
       .io_enq_bits( P2SKernel_Fast_io_outStream_bits ),
       .io_deq_ready( io_memPort_0_memWrDat_ready ),
       .io_deq_valid( FPGAQueue_2_io_deq_valid ),
       .io_deq_bits( FPGAQueue_2_io_deq_bits )
       //.io_count(  )
  );

  always @(posedge clk) begin
    if(T1) begin
      regCmd_signed <= io_p2sCmd_bits_signed;
    end
    if(reset) begin
      regState <= 3'h0;
    end else if(T19) begin
      regState <= 3'h0;
    end else if(T12) begin
      regState <= 3'h4;
    end else if(T10) begin
      regState <= 3'h3;
    end else if(T8) begin
      regState <= 3'h2;
    end else if(T1) begin
      regState <= 3'h1;
    end
    if(T1) begin
      regCmd_waitCompleteBytes <= io_p2sCmd_bits_waitCompleteBytes;
    end
    if(reset) begin
      regCompletedWrBytes <= 32'h0;
    end else if(T2) begin
      regCompletedWrBytes <= 32'h0;
    end else if(T17) begin
      regCompletedWrBytes <= T16;
    end
    if(T1) begin
      regCmd_actualPrecision <= io_p2sCmd_bits_actualPrecision;
    end
    if(T1) begin
      regCmd_matrixRows <= io_p2sCmd_bits_matrixRows;
    end
    if(T1) begin
      regCmd_matrixColsGroup <= io_p2sCmd_bits_matrixColsGroup;
    end
    if(T1) begin
      regCmd_dramBaseAddrDst <= io_p2sCmd_bits_dramBaseAddrDst;
    end
    if(T1) begin
      regCmd_dramBaseAddrSrc <= io_p2sCmd_bits_dramBaseAddrSrc;
    end
    if(reset) begin
      regCycleCount <= 32'h0;
    end else if(T2) begin
      regCycleCount <= 32'h0;
    end else if(T35) begin
      regCycleCount <= T34;
    end
  end
endmodule

module SRLQueue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_dramBaseAddrSrc,
    input [31:0] io_enq_bits_dramBaseAddrDst,
    input [31:0] io_enq_bits_matrixRows,
    input [31:0] io_enq_bits_matrixColsGroup,
    input [3:0] io_enq_bits_actualPrecision,
    input [31:0] io_enq_bits_waitCompleteBytes,
    input  io_enq_bits_signed,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_dramBaseAddrSrc,
    output[31:0] io_deq_bits_dramBaseAddrDst,
    output[31:0] io_deq_bits_matrixRows,
    output[31:0] io_deq_bits_matrixColsGroup,
    output[3:0] io_deq_bits_actualPrecision,
    output[31:0] io_deq_bits_waitCompleteBytes,
    output io_deq_bits_signed,
    output[4:0] io_count
);

  wire T0;
  wire[164:0] T1;
  wire[164:0] T2;
  wire[68:0] T3;
  wire[32:0] T4;
  wire[35:0] T5;
  wire[95:0] T6;
  wire[63:0] T7;
  wire T8;
  wire[31:0] T9;
  wire[3:0] T10;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[164:0] Q_srl_o_d;
  wire[4:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign T1 = T2;
  assign T2 = {T6, T3};
  assign T3 = {T5, T4};
  assign T4 = {io_enq_bits_waitCompleteBytes, io_enq_bits_signed};
  assign T5 = {io_enq_bits_matrixColsGroup, io_enq_bits_actualPrecision};
  assign T6 = {io_enq_bits_dramBaseAddrSrc, T7};
  assign T7 = {io_enq_bits_dramBaseAddrDst, io_enq_bits_matrixRows};
  assign io_count = Q_srl_count;
  assign io_deq_bits_signed = T8;
  assign T8 = Q_srl_o_d[0];
  assign io_deq_bits_waitCompleteBytes = T9;
  assign T9 = Q_srl_o_d[32:1];
  assign io_deq_bits_actualPrecision = T10;
  assign T10 = Q_srl_o_d[36:33];
  assign io_deq_bits_matrixColsGroup = T11;
  assign T11 = Q_srl_o_d[68:37];
  assign io_deq_bits_matrixRows = T12;
  assign T12 = Q_srl_o_d[100:69];
  assign io_deq_bits_dramBaseAddrDst = T13;
  assign T13 = Q_srl_o_d[132:101];
  assign io_deq_bits_dramBaseAddrSrc = T14;
  assign T14 = Q_srl_o_d[164:133];
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T15;
  assign T15 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(16),
    .width(165)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( T1 ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_dramBaseAddrSrc,
    input [31:0] io_enq_bits_dramBaseAddrDst,
    input [31:0] io_enq_bits_matrixRows,
    input [31:0] io_enq_bits_matrixColsGroup,
    input [3:0] io_enq_bits_actualPrecision,
    input [31:0] io_enq_bits_waitCompleteBytes,
    input  io_enq_bits_signed,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_dramBaseAddrSrc,
    output[31:0] io_deq_bits_dramBaseAddrDst,
    output[31:0] io_deq_bits_matrixRows,
    output[31:0] io_deq_bits_matrixColsGroup,
    output[3:0] io_deq_bits_actualPrecision,
    output[31:0] io_deq_bits_waitCompleteBytes,
    output io_deq_bits_signed,
    output[4:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[31:0] SRLQueue_io_deq_bits_dramBaseAddrSrc;
  wire[31:0] SRLQueue_io_deq_bits_dramBaseAddrDst;
  wire[31:0] SRLQueue_io_deq_bits_matrixRows;
  wire[31:0] SRLQueue_io_deq_bits_matrixColsGroup;
  wire[3:0] SRLQueue_io_deq_bits_actualPrecision;
  wire[31:0] SRLQueue_io_deq_bits_waitCompleteBytes;
  wire SRLQueue_io_deq_bits_signed;
  wire[4:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits_signed = SRLQueue_io_deq_bits_signed;
  assign io_deq_bits_waitCompleteBytes = SRLQueue_io_deq_bits_waitCompleteBytes;
  assign io_deq_bits_actualPrecision = SRLQueue_io_deq_bits_actualPrecision;
  assign io_deq_bits_matrixColsGroup = SRLQueue_io_deq_bits_matrixColsGroup;
  assign io_deq_bits_matrixRows = SRLQueue_io_deq_bits_matrixRows;
  assign io_deq_bits_dramBaseAddrDst = SRLQueue_io_deq_bits_dramBaseAddrDst;
  assign io_deq_bits_dramBaseAddrSrc = SRLQueue_io_deq_bits_dramBaseAddrSrc;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_2 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_dramBaseAddrSrc( io_enq_bits_dramBaseAddrSrc ),
       .io_enq_bits_dramBaseAddrDst( io_enq_bits_dramBaseAddrDst ),
       .io_enq_bits_matrixRows( io_enq_bits_matrixRows ),
       .io_enq_bits_matrixColsGroup( io_enq_bits_matrixColsGroup ),
       .io_enq_bits_actualPrecision( io_enq_bits_actualPrecision ),
       .io_enq_bits_waitCompleteBytes( io_enq_bits_waitCompleteBytes ),
       .io_enq_bits_signed( io_enq_bits_signed ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits_dramBaseAddrSrc( SRLQueue_io_deq_bits_dramBaseAddrSrc ),
       .io_deq_bits_dramBaseAddrDst( SRLQueue_io_deq_bits_dramBaseAddrDst ),
       .io_deq_bits_matrixRows( SRLQueue_io_deq_bits_matrixRows ),
       .io_deq_bits_matrixColsGroup( SRLQueue_io_deq_bits_matrixColsGroup ),
       .io_deq_bits_actualPrecision( SRLQueue_io_deq_bits_actualPrecision ),
       .io_deq_bits_waitCompleteBytes( SRLQueue_io_deq_bits_waitCompleteBytes ),
       .io_deq_bits_signed( SRLQueue_io_deq_bits_signed ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module SRLQueue_3(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[4:0] io_count
);

  wire T0;
  wire T1;
  wire Q_srl_i_b;
  wire Q_srl_o_v;
  wire[31:0] Q_srl_o_d;
  wire[4:0] Q_srl_count;


  assign T0 = io_deq_ready ^ 1'h1;
  assign io_count = Q_srl_count;
  assign io_deq_bits = Q_srl_o_d;
  assign io_deq_valid = Q_srl_o_v;
  assign io_enq_ready = T1;
  assign T1 = Q_srl_i_b ^ 1'h1;
  Q_srl # (
    .depth(16),
    .width(32)
  ) Q_srl(.clock(clk), .reset(reset),
       .i_v( io_enq_valid ),
       .i_d( io_enq_bits ),
       .i_b( Q_srl_i_b ),
       .o_v( Q_srl_o_v ),
       .o_d( Q_srl_o_d ),
       .o_b( T0 ),
       .count( Q_srl_count )
  );
endmodule

module FPGAQueue_3(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[4:0] io_count
);

  wire SRLQueue_io_enq_ready;
  wire SRLQueue_io_deq_valid;
  wire[31:0] SRLQueue_io_deq_bits;
  wire[4:0] SRLQueue_io_count;


  assign io_count = SRLQueue_io_count;
  assign io_deq_bits = SRLQueue_io_deq_bits;
  assign io_deq_valid = SRLQueue_io_deq_valid;
  assign io_enq_ready = SRLQueue_io_enq_ready;
  SRLQueue_3 SRLQueue(.clk(clk), .reset(reset),
       .io_enq_ready( SRLQueue_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits( io_enq_bits ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( SRLQueue_io_deq_valid ),
       .io_deq_bits( SRLQueue_io_deq_bits ),
       .io_count( SRLQueue_io_count )
  );
endmodule

module DecoupledInputMux_1(
    input  io_sel,
    output io_in_1_ready,
    input  io_in_1_valid,
    input [5:0] io_in_1_bits_channelID,
    input  io_in_1_bits_isWrite,
    input [31:0] io_in_1_bits_addr,
    input [7:0] io_in_1_bits_numBytes,
    input  io_in_1_bits_metaData,
    output io_in_0_ready,
    input  io_in_0_valid,
    input [5:0] io_in_0_bits_channelID,
    input  io_in_0_bits_isWrite,
    input [31:0] io_in_0_bits_addr,
    input [7:0] io_in_0_bits_numBytes,
    input  io_in_0_bits_metaData,
    input  io_out_ready,
    output io_out_valid,
    output[5:0] io_out_bits_channelID,
    output io_out_bits_isWrite,
    output[31:0] io_out_bits_addr,
    output[7:0] io_out_bits_numBytes,
    output io_out_bits_metaData
);

  wire T0;
  wire T1;
  wire[7:0] T2;
  wire[31:0] T3;
  wire T4;
  wire[5:0] T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;


  assign io_out_bits_metaData = T0;
  assign T0 = T1 ? io_in_1_bits_metaData : io_in_0_bits_metaData;
  assign T1 = io_sel;
  assign io_out_bits_numBytes = T2;
  assign T2 = T1 ? io_in_1_bits_numBytes : io_in_0_bits_numBytes;
  assign io_out_bits_addr = T3;
  assign T3 = T1 ? io_in_1_bits_addr : io_in_0_bits_addr;
  assign io_out_bits_isWrite = T4;
  assign T4 = T1 ? io_in_1_bits_isWrite : io_in_0_bits_isWrite;
  assign io_out_bits_channelID = T5;
  assign T5 = T1 ? io_in_1_bits_channelID : io_in_0_bits_channelID;
  assign io_out_valid = T6;
  assign T6 = T1 ? io_in_1_valid : io_in_0_valid;
  assign io_in_0_ready = T7;
  assign T7 = io_out_ready & T8;
  assign T8 = io_sel == 1'h0;
  assign io_in_1_ready = T9;
  assign T9 = io_out_ready & T10;
  assign T10 = io_sel == 1'h1;
endmodule

module DecoupledInputMux_2(
    input  io_sel,
    output io_in_1_ready,
    input  io_in_1_valid,
    input [63:0] io_in_1_bits,
    output io_in_0_ready,
    input  io_in_0_valid,
    input [63:0] io_in_0_bits,
    input  io_out_ready,
    output io_out_valid,
    output[63:0] io_out_bits
);

  wire[63:0] T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;


  assign io_out_bits = T0;
  assign T0 = T1 ? io_in_1_bits : io_in_0_bits;
  assign T1 = io_sel;
  assign io_out_valid = T2;
  assign T2 = T1 ? io_in_1_valid : io_in_0_valid;
  assign io_in_0_ready = T3;
  assign T3 = io_out_ready & T4;
  assign T4 = io_sel == 1'h0;
  assign io_in_1_ready = T5;
  assign T5 = io_out_ready & T6;
  assign T6 = io_sel == 1'h1;
endmodule

module DecoupledOutputDemux(
    input  io_sel,
    output io_in_ready,
    input  io_in_valid,
    input [5:0] io_in_bits_channelID,
    input [63:0] io_in_bits_readData,
    input  io_in_bits_isWrite,
    input  io_in_bits_isLast,
    input  io_in_bits_metaData,
    input  io_out_1_ready,
    output io_out_1_valid,
    output[5:0] io_out_1_bits_channelID,
    output[63:0] io_out_1_bits_readData,
    output io_out_1_bits_isWrite,
    output io_out_1_bits_isLast,
    output io_out_1_bits_metaData,
    input  io_out_0_ready,
    output io_out_0_valid,
    output[5:0] io_out_0_bits_channelID,
    output[63:0] io_out_0_bits_readData,
    output io_out_0_bits_isWrite,
    output io_out_0_bits_isLast,
    output io_out_0_bits_metaData
);

  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;


  assign io_out_0_bits_metaData = io_in_bits_metaData;
  assign io_out_0_bits_isLast = io_in_bits_isLast;
  assign io_out_0_bits_isWrite = io_in_bits_isWrite;
  assign io_out_0_bits_readData = io_in_bits_readData;
  assign io_out_0_bits_channelID = io_in_bits_channelID;
  assign io_out_0_valid = T0;
  assign T0 = io_in_valid & T1;
  assign T1 = io_sel == 1'h0;
  assign io_out_1_bits_metaData = io_in_bits_metaData;
  assign io_out_1_bits_isLast = io_in_bits_isLast;
  assign io_out_1_bits_isWrite = io_in_bits_isWrite;
  assign io_out_1_bits_readData = io_in_bits_readData;
  assign io_out_1_bits_channelID = io_in_bits_channelID;
  assign io_out_1_valid = T2;
  assign T2 = io_in_valid & T3;
  assign T3 = io_sel == 1'h1;
  assign io_in_ready = T4;
  assign T4 = T5 ? io_out_1_ready : io_out_0_ready;
  assign T5 = io_sel;
endmodule

module BitSerialMatMulAccel(input clk, input reset,
    input  io_memPort_0_memRdReq_ready,
    output io_memPort_0_memRdReq_valid,
    output[31:0] io_memPort_0_memRdReq_bits_channelID,
    output io_memPort_0_memRdReq_bits_isWrite,
    output[47:0] io_memPort_0_memRdReq_bits_addr,
    output[7:0] io_memPort_0_memRdReq_bits_numBytes,
    output io_memPort_0_memRdReq_bits_metaData,
    output io_memPort_0_memRdRsp_ready,
    input  io_memPort_0_memRdRsp_valid,
    input [31:0] io_memPort_0_memRdRsp_bits_channelID,
    input [63:0] io_memPort_0_memRdRsp_bits_readData,
    input  io_memPort_0_memRdRsp_bits_isWrite,
    input  io_memPort_0_memRdRsp_bits_isLast,
    input  io_memPort_0_memRdRsp_bits_metaData,
    input  io_memPort_0_memWrReq_ready,
    output io_memPort_0_memWrReq_valid,
    output[31:0] io_memPort_0_memWrReq_bits_channelID,
    output io_memPort_0_memWrReq_bits_isWrite,
    output[47:0] io_memPort_0_memWrReq_bits_addr,
    output[7:0] io_memPort_0_memWrReq_bits_numBytes,
    output io_memPort_0_memWrReq_bits_metaData,
    input  io_memPort_0_memWrDat_ready,
    output io_memPort_0_memWrDat_valid,
    output[63:0] io_memPort_0_memWrDat_bits,
    output io_memPort_0_memWrRsp_ready,
    input  io_memPort_0_memWrRsp_valid,
    input [31:0] io_memPort_0_memWrRsp_bits_channelID,
    input [63:0] io_memPort_0_memWrRsp_bits_readData,
    input  io_memPort_0_memWrRsp_bits_isWrite,
    input  io_memPort_0_memWrRsp_bits_isLast,
    input  io_memPort_0_memWrRsp_bits_metaData,
    output[31:0] io_signature,
    input  io_fetch_enable,
    input  io_exec_enable,
    input  io_result_enable,
    input  io_insOrDsc,
    output io_ins_ready,
    input  io_ins_valid,
    input [127:0] io_ins_bits,
    output io_dsc_ready,
    input  io_dsc_valid,
    input [207:0] io_dsc_bits,
    output[31:0] io_fetch_op_count,
    output[31:0] io_exec_op_count,
    output[31:0] io_result_op_count,
    output[31:0] io_hw_readChanWidth,
    output[31:0] io_hw_writeChanWidth,
    output[31:0] io_hw_dpaDimLHS,
    output[31:0] io_hw_dpaDimRHS,
    output[31:0] io_hw_dpaDimCommon,
    output[31:0] io_hw_lhsEntriesPerMem,
    output[31:0] io_hw_rhsEntriesPerMem,
    output[31:0] io_hw_accWidth,
    output[31:0] io_hw_maxShiftSteps,
    output[31:0] io_hw_cmdQueueEntries,
    output[31:0] io_perf_cc,
    input  io_perf_cc_enable,
    output[31:0] io_perf_prf_fetch_count,
    input [1:0] io_perf_prf_fetch_sel,
    output[31:0] io_perf_prf_exec_count,
    input [1:0] io_perf_prf_exec_sel,
    output[31:0] io_perf_prf_res_count,
    input [1:0] io_perf_prf_res_sel,
    output[31:0] io_tc_fe,
    output[31:0] io_tc_ef,
    output[31:0] io_tc_re,
    output[31:0] io_tc_er,
    input  io_addtoken_ef,
    input  io_addtoken_re,
    input  io_enable,
    output io_cmdqueue_ready,
    input  io_cmdqueue_valid,
    input [31:0] io_cmdqueue_bits_dramBaseAddrSrc,
    input [31:0] io_cmdqueue_bits_dramBaseAddrDst,
    input [31:0] io_cmdqueue_bits_matrixRows,
    input [31:0] io_cmdqueue_bits_matrixColsGroup,
    input [3:0] io_cmdqueue_bits_actualPrecision,
    input [31:0] io_cmdqueue_bits_waitCompleteBytes,
    input  io_cmdqueue_bits_signed,
    input  io_ackqueue_ready,
    output io_ackqueue_valid,
    output[31:0] io_ackqueue_bits
);

  wire[5:0] T81;
  wire[5:0] T82;
  wire[31:0] T83;
  wire[5:0] T84;
  wire[31:0] T85;
  wire[5:0] T86;
  wire T0;
  wire T1;
  reg  R2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  reg  R7;
  wire T8;
  wire T9;
  wire[31:0] T87;
  wire[31:0] T88;
  wire T10;
  wire T11;
  reg  R12;
  wire T13;
  wire T14;
  reg  R15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  reg  R20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  reg  R32;
  wire[1:0] T33;
  wire T34;
  wire[58:0] T35;
  wire T36;
  wire T37;
  wire[31:0] T38;
  wire[15:0] T39;
  wire[15:0] T40;
  wire[1:0] T41;
  wire T42;
  wire[67:0] T43;
  wire[15:0] T44;
  wire[15:0] T45;
  wire[15:0] T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire[1:0] T52;
  wire T53;
  wire[2:0] T54;
  wire[8:0] T55;
  wire T56;
  wire[15:0] T57;
  wire[31:0] T58;
  wire[15:0] T59;
  wire[23:0] T60;
  wire[7:0] T61;
  wire[15:0] T62;
  wire[31:0] T89;
  wire[31:0] T90;
  wire[31:0] T91;
  wire[31:0] T92;
  reg [31:0] regCC;
  wire[31:0] T93;
  wire[31:0] T63;
  wire[31:0] T64;
  wire T65;
  wire T66;
  reg  regCCEnablePrev;
  wire[31:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[31:0] T71;
  wire[31:0] T72;
  wire[31:0] T73;
  wire[31:0] T74;
  wire[31:0] T75;
  wire[31:0] T76;
  wire[31:0] T77;
  wire[31:0] T78;
  wire[31:0] T79;
  wire[31:0] T80;
  wire[31:0] T94;
  wire[31:0] T95_1;
  wire[31:0] T96_1;
  wire[47:0] T97_1;
  wire[31:0] T98_1;
  wire[47:0] T99_1;
  wire[31:0] T100_1;
  wire ExecInstrGen_in_V_V_TREADY;
  wire ExecInstrGen_out_V_V_TVALID;
  wire[127:0] ExecInstrGen_out_V_V_TDATA;
  wire FetchInstrGen_in_V_V_TREADY;
  wire FetchInstrGen_out_V_V_TVALID;
  wire[127:0] FetchInstrGen_out_V_V_TDATA;
  wire ResultInstrGen_in_V_V_TREADY;
  wire ResultInstrGen_out_V_V_TVALID;
  wire[127:0] ResultInstrGen_out_V_V_TDATA;
  wire DecoupledInputMux_io_in_1_ready;
  wire DecoupledInputMux_io_in_0_ready;
  wire DecoupledInputMux_io_out_valid;
  wire[127:0] DecoupledInputMux_io_out_bits;
  wire DecoupledInputMux_1_io_in_1_ready;
  wire DecoupledInputMux_1_io_in_0_ready;
  wire DecoupledInputMux_1_io_out_valid;
  wire[127:0] DecoupledInputMux_1_io_out_bits;
  wire DecoupledInputMux_2_io_in_1_ready;
  wire DecoupledInputMux_2_io_in_0_ready;
  wire DecoupledInputMux_2_io_out_valid;
  wire[127:0] DecoupledInputMux_2_io_out_bits;
  wire Arbiter_io_in_0_ready;
  wire Arbiter_io_out_valid;
  wire Arbiter_io_out_bits;
  wire Arbiter_1_io_in_0_ready;
  wire Arbiter_1_io_out_valid;
  wire Arbiter_1_io_out_bits;
  wire DecoupledInputMux_3_io_in_1_ready;
  wire DecoupledInputMux_3_io_in_0_ready;
  wire DecoupledInputMux_3_io_out_valid;
  wire[5:0] DecoupledInputMux_3_io_out_bits_channelID;
  wire DecoupledInputMux_3_io_out_bits_isWrite;
  wire[31:0] DecoupledInputMux_3_io_out_bits_addr;
  wire[7:0] DecoupledInputMux_3_io_out_bits_numBytes;
  wire DecoupledInputMux_3_io_out_bits_metaData;
  wire DecoupledInputMux_4_io_in_1_ready;
  wire DecoupledInputMux_4_io_in_0_ready;
  wire DecoupledInputMux_4_io_out_valid;
  wire[5:0] DecoupledInputMux_4_io_out_bits_channelID;
  wire DecoupledInputMux_4_io_out_bits_isWrite;
  wire[31:0] DecoupledInputMux_4_io_out_bits_addr;
  wire[7:0] DecoupledInputMux_4_io_out_bits_numBytes;
  wire DecoupledInputMux_4_io_out_bits_metaData;
  wire DecoupledInputMux_5_io_in_1_ready;
  wire DecoupledInputMux_5_io_in_0_ready;
  wire DecoupledInputMux_5_io_out_valid;
  wire[63:0] DecoupledInputMux_5_io_out_bits;
  wire DecoupledOutputDemux_io_in_ready;
  wire DecoupledOutputDemux_io_out_1_valid;
  wire[5:0] DecoupledOutputDemux_io_out_1_bits_channelID;
  wire[63:0] DecoupledOutputDemux_io_out_1_bits_readData;
  wire DecoupledOutputDemux_io_out_1_bits_isWrite;
  wire DecoupledOutputDemux_io_out_1_bits_isLast;
  wire DecoupledOutputDemux_io_out_1_bits_metaData;
  wire DecoupledOutputDemux_io_out_0_valid;
  wire[5:0] DecoupledOutputDemux_io_out_0_bits_channelID;
  wire[63:0] DecoupledOutputDemux_io_out_0_bits_readData;
  wire DecoupledOutputDemux_io_out_0_bits_isWrite;
  wire DecoupledOutputDemux_io_out_0_bits_isLast;
  wire DecoupledOutputDemux_io_out_0_bits_metaData;
  wire DecoupledOutputDemux_1_io_in_ready;
  wire DecoupledOutputDemux_1_io_out_1_valid;
  wire[5:0] DecoupledOutputDemux_1_io_out_1_bits_channelID;
  wire[63:0] DecoupledOutputDemux_1_io_out_1_bits_readData;
  wire DecoupledOutputDemux_1_io_out_1_bits_isWrite;
  wire DecoupledOutputDemux_1_io_out_1_bits_isLast;
  wire DecoupledOutputDemux_1_io_out_1_bits_metaData;
  wire DecoupledOutputDemux_1_io_out_0_valid;
  wire[5:0] DecoupledOutputDemux_1_io_out_0_bits_channelID;
  wire[63:0] DecoupledOutputDemux_1_io_out_0_bits_readData;
  wire DecoupledOutputDemux_1_io_out_0_bits_isWrite;
  wire DecoupledOutputDemux_1_io_out_0_bits_isLast;
  wire DecoupledOutputDemux_1_io_out_0_bits_metaData;
  wire FetchDecoupledController_io_op_ready;
  wire FetchDecoupledController_io_stage_run_valid;
  wire[15:0] FetchDecoupledController_io_stage_run_bits_tiles_per_row;
  wire[7:0] FetchDecoupledController_io_stage_run_bits_dram_block_count;
  wire[23:0] FetchDecoupledController_io_stage_run_bits_dram_block_offset_bytes;
  wire[15:0] FetchDecoupledController_io_stage_run_bits_dram_block_size_bytes;
  wire[31:0] FetchDecoupledController_io_stage_run_bits_dram_base;
  wire[15:0] FetchDecoupledController_io_stage_run_bits_bram_addr_base;
  wire FetchDecoupledController_io_stage_run_bits_bram_id_range;
  wire[8:0] FetchDecoupledController_io_stage_run_bits_bram_id_start;
  wire FetchDecoupledController_io_sync_in_0_ready;
  wire FetchDecoupledController_io_sync_out_0_valid;
  wire FetchDecoupledController_io_sync_out_0_bits;
  wire[31:0] FetchDecoupledController_io_perf_count;
  wire ExecDecoupledController_io_op_ready;
  wire ExecDecoupledController_io_stage_run_valid;
  wire ExecDecoupledController_io_stage_run_bits_writeAddr;
  wire ExecDecoupledController_io_stage_run_bits_writeEn;
  wire ExecDecoupledController_io_stage_run_bits_clear_before_first_accumulation;
  wire ExecDecoupledController_io_stage_run_bits_negate;
  wire ExecDecoupledController_io_stage_run_bits_shiftAmount;
  wire[15:0] ExecDecoupledController_io_stage_run_bits_numTiles;
  wire[15:0] ExecDecoupledController_io_stage_run_bits_rhsOffset;
  wire[15:0] ExecDecoupledController_io_stage_run_bits_lhsOffset;
  wire ExecDecoupledController_io_sync_in_1_ready;
  wire ExecDecoupledController_io_sync_in_0_ready;
  wire ExecDecoupledController_io_sync_out_1_valid;
  wire ExecDecoupledController_io_sync_out_1_bits;
  wire ExecDecoupledController_io_sync_out_0_valid;
  wire ExecDecoupledController_io_sync_out_0_bits;
  wire[31:0] ExecDecoupledController_io_perf_count;
  wire ResultController_io_op_ready;
  wire ResultController_io_start;
  wire[15:0] ResultController_io_stageO_waitCompleteBytes;
  wire[15:0] ResultController_io_stageO_dram_skip;
  wire[31:0] ResultController_io_stageO_dram_base;
  wire ResultController_io_stageO_resmem_addr;
  wire ResultController_io_stageO_nop;
  wire ResultController_io_sync_in_0_ready;
  wire ResultController_io_sync_out_0_valid;
  wire ResultController_io_sync_out_0_bits;
  wire[31:0] ResultController_io_perf_count;
  wire[31:0] PipelinedDualPortBRAM_b_dout;
  wire[31:0] PipelinedDualPortBRAM_1_b_dout;
  wire[31:0] PipelinedDualPortBRAM_2_b_dout;
  wire[31:0] PipelinedDualPortBRAM_3_b_dout;
  wire[63:0] AsymPipelinedDualPortBRAM_io_ports_1_rsp_readData;
  wire[63:0] AsymPipelinedDualPortBRAM_1_io_ports_1_rsp_readData;
  wire[63:0] AsymPipelinedDualPortBRAM_2_io_ports_1_rsp_readData;
  wire[63:0] AsymPipelinedDualPortBRAM_3_io_ports_1_rsp_readData;
  wire execStage_direct_io_stage_run_ready;
  wire execStage_direct_io_stage_done_valid;
  wire[9:0] execStage_direct_io_tilemem_lhs_req_1_addr;
  wire[63:0] execStage_direct_io_tilemem_lhs_req_1_writeData;
  wire execStage_direct_io_tilemem_lhs_req_1_writeEn;
  wire[9:0] execStage_direct_io_tilemem_lhs_req_0_addr;
  wire[63:0] execStage_direct_io_tilemem_lhs_req_0_writeData;
  wire execStage_direct_io_tilemem_lhs_req_0_writeEn;
  wire[9:0] execStage_direct_io_tilemem_rhs_req_1_addr;
  wire[63:0] execStage_direct_io_tilemem_rhs_req_1_writeData;
  wire execStage_direct_io_tilemem_rhs_req_1_writeEn;
  wire[9:0] execStage_direct_io_tilemem_rhs_req_0_addr;
  wire[63:0] execStage_direct_io_tilemem_rhs_req_0_writeData;
  wire execStage_direct_io_tilemem_rhs_req_0_writeEn;
  wire execStage_direct_io_res_req_1_1_addr;
  wire[31:0] execStage_direct_io_res_req_1_1_writeData;
  wire execStage_direct_io_res_req_1_1_writeEn;
  wire execStage_direct_io_res_req_1_0_addr;
  wire[31:0] execStage_direct_io_res_req_1_0_writeData;
  wire execStage_direct_io_res_req_1_0_writeEn;
  wire execStage_direct_io_res_req_0_1_addr;
  wire[31:0] execStage_direct_io_res_req_0_1_writeData;
  wire execStage_direct_io_res_req_0_1_writeEn;
  wire execStage_direct_io_res_req_0_0_addr;
  wire[31:0] execStage_direct_io_res_req_0_0_writeData;
  wire execStage_direct_io_res_req_0_0_writeEn;
  wire FPGAQueue_io_enq_ready;
  wire FPGAQueue_io_deq_valid;
  wire FPGAQueue_io_deq_bits;
  wire[3:0] FPGAQueue_io_count;
  wire FPGAQueue_1_io_enq_ready;
  wire FPGAQueue_1_io_deq_valid;
  wire FPGAQueue_1_io_deq_bits;
  wire[3:0] FPGAQueue_1_io_count;
  wire FPGAQueue_2_io_enq_ready;
  wire FPGAQueue_2_io_deq_valid;
  wire FPGAQueue_2_io_deq_bits;
  wire[3:0] FPGAQueue_2_io_count;
  wire FPGAQueue_3_io_enq_ready;
  wire FPGAQueue_3_io_deq_valid;
  wire FPGAQueue_3_io_deq_bits;
  wire[3:0] FPGAQueue_3_io_count;
  wire FPGAQueue_4_io_enq_ready;
  wire FPGAQueue_4_io_deq_valid;
  wire[207:0] FPGAQueue_4_io_deq_bits;
  wire FPGAQueue_5_io_enq_ready;
  wire FPGAQueue_5_io_deq_valid;
  wire[31:0] FPGAQueue_5_io_deq_bits_dramBaseAddrSrc;
  wire[31:0] FPGAQueue_5_io_deq_bits_dramBaseAddrDst;
  wire[31:0] FPGAQueue_5_io_deq_bits_matrixRows;
  wire[31:0] FPGAQueue_5_io_deq_bits_matrixColsGroup;
  wire[3:0] FPGAQueue_5_io_deq_bits_actualPrecision;
  wire[31:0] FPGAQueue_5_io_deq_bits_waitCompleteBytes;
  wire FPGAQueue_5_io_deq_bits_signed;
  wire FPGAQueue_6_io_enq_ready;
  wire FPGAQueue_6_io_deq_valid;
  wire[31:0] FPGAQueue_6_io_deq_bits;
  wire StreamDeinterleaverQueued_io_in_ready;
  wire StreamDeinterleaverQueued_io_out_2_valid;
  wire[127:0] StreamDeinterleaverQueued_io_out_2_bits;
  wire StreamDeinterleaverQueued_io_out_1_valid;
  wire[127:0] StreamDeinterleaverQueued_io_out_1_bits;
  wire StreamDeinterleaverQueued_io_out_0_valid;
  wire[127:0] StreamDeinterleaverQueued_io_out_0_bits;
  wire FetchDecoupledStage_io_stage_run_ready;
  wire FetchDecoupledStage_io_stage_done_valid;
  wire[9:0] FetchDecoupledStage_io_bram_lhs_req_1_addr;
  wire[63:0] FetchDecoupledStage_io_bram_lhs_req_1_writeData;
  wire FetchDecoupledStage_io_bram_lhs_req_1_writeEn;
  wire[9:0] FetchDecoupledStage_io_bram_lhs_req_0_addr;
  wire[63:0] FetchDecoupledStage_io_bram_lhs_req_0_writeData;
  wire FetchDecoupledStage_io_bram_lhs_req_0_writeEn;
  wire[9:0] FetchDecoupledStage_io_bram_rhs_req_1_addr;
  wire[63:0] FetchDecoupledStage_io_bram_rhs_req_1_writeData;
  wire FetchDecoupledStage_io_bram_rhs_req_1_writeEn;
  wire[9:0] FetchDecoupledStage_io_bram_rhs_req_0_addr;
  wire[63:0] FetchDecoupledStage_io_bram_rhs_req_0_writeData;
  wire FetchDecoupledStage_io_bram_rhs_req_0_writeEn;
  wire FetchDecoupledStage_io_dram_rd_req_valid;
  wire[5:0] FetchDecoupledStage_io_dram_rd_req_bits_channelID;
  wire FetchDecoupledStage_io_dram_rd_req_bits_isWrite;
  wire[31:0] FetchDecoupledStage_io_dram_rd_req_bits_addr;
  wire[7:0] FetchDecoupledStage_io_dram_rd_req_bits_numBytes;
  wire FetchDecoupledStage_io_dram_rd_req_bits_metaData;
  wire FetchDecoupledStage_io_dram_rd_rsp_ready;
  wire FPGAQueue_7_io_enq_ready;
  wire FPGAQueue_7_io_deq_valid;
  wire[15:0] FPGAQueue_7_io_deq_bits_runcfg_tiles_per_row;
  wire[7:0] FPGAQueue_7_io_deq_bits_runcfg_dram_block_count;
  wire[23:0] FPGAQueue_7_io_deq_bits_runcfg_dram_block_offset_bytes;
  wire[15:0] FPGAQueue_7_io_deq_bits_runcfg_dram_block_size_bytes;
  wire[31:0] FPGAQueue_7_io_deq_bits_runcfg_dram_base;
  wire[15:0] FPGAQueue_7_io_deq_bits_runcfg_bram_addr_base;
  wire FPGAQueue_7_io_deq_bits_runcfg_bram_id_range;
  wire[8:0] FPGAQueue_7_io_deq_bits_runcfg_bram_id_start;
  wire[2:0] FPGAQueue_7_io_deq_bits_unused;
  wire FPGAQueue_7_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_7_io_deq_bits_targetStage;
  wire[9:0] FPGAQueue_7_io_count;
  wire FPGAQueue_8_io_enq_ready;
  wire FPGAQueue_8_io_deq_valid;
  wire FPGAQueue_8_io_deq_bits_runcfg_writeAddr;
  wire FPGAQueue_8_io_deq_bits_runcfg_writeEn;
  wire FPGAQueue_8_io_deq_bits_runcfg_clear_before_first_accumulation;
  wire FPGAQueue_8_io_deq_bits_runcfg_negate;
  wire FPGAQueue_8_io_deq_bits_runcfg_shiftAmount;
  wire[15:0] FPGAQueue_8_io_deq_bits_runcfg_numTiles;
  wire[15:0] FPGAQueue_8_io_deq_bits_runcfg_rhsOffset;
  wire[15:0] FPGAQueue_8_io_deq_bits_runcfg_lhsOffset;
  wire[67:0] FPGAQueue_8_io_deq_bits_unused;
  wire FPGAQueue_8_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_8_io_deq_bits_targetStage;
  wire[9:0] FPGAQueue_8_io_count;
  wire FPGAQueue_9_io_enq_ready;
  wire FPGAQueue_9_io_deq_valid;
  wire[15:0] FPGAQueue_9_io_deq_bits_runcfg_waitCompleteBytes;
  wire[15:0] FPGAQueue_9_io_deq_bits_runcfg_dram_skip;
  wire[31:0] FPGAQueue_9_io_deq_bits_runcfg_dram_base;
  wire FPGAQueue_9_io_deq_bits_runcfg_resmem_addr;
  wire FPGAQueue_9_io_deq_bits_runcfg_nop;
  wire[58:0] FPGAQueue_9_io_deq_bits_unused;
  wire FPGAQueue_9_io_deq_bits_isRunCfg;
  wire[1:0] FPGAQueue_9_io_deq_bits_targetStage;
  wire[9:0] FPGAQueue_9_io_count;
  wire StandAloneP2SAccel_io_memPort_0_memRdReq_valid;
  wire[31:0] StandAloneP2SAccel_io_memPort_0_memRdReq_bits_channelID;
  wire StandAloneP2SAccel_io_memPort_0_memRdReq_bits_isWrite;
  wire[47:0] StandAloneP2SAccel_io_memPort_0_memRdReq_bits_addr;
  wire[7:0] StandAloneP2SAccel_io_memPort_0_memRdReq_bits_numBytes;
  wire StandAloneP2SAccel_io_memPort_0_memRdReq_bits_metaData;
  wire StandAloneP2SAccel_io_memPort_0_memRdRsp_ready;
  wire StandAloneP2SAccel_io_memPort_0_memWrReq_valid;
  wire[31:0] StandAloneP2SAccel_io_memPort_0_memWrReq_bits_channelID;
  wire StandAloneP2SAccel_io_memPort_0_memWrReq_bits_isWrite;
  wire[47:0] StandAloneP2SAccel_io_memPort_0_memWrReq_bits_addr;
  wire[7:0] StandAloneP2SAccel_io_memPort_0_memWrReq_bits_numBytes;
  wire StandAloneP2SAccel_io_memPort_0_memWrReq_bits_metaData;
  wire StandAloneP2SAccel_io_memPort_0_memWrDat_valid;
  wire[63:0] StandAloneP2SAccel_io_memPort_0_memWrDat_bits;
  wire StandAloneP2SAccel_io_memPort_0_memWrRsp_ready;
  wire StandAloneP2SAccel_io_p2sCmd_ready;
  wire StandAloneP2SAccel_io_ack_valid;
  wire[31:0] StandAloneP2SAccel_io_ack_bits;
  wire ResultStage_io_done;
  wire ResultStage_io_dram_wr_req_valid;
  wire[5:0] ResultStage_io_dram_wr_req_bits_channelID;
  wire ResultStage_io_dram_wr_req_bits_isWrite;
  wire[31:0] ResultStage_io_dram_wr_req_bits_addr;
  wire[7:0] ResultStage_io_dram_wr_req_bits_numBytes;
  wire ResultStage_io_dram_wr_req_bits_metaData;
  wire ResultStage_io_dram_wr_dat_valid;
  wire[63:0] ResultStage_io_dram_wr_dat_bits;
  wire ResultStage_io_dram_wr_rsp_ready;
  wire ResultStage_io_resmem_req_1_1_addr;
  wire[31:0] ResultStage_io_resmem_req_1_1_writeData;
  wire ResultStage_io_resmem_req_1_1_writeEn;
  wire ResultStage_io_resmem_req_1_0_addr;
  wire[31:0] ResultStage_io_resmem_req_1_0_writeData;
  wire ResultStage_io_resmem_req_1_0_writeEn;
  wire ResultStage_io_resmem_req_0_1_addr;
  wire[31:0] ResultStage_io_resmem_req_0_1_writeData;
  wire ResultStage_io_resmem_req_0_1_writeEn;
  wire ResultStage_io_resmem_req_0_0_addr;
  wire[31:0] ResultStage_io_resmem_req_0_0_writeData;
  wire ResultStage_io_resmem_req_0_0_writeEn;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R2 = {1{$random}};
    R7 = {1{$random}};
    R12 = {1{$random}};
    R15 = {1{$random}};
    R20 = {1{$random}};
    R32 = {1{$random}};
    regCC = {1{$random}};
    regCCEnablePrev = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T81 = io_memPort_0_memWrRsp_bits_channelID[5:0];
  assign T82 = io_memPort_0_memRdRsp_bits_channelID[5:0];
  assign T83 = StandAloneP2SAccel_io_memPort_0_memWrReq_bits_addr[31:0];
  assign T84 = StandAloneP2SAccel_io_memPort_0_memWrReq_bits_channelID[5:0];
  assign T85 = StandAloneP2SAccel_io_memPort_0_memRdReq_bits_addr[31:0];
  assign T86 = StandAloneP2SAccel_io_memPort_0_memRdReq_bits_channelID[5:0];
  assign T0 = io_ackqueue_ready & T1;
  assign T1 = R2 ^ 1'h1;
  assign T3 = StandAloneP2SAccel_io_ack_valid & io_enable;
  assign T4 = StandAloneP2SAccel_io_p2sCmd_ready & io_enable;
  assign T5 = io_cmdqueue_valid & T6;
  assign T6 = R7 ^ 1'h1;
  assign T8 = FPGAQueue_6_io_enq_ready & io_enable;
  assign T9 = FPGAQueue_5_io_deq_valid & io_enable;
  assign T87 = {26'h0, DecoupledOutputDemux_1_io_out_1_bits_channelID};
  assign T88 = {26'h0, DecoupledOutputDemux_io_out_1_bits_channelID};
  assign T10 = io_addtoken_re & T11;
  assign T11 = R12 ^ 1'h1;
  assign T13 = io_addtoken_ef & T14;
  assign T14 = R15 ^ 1'h1;
  assign T16 = T17 & ResultInstrGen_in_V_V_TREADY;
  assign T17 = FetchInstrGen_in_V_V_TREADY & ExecInstrGen_in_V_V_TREADY;
  assign T18 = io_dsc_valid & T19;
  assign T19 = R20 ^ 1'h1;
  assign T21 = reset ^ 1'h1;
  assign T22 = FPGAQueue_4_io_deq_valid & T23;
  assign T23 = FetchInstrGen_in_V_V_TREADY & ExecInstrGen_in_V_V_TREADY;
  assign T24 = reset ^ 1'h1;
  assign T25 = FPGAQueue_4_io_deq_valid & T26;
  assign T26 = ExecInstrGen_in_V_V_TREADY & ResultInstrGen_in_V_V_TREADY;
  assign T27 = reset ^ 1'h1;
  assign T28 = FPGAQueue_4_io_deq_valid & T29;
  assign T29 = FetchInstrGen_in_V_V_TREADY & ResultInstrGen_in_V_V_TREADY;
  assign T30 = io_ins_valid & T31;
  assign T31 = R32 ^ 1'h1;
  assign T33 = DecoupledInputMux_2_io_out_bits[1:0];
  assign T34 = DecoupledInputMux_2_io_out_bits[2];
  assign T35 = DecoupledInputMux_2_io_out_bits[61:3];
  assign T36 = DecoupledInputMux_2_io_out_bits[62];
  assign T37 = DecoupledInputMux_2_io_out_bits[63];
  assign T38 = DecoupledInputMux_2_io_out_bits[95:64];
  assign T39 = DecoupledInputMux_2_io_out_bits[111:96];
  assign T40 = DecoupledInputMux_2_io_out_bits[127:112];
  assign T41 = DecoupledInputMux_1_io_out_bits[1:0];
  assign T42 = DecoupledInputMux_1_io_out_bits[2];
  assign T43 = DecoupledInputMux_1_io_out_bits[70:3];
  assign T44 = DecoupledInputMux_1_io_out_bits[86:71];
  assign T45 = DecoupledInputMux_1_io_out_bits[102:87];
  assign T46 = DecoupledInputMux_1_io_out_bits[118:103];
  assign T47 = DecoupledInputMux_1_io_out_bits[119];
  assign T48 = DecoupledInputMux_1_io_out_bits[120];
  assign T49 = DecoupledInputMux_1_io_out_bits[121];
  assign T50 = DecoupledInputMux_1_io_out_bits[122];
  assign T51 = DecoupledInputMux_1_io_out_bits[123];
  assign T52 = DecoupledInputMux_io_out_bits[1:0];
  assign T53 = DecoupledInputMux_io_out_bits[2];
  assign T54 = DecoupledInputMux_io_out_bits[5:3];
  assign T55 = DecoupledInputMux_io_out_bits[14:6];
  assign T56 = DecoupledInputMux_io_out_bits[15];
  assign T57 = DecoupledInputMux_io_out_bits[31:16];
  assign T58 = DecoupledInputMux_io_out_bits[63:32];
  assign T59 = DecoupledInputMux_io_out_bits[79:64];
  assign T60 = DecoupledInputMux_io_out_bits[103:80];
  assign T61 = DecoupledInputMux_io_out_bits[111:104];
  assign T62 = DecoupledInputMux_io_out_bits[127:112];
  assign io_ackqueue_bits = FPGAQueue_6_io_deq_bits;
  assign io_ackqueue_valid = FPGAQueue_6_io_deq_valid;
  assign io_cmdqueue_ready = FPGAQueue_5_io_enq_ready;
  assign io_tc_er = T89;
  assign T89 = {28'h0, FPGAQueue_3_io_count};
  assign io_tc_re = T90;
  assign T90 = {28'h0, FPGAQueue_2_io_count};
  assign io_tc_ef = T91;
  assign T91 = {28'h0, FPGAQueue_io_count};
  assign io_tc_fe = T92;
  assign T92 = {28'h0, FPGAQueue_1_io_count};
  assign io_perf_prf_res_count = ResultController_io_perf_count;
  assign io_perf_prf_exec_count = ExecDecoupledController_io_perf_count;
  assign io_perf_prf_fetch_count = FetchDecoupledController_io_perf_count;
  assign io_perf_cc = regCC;
  assign T93 = reset ? 32'h0 : T63;
  assign T63 = T68 ? T67 : T64;
  assign T64 = T65 ? 32'h0 : regCC;
  assign T65 = io_perf_cc_enable & T66;
  assign T66 = regCCEnablePrev ^ 1'h1;
  assign T67 = regCC + 32'h1;
  assign T68 = T70 & T69;
  assign T69 = io_perf_cc_enable & regCCEnablePrev;
  assign T70 = T65 ^ 1'h1;
  assign io_hw_cmdQueueEntries = T71;
  assign T71 = 32'h200;
  assign io_hw_maxShiftSteps = T72;
  assign T72 = 32'h10;
  assign io_hw_accWidth = T73;
  assign T73 = 32'h20;
  assign io_hw_rhsEntriesPerMem = T74;
  assign T74 = 32'h400;
  assign io_hw_lhsEntriesPerMem = T75;
  assign T75 = 32'h400;
  assign io_hw_dpaDimCommon = T76;
  assign T76 = 32'h40;
  assign io_hw_dpaDimRHS = T77;
  assign T77 = 32'h2;
  assign io_hw_dpaDimLHS = T78;
  assign T78 = 32'h2;
  assign io_hw_writeChanWidth = T79;
  assign T79 = 32'h40;
  assign io_hw_readChanWidth = T80;
  assign T80 = 32'h40;
  assign io_result_op_count = T94;
  assign T94 = {22'h0, FPGAQueue_9_io_count};
  assign io_exec_op_count = T95_1;
  assign T95_1 = {22'h0, FPGAQueue_8_io_count};
  assign io_fetch_op_count = T96_1;
  assign T96_1 = {22'h0, FPGAQueue_7_io_count};
  assign io_dsc_ready = FPGAQueue_4_io_enq_ready;
  assign io_ins_ready = StreamDeinterleaverQueued_io_in_ready;
  assign io_signature = 32'h8426730;
  assign io_memPort_0_memWrRsp_ready = DecoupledOutputDemux_1_io_in_ready;
  assign io_memPort_0_memWrDat_bits = DecoupledInputMux_5_io_out_bits;
  assign io_memPort_0_memWrDat_valid = DecoupledInputMux_5_io_out_valid;
  assign io_memPort_0_memWrReq_bits_metaData = DecoupledInputMux_4_io_out_bits_metaData;
  assign io_memPort_0_memWrReq_bits_numBytes = DecoupledInputMux_4_io_out_bits_numBytes;
  assign io_memPort_0_memWrReq_bits_addr = T97_1;
  assign T97_1 = {16'h0, DecoupledInputMux_4_io_out_bits_addr};
  assign io_memPort_0_memWrReq_bits_isWrite = DecoupledInputMux_4_io_out_bits_isWrite;
  assign io_memPort_0_memWrReq_bits_channelID = T98_1;
  assign T98_1 = {26'h0, DecoupledInputMux_4_io_out_bits_channelID};
  assign io_memPort_0_memWrReq_valid = DecoupledInputMux_4_io_out_valid;
  assign io_memPort_0_memRdRsp_ready = DecoupledOutputDemux_io_in_ready;
  assign io_memPort_0_memRdReq_bits_metaData = DecoupledInputMux_3_io_out_bits_metaData;
  assign io_memPort_0_memRdReq_bits_numBytes = DecoupledInputMux_3_io_out_bits_numBytes;
  assign io_memPort_0_memRdReq_bits_addr = T99_1;
  assign T99_1 = {16'h0, DecoupledInputMux_3_io_out_bits_addr};
  assign io_memPort_0_memRdReq_bits_isWrite = DecoupledInputMux_3_io_out_bits_isWrite;
  assign io_memPort_0_memRdReq_bits_channelID = T100_1;
  assign T100_1 = {26'h0, DecoupledInputMux_3_io_out_bits_channelID};
  assign io_memPort_0_memRdReq_valid = DecoupledInputMux_3_io_out_valid;
  FetchDecoupledStage FetchDecoupledStage(.clk(clk), .reset(reset),
       .io_stage_run_ready( FetchDecoupledStage_io_stage_run_ready ),
       .io_stage_run_valid( FetchDecoupledController_io_stage_run_valid ),
       .io_stage_run_bits_tiles_per_row( FetchDecoupledController_io_stage_run_bits_tiles_per_row ),
       .io_stage_run_bits_dram_block_count( FetchDecoupledController_io_stage_run_bits_dram_block_count ),
       .io_stage_run_bits_dram_block_offset_bytes( FetchDecoupledController_io_stage_run_bits_dram_block_offset_bytes ),
       .io_stage_run_bits_dram_block_size_bytes( FetchDecoupledController_io_stage_run_bits_dram_block_size_bytes ),
       .io_stage_run_bits_dram_base( FetchDecoupledController_io_stage_run_bits_dram_base ),
       .io_stage_run_bits_bram_addr_base( FetchDecoupledController_io_stage_run_bits_bram_addr_base ),
       .io_stage_run_bits_bram_id_range( FetchDecoupledController_io_stage_run_bits_bram_id_range ),
       .io_stage_run_bits_bram_id_start( FetchDecoupledController_io_stage_run_bits_bram_id_start ),
       .io_stage_done_valid( FetchDecoupledStage_io_stage_done_valid ),
       //.io_stage_done_bits(  )
       //.io_perf_cycles(  )
       .io_bram_lhs_req_1_addr( FetchDecoupledStage_io_bram_lhs_req_1_addr ),
       .io_bram_lhs_req_1_writeData( FetchDecoupledStage_io_bram_lhs_req_1_writeData ),
       .io_bram_lhs_req_1_writeEn( FetchDecoupledStage_io_bram_lhs_req_1_writeEn ),
       .io_bram_lhs_req_0_addr( FetchDecoupledStage_io_bram_lhs_req_0_addr ),
       .io_bram_lhs_req_0_writeData( FetchDecoupledStage_io_bram_lhs_req_0_writeData ),
       .io_bram_lhs_req_0_writeEn( FetchDecoupledStage_io_bram_lhs_req_0_writeEn ),
       .io_bram_rhs_req_1_addr( FetchDecoupledStage_io_bram_rhs_req_1_addr ),
       .io_bram_rhs_req_1_writeData( FetchDecoupledStage_io_bram_rhs_req_1_writeData ),
       .io_bram_rhs_req_1_writeEn( FetchDecoupledStage_io_bram_rhs_req_1_writeEn ),
       .io_bram_rhs_req_0_addr( FetchDecoupledStage_io_bram_rhs_req_0_addr ),
       .io_bram_rhs_req_0_writeData( FetchDecoupledStage_io_bram_rhs_req_0_writeData ),
       .io_bram_rhs_req_0_writeEn( FetchDecoupledStage_io_bram_rhs_req_0_writeEn ),
       .io_dram_rd_req_ready( DecoupledInputMux_3_io_in_0_ready ),
       .io_dram_rd_req_valid( FetchDecoupledStage_io_dram_rd_req_valid ),
       .io_dram_rd_req_bits_channelID( FetchDecoupledStage_io_dram_rd_req_bits_channelID ),
       .io_dram_rd_req_bits_isWrite( FetchDecoupledStage_io_dram_rd_req_bits_isWrite ),
       .io_dram_rd_req_bits_addr( FetchDecoupledStage_io_dram_rd_req_bits_addr ),
       .io_dram_rd_req_bits_numBytes( FetchDecoupledStage_io_dram_rd_req_bits_numBytes ),
       .io_dram_rd_req_bits_metaData( FetchDecoupledStage_io_dram_rd_req_bits_metaData ),
       .io_dram_rd_rsp_ready( FetchDecoupledStage_io_dram_rd_rsp_ready ),
       .io_dram_rd_rsp_valid( DecoupledOutputDemux_io_out_0_valid ),
       .io_dram_rd_rsp_bits_channelID( DecoupledOutputDemux_io_out_0_bits_channelID ),
       .io_dram_rd_rsp_bits_readData( DecoupledOutputDemux_io_out_0_bits_readData ),
       .io_dram_rd_rsp_bits_isWrite( DecoupledOutputDemux_io_out_0_bits_isWrite ),
       .io_dram_rd_rsp_bits_isLast( DecoupledOutputDemux_io_out_0_bits_isLast ),
       .io_dram_rd_rsp_bits_metaData( DecoupledOutputDemux_io_out_0_bits_metaData )
  );
  ExecDecoupledStage execStage_direct(.clk(clk), .reset(reset),
       .io_stage_run_ready( execStage_direct_io_stage_run_ready ),
       .io_stage_run_valid( ExecDecoupledController_io_stage_run_valid ),
       .io_stage_run_bits_writeAddr( ExecDecoupledController_io_stage_run_bits_writeAddr ),
       .io_stage_run_bits_writeEn( ExecDecoupledController_io_stage_run_bits_writeEn ),
       .io_stage_run_bits_clear_before_first_accumulation( ExecDecoupledController_io_stage_run_bits_clear_before_first_accumulation ),
       .io_stage_run_bits_negate( ExecDecoupledController_io_stage_run_bits_negate ),
       .io_stage_run_bits_shiftAmount( ExecDecoupledController_io_stage_run_bits_shiftAmount ),
       .io_stage_run_bits_numTiles( ExecDecoupledController_io_stage_run_bits_numTiles ),
       .io_stage_run_bits_rhsOffset( ExecDecoupledController_io_stage_run_bits_rhsOffset ),
       .io_stage_run_bits_lhsOffset( ExecDecoupledController_io_stage_run_bits_lhsOffset ),
       .io_stage_done_valid( execStage_direct_io_stage_done_valid ),
       //.io_stage_done_bits(  )
       //.io_cfg_config_dpu_x(  )
       //.io_cfg_config_dpu_y(  )
       //.io_cfg_config_dpu_z(  )
       //.io_cfg_config_lhs_mem(  )
       //.io_cfg_config_rhs_mem(  )
       .io_tilemem_lhs_req_1_addr( execStage_direct_io_tilemem_lhs_req_1_addr ),
       .io_tilemem_lhs_req_1_writeData( execStage_direct_io_tilemem_lhs_req_1_writeData ),
       .io_tilemem_lhs_req_1_writeEn( execStage_direct_io_tilemem_lhs_req_1_writeEn ),
       .io_tilemem_lhs_req_0_addr( execStage_direct_io_tilemem_lhs_req_0_addr ),
       .io_tilemem_lhs_req_0_writeData( execStage_direct_io_tilemem_lhs_req_0_writeData ),
       .io_tilemem_lhs_req_0_writeEn( execStage_direct_io_tilemem_lhs_req_0_writeEn ),
       .io_tilemem_lhs_rsp_1_readData( AsymPipelinedDualPortBRAM_1_io_ports_1_rsp_readData ),
       .io_tilemem_lhs_rsp_0_readData( AsymPipelinedDualPortBRAM_io_ports_1_rsp_readData ),
       .io_tilemem_rhs_req_1_addr( execStage_direct_io_tilemem_rhs_req_1_addr ),
       .io_tilemem_rhs_req_1_writeData( execStage_direct_io_tilemem_rhs_req_1_writeData ),
       .io_tilemem_rhs_req_1_writeEn( execStage_direct_io_tilemem_rhs_req_1_writeEn ),
       .io_tilemem_rhs_req_0_addr( execStage_direct_io_tilemem_rhs_req_0_addr ),
       .io_tilemem_rhs_req_0_writeData( execStage_direct_io_tilemem_rhs_req_0_writeData ),
       .io_tilemem_rhs_req_0_writeEn( execStage_direct_io_tilemem_rhs_req_0_writeEn ),
       .io_tilemem_rhs_rsp_1_readData( AsymPipelinedDualPortBRAM_3_io_ports_1_rsp_readData ),
       .io_tilemem_rhs_rsp_0_readData( AsymPipelinedDualPortBRAM_2_io_ports_1_rsp_readData ),
       .io_res_req_1_1_addr( execStage_direct_io_res_req_1_1_addr ),
       .io_res_req_1_1_writeData( execStage_direct_io_res_req_1_1_writeData ),
       .io_res_req_1_1_writeEn( execStage_direct_io_res_req_1_1_writeEn ),
       .io_res_req_1_0_addr( execStage_direct_io_res_req_1_0_addr ),
       .io_res_req_1_0_writeData( execStage_direct_io_res_req_1_0_writeData ),
       .io_res_req_1_0_writeEn( execStage_direct_io_res_req_1_0_writeEn ),
       .io_res_req_0_1_addr( execStage_direct_io_res_req_0_1_addr ),
       .io_res_req_0_1_writeData( execStage_direct_io_res_req_0_1_writeData ),
       .io_res_req_0_1_writeEn( execStage_direct_io_res_req_0_1_writeEn ),
       .io_res_req_0_0_addr( execStage_direct_io_res_req_0_0_addr ),
       .io_res_req_0_0_writeData( execStage_direct_io_res_req_0_0_writeData ),
       .io_res_req_0_0_writeEn( execStage_direct_io_res_req_0_0_writeEn )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign execStage_direct.io_tilemem_lhs_req_1_writeData = {2{$random}};
    assign execStage_direct.io_tilemem_lhs_req_0_writeData = {2{$random}};
    assign execStage_direct.io_tilemem_rhs_req_1_writeData = {2{$random}};
    assign execStage_direct.io_tilemem_rhs_req_0_writeData = {2{$random}};
// synthesis translate_on
`endif
  ResultStage ResultStage(.clk(clk), .reset(reset),
       .io_start( ResultController_io_start ),
       .io_done( ResultStage_io_done ),
       .io_csr_waitCompleteBytes( ResultController_io_stageO_waitCompleteBytes ),
       .io_csr_dram_skip( ResultController_io_stageO_dram_skip ),
       .io_csr_dram_base( ResultController_io_stageO_dram_base ),
       .io_csr_resmem_addr( ResultController_io_stageO_resmem_addr ),
       .io_csr_nop( ResultController_io_stageO_nop ),
       .io_dram_wr_req_ready( DecoupledInputMux_4_io_in_0_ready ),
       .io_dram_wr_req_valid( ResultStage_io_dram_wr_req_valid ),
       .io_dram_wr_req_bits_channelID( ResultStage_io_dram_wr_req_bits_channelID ),
       .io_dram_wr_req_bits_isWrite( ResultStage_io_dram_wr_req_bits_isWrite ),
       .io_dram_wr_req_bits_addr( ResultStage_io_dram_wr_req_bits_addr ),
       .io_dram_wr_req_bits_numBytes( ResultStage_io_dram_wr_req_bits_numBytes ),
       .io_dram_wr_req_bits_metaData( ResultStage_io_dram_wr_req_bits_metaData ),
       .io_dram_wr_dat_ready( DecoupledInputMux_5_io_in_0_ready ),
       .io_dram_wr_dat_valid( ResultStage_io_dram_wr_dat_valid ),
       .io_dram_wr_dat_bits( ResultStage_io_dram_wr_dat_bits ),
       .io_dram_wr_rsp_ready( ResultStage_io_dram_wr_rsp_ready ),
       .io_dram_wr_rsp_valid( DecoupledOutputDemux_1_io_out_0_valid ),
       .io_dram_wr_rsp_bits_channelID( DecoupledOutputDemux_1_io_out_0_bits_channelID ),
       .io_dram_wr_rsp_bits_readData( DecoupledOutputDemux_1_io_out_0_bits_readData ),
       .io_dram_wr_rsp_bits_isWrite( DecoupledOutputDemux_1_io_out_0_bits_isWrite ),
       .io_dram_wr_rsp_bits_isLast( DecoupledOutputDemux_1_io_out_0_bits_isLast ),
       .io_dram_wr_rsp_bits_metaData( DecoupledOutputDemux_1_io_out_0_bits_metaData ),
       .io_resmem_req_1_1_addr( ResultStage_io_resmem_req_1_1_addr ),
       .io_resmem_req_1_1_writeData( ResultStage_io_resmem_req_1_1_writeData ),
       .io_resmem_req_1_1_writeEn( ResultStage_io_resmem_req_1_1_writeEn ),
       .io_resmem_req_1_0_addr( ResultStage_io_resmem_req_1_0_addr ),
       .io_resmem_req_1_0_writeData( ResultStage_io_resmem_req_1_0_writeData ),
       .io_resmem_req_1_0_writeEn( ResultStage_io_resmem_req_1_0_writeEn ),
       .io_resmem_req_0_1_addr( ResultStage_io_resmem_req_0_1_addr ),
       .io_resmem_req_0_1_writeData( ResultStage_io_resmem_req_0_1_writeData ),
       .io_resmem_req_0_1_writeEn( ResultStage_io_resmem_req_0_1_writeEn ),
       .io_resmem_req_0_0_addr( ResultStage_io_resmem_req_0_0_addr ),
       .io_resmem_req_0_0_writeData( ResultStage_io_resmem_req_0_0_writeData ),
       .io_resmem_req_0_0_writeEn( ResultStage_io_resmem_req_0_0_writeEn ),
       .io_resmem_rsp_1_1_readData( PipelinedDualPortBRAM_3_b_dout ),
       .io_resmem_rsp_1_0_readData( PipelinedDualPortBRAM_2_b_dout ),
       .io_resmem_rsp_0_1_readData( PipelinedDualPortBRAM_1_b_dout ),
       .io_resmem_rsp_0_0_readData( PipelinedDualPortBRAM_b_dout )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ResultStage.io_resmem_req_1_1_writeData = {1{$random}};
    assign ResultStage.io_resmem_req_1_0_writeData = {1{$random}};
    assign ResultStage.io_resmem_req_0_1_writeData = {1{$random}};
    assign ResultStage.io_resmem_req_0_0_writeData = {1{$random}};
// synthesis translate_on
`endif
  FetchDecoupledController FetchDecoupledController(.clk(clk), .reset(reset),
       .io_op_ready( FetchDecoupledController_io_op_ready ),
       .io_op_valid( FPGAQueue_7_io_deq_valid ),
       .io_op_bits_runcfg_tiles_per_row( FPGAQueue_7_io_deq_bits_runcfg_tiles_per_row ),
       .io_op_bits_runcfg_dram_block_count( FPGAQueue_7_io_deq_bits_runcfg_dram_block_count ),
       .io_op_bits_runcfg_dram_block_offset_bytes( FPGAQueue_7_io_deq_bits_runcfg_dram_block_offset_bytes ),
       .io_op_bits_runcfg_dram_block_size_bytes( FPGAQueue_7_io_deq_bits_runcfg_dram_block_size_bytes ),
       .io_op_bits_runcfg_dram_base( FPGAQueue_7_io_deq_bits_runcfg_dram_base ),
       .io_op_bits_runcfg_bram_addr_base( FPGAQueue_7_io_deq_bits_runcfg_bram_addr_base ),
       .io_op_bits_runcfg_bram_id_range( FPGAQueue_7_io_deq_bits_runcfg_bram_id_range ),
       .io_op_bits_runcfg_bram_id_start( FPGAQueue_7_io_deq_bits_runcfg_bram_id_start ),
       .io_op_bits_unused( FPGAQueue_7_io_deq_bits_unused ),
       .io_op_bits_isRunCfg( FPGAQueue_7_io_deq_bits_isRunCfg ),
       .io_op_bits_targetStage( FPGAQueue_7_io_deq_bits_targetStage ),
       .io_enable( io_fetch_enable ),
       .io_stage_run_ready( FetchDecoupledStage_io_stage_run_ready ),
       .io_stage_run_valid( FetchDecoupledController_io_stage_run_valid ),
       .io_stage_run_bits_tiles_per_row( FetchDecoupledController_io_stage_run_bits_tiles_per_row ),
       .io_stage_run_bits_dram_block_count( FetchDecoupledController_io_stage_run_bits_dram_block_count ),
       .io_stage_run_bits_dram_block_offset_bytes( FetchDecoupledController_io_stage_run_bits_dram_block_offset_bytes ),
       .io_stage_run_bits_dram_block_size_bytes( FetchDecoupledController_io_stage_run_bits_dram_block_size_bytes ),
       .io_stage_run_bits_dram_base( FetchDecoupledController_io_stage_run_bits_dram_base ),
       .io_stage_run_bits_bram_addr_base( FetchDecoupledController_io_stage_run_bits_bram_addr_base ),
       .io_stage_run_bits_bram_id_range( FetchDecoupledController_io_stage_run_bits_bram_id_range ),
       .io_stage_run_bits_bram_id_start( FetchDecoupledController_io_stage_run_bits_bram_id_start ),
       .io_stage_done_valid( FetchDecoupledStage_io_stage_done_valid ),
       //.io_stage_done_bits(  )
       .io_sync_in_0_ready( FetchDecoupledController_io_sync_in_0_ready ),
       .io_sync_in_0_valid( FPGAQueue_io_deq_valid ),
       .io_sync_in_0_bits( FPGAQueue_io_deq_bits ),
       .io_sync_out_0_ready( FPGAQueue_1_io_enq_ready ),
       .io_sync_out_0_valid( FetchDecoupledController_io_sync_out_0_valid ),
       .io_sync_out_0_bits( FetchDecoupledController_io_sync_out_0_bits ),
       .io_perf_start( io_perf_cc_enable ),
       .io_perf_count( FetchDecoupledController_io_perf_count ),
       .io_perf_sel( io_perf_prf_fetch_sel )
  );
  ExecDecoupledController ExecDecoupledController(.clk(clk), .reset(reset),
       .io_op_ready( ExecDecoupledController_io_op_ready ),
       .io_op_valid( FPGAQueue_8_io_deq_valid ),
       .io_op_bits_runcfg_writeAddr( FPGAQueue_8_io_deq_bits_runcfg_writeAddr ),
       .io_op_bits_runcfg_writeEn( FPGAQueue_8_io_deq_bits_runcfg_writeEn ),
       .io_op_bits_runcfg_clear_before_first_accumulation( FPGAQueue_8_io_deq_bits_runcfg_clear_before_first_accumulation ),
       .io_op_bits_runcfg_negate( FPGAQueue_8_io_deq_bits_runcfg_negate ),
       .io_op_bits_runcfg_shiftAmount( FPGAQueue_8_io_deq_bits_runcfg_shiftAmount ),
       .io_op_bits_runcfg_numTiles( FPGAQueue_8_io_deq_bits_runcfg_numTiles ),
       .io_op_bits_runcfg_rhsOffset( FPGAQueue_8_io_deq_bits_runcfg_rhsOffset ),
       .io_op_bits_runcfg_lhsOffset( FPGAQueue_8_io_deq_bits_runcfg_lhsOffset ),
       .io_op_bits_unused( FPGAQueue_8_io_deq_bits_unused ),
       .io_op_bits_isRunCfg( FPGAQueue_8_io_deq_bits_isRunCfg ),
       .io_op_bits_targetStage( FPGAQueue_8_io_deq_bits_targetStage ),
       .io_enable( io_exec_enable ),
       .io_stage_run_ready( execStage_direct_io_stage_run_ready ),
       .io_stage_run_valid( ExecDecoupledController_io_stage_run_valid ),
       .io_stage_run_bits_writeAddr( ExecDecoupledController_io_stage_run_bits_writeAddr ),
       .io_stage_run_bits_writeEn( ExecDecoupledController_io_stage_run_bits_writeEn ),
       .io_stage_run_bits_clear_before_first_accumulation( ExecDecoupledController_io_stage_run_bits_clear_before_first_accumulation ),
       .io_stage_run_bits_negate( ExecDecoupledController_io_stage_run_bits_negate ),
       .io_stage_run_bits_shiftAmount( ExecDecoupledController_io_stage_run_bits_shiftAmount ),
       .io_stage_run_bits_numTiles( ExecDecoupledController_io_stage_run_bits_numTiles ),
       .io_stage_run_bits_rhsOffset( ExecDecoupledController_io_stage_run_bits_rhsOffset ),
       .io_stage_run_bits_lhsOffset( ExecDecoupledController_io_stage_run_bits_lhsOffset ),
       .io_stage_done_valid( execStage_direct_io_stage_done_valid ),
       //.io_stage_done_bits(  )
       .io_sync_in_1_ready( ExecDecoupledController_io_sync_in_1_ready ),
       .io_sync_in_1_valid( FPGAQueue_2_io_deq_valid ),
       .io_sync_in_1_bits( FPGAQueue_2_io_deq_bits ),
       .io_sync_in_0_ready( ExecDecoupledController_io_sync_in_0_ready ),
       .io_sync_in_0_valid( FPGAQueue_1_io_deq_valid ),
       .io_sync_in_0_bits( FPGAQueue_1_io_deq_bits ),
       .io_sync_out_1_ready( FPGAQueue_3_io_enq_ready ),
       .io_sync_out_1_valid( ExecDecoupledController_io_sync_out_1_valid ),
       .io_sync_out_1_bits( ExecDecoupledController_io_sync_out_1_bits ),
       .io_sync_out_0_ready( Arbiter_io_in_0_ready ),
       .io_sync_out_0_valid( ExecDecoupledController_io_sync_out_0_valid ),
       .io_sync_out_0_bits( ExecDecoupledController_io_sync_out_0_bits ),
       .io_perf_start( io_perf_cc_enable ),
       .io_perf_count( ExecDecoupledController_io_perf_count ),
       .io_perf_sel( io_perf_prf_exec_sel )
  );
  ResultController ResultController(.clk(clk), .reset(reset),
       .io_op_ready( ResultController_io_op_ready ),
       .io_op_valid( FPGAQueue_9_io_deq_valid ),
       .io_op_bits_runcfg_waitCompleteBytes( FPGAQueue_9_io_deq_bits_runcfg_waitCompleteBytes ),
       .io_op_bits_runcfg_dram_skip( FPGAQueue_9_io_deq_bits_runcfg_dram_skip ),
       .io_op_bits_runcfg_dram_base( FPGAQueue_9_io_deq_bits_runcfg_dram_base ),
       .io_op_bits_runcfg_resmem_addr( FPGAQueue_9_io_deq_bits_runcfg_resmem_addr ),
       .io_op_bits_runcfg_nop( FPGAQueue_9_io_deq_bits_runcfg_nop ),
       .io_op_bits_unused( FPGAQueue_9_io_deq_bits_unused ),
       .io_op_bits_isRunCfg( FPGAQueue_9_io_deq_bits_isRunCfg ),
       .io_op_bits_targetStage( FPGAQueue_9_io_deq_bits_targetStage ),
       .io_enable( io_result_enable ),
       .io_start( ResultController_io_start ),
       .io_done( ResultStage_io_done ),
       .io_stageO_waitCompleteBytes( ResultController_io_stageO_waitCompleteBytes ),
       .io_stageO_dram_skip( ResultController_io_stageO_dram_skip ),
       .io_stageO_dram_base( ResultController_io_stageO_dram_base ),
       .io_stageO_resmem_addr( ResultController_io_stageO_resmem_addr ),
       .io_stageO_nop( ResultController_io_stageO_nop ),
       .io_sync_in_0_ready( ResultController_io_sync_in_0_ready ),
       .io_sync_in_0_valid( FPGAQueue_3_io_deq_valid ),
       .io_sync_in_0_bits( FPGAQueue_3_io_deq_bits ),
       .io_sync_out_0_ready( Arbiter_1_io_in_0_ready ),
       .io_sync_out_0_valid( ResultController_io_sync_out_0_valid ),
       .io_sync_out_0_bits( ResultController_io_sync_out_0_bits ),
       .io_perf_start( io_perf_cc_enable ),
       .io_perf_count( ResultController_io_perf_count ),
       .io_perf_sel( io_perf_prf_res_sel )
  );
  FPGAQueue_14 FPGAQueue_7(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_7_io_enq_ready ),
       .io_enq_valid( DecoupledInputMux_io_out_valid ),
       .io_enq_bits_runcfg_tiles_per_row( T62 ),
       .io_enq_bits_runcfg_dram_block_count( T61 ),
       .io_enq_bits_runcfg_dram_block_offset_bytes( T60 ),
       .io_enq_bits_runcfg_dram_block_size_bytes( T59 ),
       .io_enq_bits_runcfg_dram_base( T58 ),
       .io_enq_bits_runcfg_bram_addr_base( T57 ),
       .io_enq_bits_runcfg_bram_id_range( T56 ),
       .io_enq_bits_runcfg_bram_id_start( T55 ),
       .io_enq_bits_unused( T54 ),
       .io_enq_bits_isRunCfg( T53 ),
       .io_enq_bits_targetStage( T52 ),
       .io_deq_ready( FetchDecoupledController_io_op_ready ),
       .io_deq_valid( FPGAQueue_7_io_deq_valid ),
       .io_deq_bits_runcfg_tiles_per_row( FPGAQueue_7_io_deq_bits_runcfg_tiles_per_row ),
       .io_deq_bits_runcfg_dram_block_count( FPGAQueue_7_io_deq_bits_runcfg_dram_block_count ),
       .io_deq_bits_runcfg_dram_block_offset_bytes( FPGAQueue_7_io_deq_bits_runcfg_dram_block_offset_bytes ),
       .io_deq_bits_runcfg_dram_block_size_bytes( FPGAQueue_7_io_deq_bits_runcfg_dram_block_size_bytes ),
       .io_deq_bits_runcfg_dram_base( FPGAQueue_7_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_bram_addr_base( FPGAQueue_7_io_deq_bits_runcfg_bram_addr_base ),
       .io_deq_bits_runcfg_bram_id_range( FPGAQueue_7_io_deq_bits_runcfg_bram_id_range ),
       .io_deq_bits_runcfg_bram_id_start( FPGAQueue_7_io_deq_bits_runcfg_bram_id_start ),
       .io_deq_bits_unused( FPGAQueue_7_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_7_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_7_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_7_io_count )
  );
  FPGAQueue_15 FPGAQueue_8(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_8_io_enq_ready ),
       .io_enq_valid( DecoupledInputMux_1_io_out_valid ),
       .io_enq_bits_runcfg_writeAddr( T51 ),
       .io_enq_bits_runcfg_writeEn( T50 ),
       .io_enq_bits_runcfg_clear_before_first_accumulation( T49 ),
       .io_enq_bits_runcfg_negate( T48 ),
       .io_enq_bits_runcfg_shiftAmount( T47 ),
       .io_enq_bits_runcfg_numTiles( T46 ),
       .io_enq_bits_runcfg_rhsOffset( T45 ),
       .io_enq_bits_runcfg_lhsOffset( T44 ),
       .io_enq_bits_unused( T43 ),
       .io_enq_bits_isRunCfg( T42 ),
       .io_enq_bits_targetStage( T41 ),
       .io_deq_ready( ExecDecoupledController_io_op_ready ),
       .io_deq_valid( FPGAQueue_8_io_deq_valid ),
       .io_deq_bits_runcfg_writeAddr( FPGAQueue_8_io_deq_bits_runcfg_writeAddr ),
       .io_deq_bits_runcfg_writeEn( FPGAQueue_8_io_deq_bits_runcfg_writeEn ),
       .io_deq_bits_runcfg_clear_before_first_accumulation( FPGAQueue_8_io_deq_bits_runcfg_clear_before_first_accumulation ),
       .io_deq_bits_runcfg_negate( FPGAQueue_8_io_deq_bits_runcfg_negate ),
       .io_deq_bits_runcfg_shiftAmount( FPGAQueue_8_io_deq_bits_runcfg_shiftAmount ),
       .io_deq_bits_runcfg_numTiles( FPGAQueue_8_io_deq_bits_runcfg_numTiles ),
       .io_deq_bits_runcfg_rhsOffset( FPGAQueue_8_io_deq_bits_runcfg_rhsOffset ),
       .io_deq_bits_runcfg_lhsOffset( FPGAQueue_8_io_deq_bits_runcfg_lhsOffset ),
       .io_deq_bits_unused( FPGAQueue_8_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_8_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_8_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_8_io_count )
  );
  FPGAQueue_16 FPGAQueue_9(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_9_io_enq_ready ),
       .io_enq_valid( DecoupledInputMux_2_io_out_valid ),
       .io_enq_bits_runcfg_waitCompleteBytes( T40 ),
       .io_enq_bits_runcfg_dram_skip( T39 ),
       .io_enq_bits_runcfg_dram_base( T38 ),
       .io_enq_bits_runcfg_resmem_addr( T37 ),
       .io_enq_bits_runcfg_nop( T36 ),
       .io_enq_bits_unused( T35 ),
       .io_enq_bits_isRunCfg( T34 ),
       .io_enq_bits_targetStage( T33 ),
       .io_deq_ready( ResultController_io_op_ready ),
       .io_deq_valid( FPGAQueue_9_io_deq_valid ),
       .io_deq_bits_runcfg_waitCompleteBytes( FPGAQueue_9_io_deq_bits_runcfg_waitCompleteBytes ),
       .io_deq_bits_runcfg_dram_skip( FPGAQueue_9_io_deq_bits_runcfg_dram_skip ),
       .io_deq_bits_runcfg_dram_base( FPGAQueue_9_io_deq_bits_runcfg_dram_base ),
       .io_deq_bits_runcfg_resmem_addr( FPGAQueue_9_io_deq_bits_runcfg_resmem_addr ),
       .io_deq_bits_runcfg_nop( FPGAQueue_9_io_deq_bits_runcfg_nop ),
       .io_deq_bits_unused( FPGAQueue_9_io_deq_bits_unused ),
       .io_deq_bits_isRunCfg( FPGAQueue_9_io_deq_bits_isRunCfg ),
       .io_deq_bits_targetStage( FPGAQueue_9_io_deq_bits_targetStage ),
       .io_count( FPGAQueue_9_io_count )
  );
  AsymPipelinedDualPortBRAM AsymPipelinedDualPortBRAM(.clk(clk),
       .io_ports_1_req_addr( execStage_direct_io_tilemem_lhs_req_0_addr ),
       .io_ports_1_req_writeData( execStage_direct_io_tilemem_lhs_req_0_writeData ),
       .io_ports_1_req_writeEn( execStage_direct_io_tilemem_lhs_req_0_writeEn ),
       .io_ports_1_rsp_readData( AsymPipelinedDualPortBRAM_io_ports_1_rsp_readData ),
       .io_ports_0_req_addr( FetchDecoupledStage_io_bram_lhs_req_0_addr ),
       .io_ports_0_req_writeData( FetchDecoupledStage_io_bram_lhs_req_0_writeData ),
       .io_ports_0_req_writeEn( FetchDecoupledStage_io_bram_lhs_req_0_writeEn )
       //.io_ports_0_rsp_readData(  )
  );
  AsymPipelinedDualPortBRAM AsymPipelinedDualPortBRAM_1(.clk(clk),
       .io_ports_1_req_addr( execStage_direct_io_tilemem_lhs_req_1_addr ),
       .io_ports_1_req_writeData( execStage_direct_io_tilemem_lhs_req_1_writeData ),
       .io_ports_1_req_writeEn( execStage_direct_io_tilemem_lhs_req_1_writeEn ),
       .io_ports_1_rsp_readData( AsymPipelinedDualPortBRAM_1_io_ports_1_rsp_readData ),
       .io_ports_0_req_addr( FetchDecoupledStage_io_bram_lhs_req_1_addr ),
       .io_ports_0_req_writeData( FetchDecoupledStage_io_bram_lhs_req_1_writeData ),
       .io_ports_0_req_writeEn( FetchDecoupledStage_io_bram_lhs_req_1_writeEn )
       //.io_ports_0_rsp_readData(  )
  );
  AsymPipelinedDualPortBRAM AsymPipelinedDualPortBRAM_2(.clk(clk),
       .io_ports_1_req_addr( execStage_direct_io_tilemem_rhs_req_0_addr ),
       .io_ports_1_req_writeData( execStage_direct_io_tilemem_rhs_req_0_writeData ),
       .io_ports_1_req_writeEn( execStage_direct_io_tilemem_rhs_req_0_writeEn ),
       .io_ports_1_rsp_readData( AsymPipelinedDualPortBRAM_2_io_ports_1_rsp_readData ),
       .io_ports_0_req_addr( FetchDecoupledStage_io_bram_rhs_req_0_addr ),
       .io_ports_0_req_writeData( FetchDecoupledStage_io_bram_rhs_req_0_writeData ),
       .io_ports_0_req_writeEn( FetchDecoupledStage_io_bram_rhs_req_0_writeEn )
       //.io_ports_0_rsp_readData(  )
  );
  AsymPipelinedDualPortBRAM AsymPipelinedDualPortBRAM_3(.clk(clk),
       .io_ports_1_req_addr( execStage_direct_io_tilemem_rhs_req_1_addr ),
       .io_ports_1_req_writeData( execStage_direct_io_tilemem_rhs_req_1_writeData ),
       .io_ports_1_req_writeEn( execStage_direct_io_tilemem_rhs_req_1_writeEn ),
       .io_ports_1_rsp_readData( AsymPipelinedDualPortBRAM_3_io_ports_1_rsp_readData ),
       .io_ports_0_req_addr( FetchDecoupledStage_io_bram_rhs_req_1_addr ),
       .io_ports_0_req_writeData( FetchDecoupledStage_io_bram_rhs_req_1_writeData ),
       .io_ports_0_req_writeEn( FetchDecoupledStage_io_bram_rhs_req_1_writeEn )
       //.io_ports_0_rsp_readData(  )
  );
  PipelinedDualPortBRAM_0 PipelinedDualPortBRAM(.clk(clk),
       .b_addr( ResultStage_io_resmem_req_0_0_addr ),
       .b_din( ResultStage_io_resmem_req_0_0_writeData ),
       .b_wr( ResultStage_io_resmem_req_0_0_writeEn ),
       .b_dout( PipelinedDualPortBRAM_b_dout ),
       .a_addr( execStage_direct_io_res_req_0_0_addr ),
       .a_din( execStage_direct_io_res_req_0_0_writeData ),
       .a_wr( execStage_direct_io_res_req_0_0_writeEn )
       //.a_dout(  )
  );
  PipelinedDualPortBRAM_0 PipelinedDualPortBRAM_1(.clk(clk),
       .b_addr( ResultStage_io_resmem_req_0_1_addr ),
       .b_din( ResultStage_io_resmem_req_0_1_writeData ),
       .b_wr( ResultStage_io_resmem_req_0_1_writeEn ),
       .b_dout( PipelinedDualPortBRAM_1_b_dout ),
       .a_addr( execStage_direct_io_res_req_0_1_addr ),
       .a_din( execStage_direct_io_res_req_0_1_writeData ),
       .a_wr( execStage_direct_io_res_req_0_1_writeEn )
       //.a_dout(  )
  );
  PipelinedDualPortBRAM_0 PipelinedDualPortBRAM_2(.clk(clk),
       .b_addr( ResultStage_io_resmem_req_1_0_addr ),
       .b_din( ResultStage_io_resmem_req_1_0_writeData ),
       .b_wr( ResultStage_io_resmem_req_1_0_writeEn ),
       .b_dout( PipelinedDualPortBRAM_2_b_dout ),
       .a_addr( execStage_direct_io_res_req_1_0_addr ),
       .a_din( execStage_direct_io_res_req_1_0_writeData ),
       .a_wr( execStage_direct_io_res_req_1_0_writeEn )
       //.a_dout(  )
  );
  PipelinedDualPortBRAM_0 PipelinedDualPortBRAM_3(.clk(clk),
       .b_addr( ResultStage_io_resmem_req_1_1_addr ),
       .b_din( ResultStage_io_resmem_req_1_1_writeData ),
       .b_wr( ResultStage_io_resmem_req_1_1_writeEn ),
       .b_dout( PipelinedDualPortBRAM_3_b_dout ),
       .a_addr( execStage_direct_io_res_req_1_1_addr ),
       .a_din( execStage_direct_io_res_req_1_1_writeData ),
       .a_wr( execStage_direct_io_res_req_1_1_writeEn )
       //.a_dout(  )
  );
  FPGAQueue_0 FPGAQueue(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_io_enq_ready ),
       .io_enq_valid( Arbiter_io_out_valid ),
       .io_enq_bits( Arbiter_io_out_bits ),
       .io_deq_ready( FetchDecoupledController_io_sync_in_0_ready ),
       .io_deq_valid( FPGAQueue_io_deq_valid ),
       .io_deq_bits( FPGAQueue_io_deq_bits ),
       .io_count( FPGAQueue_io_count )
  );
  FPGAQueue_0 FPGAQueue_1(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_1_io_enq_ready ),
       .io_enq_valid( FetchDecoupledController_io_sync_out_0_valid ),
       .io_enq_bits( FetchDecoupledController_io_sync_out_0_bits ),
       .io_deq_ready( ExecDecoupledController_io_sync_in_0_ready ),
       .io_deq_valid( FPGAQueue_1_io_deq_valid ),
       .io_deq_bits( FPGAQueue_1_io_deq_bits ),
       .io_count( FPGAQueue_1_io_count )
  );
  FPGAQueue_0 FPGAQueue_2(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_2_io_enq_ready ),
       .io_enq_valid( Arbiter_1_io_out_valid ),
       .io_enq_bits( Arbiter_1_io_out_bits ),
       .io_deq_ready( ExecDecoupledController_io_sync_in_1_ready ),
       .io_deq_valid( FPGAQueue_2_io_deq_valid ),
       .io_deq_bits( FPGAQueue_2_io_deq_bits ),
       .io_count( FPGAQueue_2_io_count )
  );
  FPGAQueue_0 FPGAQueue_3(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_3_io_enq_ready ),
       .io_enq_valid( ExecDecoupledController_io_sync_out_1_valid ),
       .io_enq_bits( ExecDecoupledController_io_sync_out_1_bits ),
       .io_deq_ready( ResultController_io_sync_in_0_ready ),
       .io_deq_valid( FPGAQueue_3_io_deq_valid ),
       .io_deq_bits( FPGAQueue_3_io_deq_bits ),
       .io_count( FPGAQueue_3_io_count )
  );
  StreamDeinterleaverQueued StreamDeinterleaverQueued(.clk(clk), .reset(reset),
       .io_in_ready( StreamDeinterleaverQueued_io_in_ready ),
       .io_in_valid( T30 ),
       .io_in_bits( io_ins_bits ),
       .io_out_2_ready( DecoupledInputMux_2_io_in_0_ready ),
       .io_out_2_valid( StreamDeinterleaverQueued_io_out_2_valid ),
       .io_out_2_bits( StreamDeinterleaverQueued_io_out_2_bits ),
       .io_out_1_ready( DecoupledInputMux_1_io_in_0_ready ),
       .io_out_1_valid( StreamDeinterleaverQueued_io_out_1_valid ),
       .io_out_1_bits( StreamDeinterleaverQueued_io_out_1_bits ),
       .io_out_0_ready( DecoupledInputMux_io_in_0_ready ),
       .io_out_0_valid( StreamDeinterleaverQueued_io_out_0_valid ),
       .io_out_0_bits( StreamDeinterleaverQueued_io_out_0_bits )
       //.io_decodeErrors(  )
  );
  ExecInstrGen ExecInstrGen(.ap_clk(clk),
       .in_V_V_TREADY( ExecInstrGen_in_V_V_TREADY ),
       .in_V_V_TVALID( T28 ),
       .in_V_V_TDATA( FPGAQueue_4_io_deq_bits ),
       .out_V_V_TREADY( DecoupledInputMux_1_io_in_1_ready ),
       .out_V_V_TVALID( ExecInstrGen_out_V_V_TVALID ),
       .out_V_V_TDATA( ExecInstrGen_out_V_V_TDATA ),
       .ap_rst_n( T27 )
  );
  FetchInstrGen FetchInstrGen(.ap_clk(clk),
       .in_V_V_TREADY( FetchInstrGen_in_V_V_TREADY ),
       .in_V_V_TVALID( T25 ),
       .in_V_V_TDATA( FPGAQueue_4_io_deq_bits ),
       .out_V_V_TREADY( DecoupledInputMux_io_in_1_ready ),
       .out_V_V_TVALID( FetchInstrGen_out_V_V_TVALID ),
       .out_V_V_TDATA( FetchInstrGen_out_V_V_TDATA ),
       .ap_rst_n( T24 )
  );
  ResultInstrGen ResultInstrGen(.ap_clk(clk),
       .in_V_V_TREADY( ResultInstrGen_in_V_V_TREADY ),
       .in_V_V_TVALID( T22 ),
       .in_V_V_TDATA( FPGAQueue_4_io_deq_bits ),
       .out_V_V_TREADY( DecoupledInputMux_2_io_in_1_ready ),
       .out_V_V_TVALID( ResultInstrGen_out_V_V_TVALID ),
       .out_V_V_TDATA( ResultInstrGen_out_V_V_TDATA ),
       .ap_rst_n( T21 )
  );
  FPGAQueue_1 FPGAQueue_4(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_4_io_enq_ready ),
       .io_enq_valid( T18 ),
       .io_enq_bits( io_dsc_bits ),
       .io_deq_ready( T16 ),
       .io_deq_valid( FPGAQueue_4_io_deq_valid ),
       .io_deq_bits( FPGAQueue_4_io_deq_bits )
       //.io_count(  )
  );
  DecoupledInputMux_0 DecoupledInputMux(
       .io_sel( io_insOrDsc ),
       .io_in_1_ready( DecoupledInputMux_io_in_1_ready ),
       .io_in_1_valid( FetchInstrGen_out_V_V_TVALID ),
       .io_in_1_bits( FetchInstrGen_out_V_V_TDATA ),
       .io_in_0_ready( DecoupledInputMux_io_in_0_ready ),
       .io_in_0_valid( StreamDeinterleaverQueued_io_out_0_valid ),
       .io_in_0_bits( StreamDeinterleaverQueued_io_out_0_bits ),
       .io_out_ready( FPGAQueue_7_io_enq_ready ),
       .io_out_valid( DecoupledInputMux_io_out_valid ),
       .io_out_bits( DecoupledInputMux_io_out_bits )
  );
  DecoupledInputMux_0 DecoupledInputMux_1(
       .io_sel( io_insOrDsc ),
       .io_in_1_ready( DecoupledInputMux_1_io_in_1_ready ),
       .io_in_1_valid( ExecInstrGen_out_V_V_TVALID ),
       .io_in_1_bits( ExecInstrGen_out_V_V_TDATA ),
       .io_in_0_ready( DecoupledInputMux_1_io_in_0_ready ),
       .io_in_0_valid( StreamDeinterleaverQueued_io_out_1_valid ),
       .io_in_0_bits( StreamDeinterleaverQueued_io_out_1_bits ),
       .io_out_ready( FPGAQueue_8_io_enq_ready ),
       .io_out_valid( DecoupledInputMux_1_io_out_valid ),
       .io_out_bits( DecoupledInputMux_1_io_out_bits )
  );
  DecoupledInputMux_0 DecoupledInputMux_2(
       .io_sel( io_insOrDsc ),
       .io_in_1_ready( DecoupledInputMux_2_io_in_1_ready ),
       .io_in_1_valid( ResultInstrGen_out_V_V_TVALID ),
       .io_in_1_bits( ResultInstrGen_out_V_V_TDATA ),
       .io_in_0_ready( DecoupledInputMux_2_io_in_0_ready ),
       .io_in_0_valid( StreamDeinterleaverQueued_io_out_2_valid ),
       .io_in_0_bits( StreamDeinterleaverQueued_io_out_2_bits ),
       .io_out_ready( FPGAQueue_9_io_enq_ready ),
       .io_out_valid( DecoupledInputMux_2_io_out_valid ),
       .io_out_bits( DecoupledInputMux_2_io_out_bits )
  );
  Arbiter Arbiter(
       //.io_in_1_ready(  )
       .io_in_1_valid( T13 ),
       .io_in_1_bits( 1'h0 ),
       .io_in_0_ready( Arbiter_io_in_0_ready ),
       .io_in_0_valid( ExecDecoupledController_io_sync_out_0_valid ),
       .io_in_0_bits( ExecDecoupledController_io_sync_out_0_bits ),
       .io_out_ready( FPGAQueue_io_enq_ready ),
       .io_out_valid( Arbiter_io_out_valid ),
       .io_out_bits( Arbiter_io_out_bits )
       //.io_chosen(  )
  );
  Arbiter Arbiter_1(
       //.io_in_1_ready(  )
       .io_in_1_valid( T10 ),
       .io_in_1_bits( 1'h0 ),
       .io_in_0_ready( Arbiter_1_io_in_0_ready ),
       .io_in_0_valid( ResultController_io_sync_out_0_valid ),
       .io_in_0_bits( ResultController_io_sync_out_0_bits ),
       .io_out_ready( FPGAQueue_2_io_enq_ready ),
       .io_out_valid( Arbiter_1_io_out_valid ),
       .io_out_bits( Arbiter_1_io_out_bits )
       //.io_chosen(  )
  );
  StandAloneP2SAccel StandAloneP2SAccel(.clk(clk), .reset(reset),
       .io_memPort_0_memRdReq_ready( DecoupledInputMux_3_io_in_1_ready ),
       .io_memPort_0_memRdReq_valid( StandAloneP2SAccel_io_memPort_0_memRdReq_valid ),
       .io_memPort_0_memRdReq_bits_channelID( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_channelID ),
       .io_memPort_0_memRdReq_bits_isWrite( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_isWrite ),
       .io_memPort_0_memRdReq_bits_addr( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_addr ),
       .io_memPort_0_memRdReq_bits_numBytes( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_numBytes ),
       .io_memPort_0_memRdReq_bits_metaData( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_metaData ),
       .io_memPort_0_memRdRsp_ready( StandAloneP2SAccel_io_memPort_0_memRdRsp_ready ),
       .io_memPort_0_memRdRsp_valid( DecoupledOutputDemux_io_out_1_valid ),
       .io_memPort_0_memRdRsp_bits_channelID( T88 ),
       .io_memPort_0_memRdRsp_bits_readData( DecoupledOutputDemux_io_out_1_bits_readData ),
       .io_memPort_0_memRdRsp_bits_isWrite( DecoupledOutputDemux_io_out_1_bits_isWrite ),
       .io_memPort_0_memRdRsp_bits_isLast( DecoupledOutputDemux_io_out_1_bits_isLast ),
       .io_memPort_0_memRdRsp_bits_metaData( DecoupledOutputDemux_io_out_1_bits_metaData ),
       .io_memPort_0_memWrReq_ready( DecoupledInputMux_4_io_in_1_ready ),
       .io_memPort_0_memWrReq_valid( StandAloneP2SAccel_io_memPort_0_memWrReq_valid ),
       .io_memPort_0_memWrReq_bits_channelID( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_channelID ),
       .io_memPort_0_memWrReq_bits_isWrite( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_isWrite ),
       .io_memPort_0_memWrReq_bits_addr( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_addr ),
       .io_memPort_0_memWrReq_bits_numBytes( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_numBytes ),
       .io_memPort_0_memWrReq_bits_metaData( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_metaData ),
       .io_memPort_0_memWrDat_ready( DecoupledInputMux_5_io_in_1_ready ),
       .io_memPort_0_memWrDat_valid( StandAloneP2SAccel_io_memPort_0_memWrDat_valid ),
       .io_memPort_0_memWrDat_bits( StandAloneP2SAccel_io_memPort_0_memWrDat_bits ),
       .io_memPort_0_memWrRsp_ready( StandAloneP2SAccel_io_memPort_0_memWrRsp_ready ),
       .io_memPort_0_memWrRsp_valid( DecoupledOutputDemux_1_io_out_1_valid ),
       .io_memPort_0_memWrRsp_bits_channelID( T87 ),
       .io_memPort_0_memWrRsp_bits_readData( DecoupledOutputDemux_1_io_out_1_bits_readData ),
       .io_memPort_0_memWrRsp_bits_isWrite( DecoupledOutputDemux_1_io_out_1_bits_isWrite ),
       .io_memPort_0_memWrRsp_bits_isLast( DecoupledOutputDemux_1_io_out_1_bits_isLast ),
       .io_memPort_0_memWrRsp_bits_metaData( DecoupledOutputDemux_1_io_out_1_bits_metaData ),
       //.io_signature(  )
       .io_p2sCmd_ready( StandAloneP2SAccel_io_p2sCmd_ready ),
       .io_p2sCmd_valid( T9 ),
       .io_p2sCmd_bits_dramBaseAddrSrc( FPGAQueue_5_io_deq_bits_dramBaseAddrSrc ),
       .io_p2sCmd_bits_dramBaseAddrDst( FPGAQueue_5_io_deq_bits_dramBaseAddrDst ),
       .io_p2sCmd_bits_matrixRows( FPGAQueue_5_io_deq_bits_matrixRows ),
       .io_p2sCmd_bits_matrixColsGroup( FPGAQueue_5_io_deq_bits_matrixColsGroup ),
       .io_p2sCmd_bits_actualPrecision( FPGAQueue_5_io_deq_bits_actualPrecision ),
       .io_p2sCmd_bits_waitCompleteBytes( FPGAQueue_5_io_deq_bits_waitCompleteBytes ),
       .io_p2sCmd_bits_signed( FPGAQueue_5_io_deq_bits_signed ),
       .io_ack_ready( T8 ),
       .io_ack_valid( StandAloneP2SAccel_io_ack_valid ),
       .io_ack_bits( StandAloneP2SAccel_io_ack_bits )
  );
  FPGAQueue_2 FPGAQueue_5(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_5_io_enq_ready ),
       .io_enq_valid( T5 ),
       .io_enq_bits_dramBaseAddrSrc( io_cmdqueue_bits_dramBaseAddrSrc ),
       .io_enq_bits_dramBaseAddrDst( io_cmdqueue_bits_dramBaseAddrDst ),
       .io_enq_bits_matrixRows( io_cmdqueue_bits_matrixRows ),
       .io_enq_bits_matrixColsGroup( io_cmdqueue_bits_matrixColsGroup ),
       .io_enq_bits_actualPrecision( io_cmdqueue_bits_actualPrecision ),
       .io_enq_bits_waitCompleteBytes( io_cmdqueue_bits_waitCompleteBytes ),
       .io_enq_bits_signed( io_cmdqueue_bits_signed ),
       .io_deq_ready( T4 ),
       .io_deq_valid( FPGAQueue_5_io_deq_valid ),
       .io_deq_bits_dramBaseAddrSrc( FPGAQueue_5_io_deq_bits_dramBaseAddrSrc ),
       .io_deq_bits_dramBaseAddrDst( FPGAQueue_5_io_deq_bits_dramBaseAddrDst ),
       .io_deq_bits_matrixRows( FPGAQueue_5_io_deq_bits_matrixRows ),
       .io_deq_bits_matrixColsGroup( FPGAQueue_5_io_deq_bits_matrixColsGroup ),
       .io_deq_bits_actualPrecision( FPGAQueue_5_io_deq_bits_actualPrecision ),
       .io_deq_bits_waitCompleteBytes( FPGAQueue_5_io_deq_bits_waitCompleteBytes ),
       .io_deq_bits_signed( FPGAQueue_5_io_deq_bits_signed )
       //.io_count(  )
  );
  FPGAQueue_3 FPGAQueue_6(.clk(clk), .reset(reset),
       .io_enq_ready( FPGAQueue_6_io_enq_ready ),
       .io_enq_valid( T3 ),
       .io_enq_bits( StandAloneP2SAccel_io_ack_bits ),
       .io_deq_ready( T0 ),
       .io_deq_valid( FPGAQueue_6_io_deq_valid ),
       .io_deq_bits( FPGAQueue_6_io_deq_bits )
       //.io_count(  )
  );
  DecoupledInputMux_1 DecoupledInputMux_3(
       .io_sel( io_enable ),
       .io_in_1_ready( DecoupledInputMux_3_io_in_1_ready ),
       .io_in_1_valid( StandAloneP2SAccel_io_memPort_0_memRdReq_valid ),
       .io_in_1_bits_channelID( T86 ),
       .io_in_1_bits_isWrite( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_isWrite ),
       .io_in_1_bits_addr( T85 ),
       .io_in_1_bits_numBytes( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_numBytes ),
       .io_in_1_bits_metaData( StandAloneP2SAccel_io_memPort_0_memRdReq_bits_metaData ),
       .io_in_0_ready( DecoupledInputMux_3_io_in_0_ready ),
       .io_in_0_valid( FetchDecoupledStage_io_dram_rd_req_valid ),
       .io_in_0_bits_channelID( FetchDecoupledStage_io_dram_rd_req_bits_channelID ),
       .io_in_0_bits_isWrite( FetchDecoupledStage_io_dram_rd_req_bits_isWrite ),
       .io_in_0_bits_addr( FetchDecoupledStage_io_dram_rd_req_bits_addr ),
       .io_in_0_bits_numBytes( FetchDecoupledStage_io_dram_rd_req_bits_numBytes ),
       .io_in_0_bits_metaData( FetchDecoupledStage_io_dram_rd_req_bits_metaData ),
       .io_out_ready( io_memPort_0_memRdReq_ready ),
       .io_out_valid( DecoupledInputMux_3_io_out_valid ),
       .io_out_bits_channelID( DecoupledInputMux_3_io_out_bits_channelID ),
       .io_out_bits_isWrite( DecoupledInputMux_3_io_out_bits_isWrite ),
       .io_out_bits_addr( DecoupledInputMux_3_io_out_bits_addr ),
       .io_out_bits_numBytes( DecoupledInputMux_3_io_out_bits_numBytes ),
       .io_out_bits_metaData( DecoupledInputMux_3_io_out_bits_metaData )
  );
  DecoupledInputMux_1 DecoupledInputMux_4(
       .io_sel( io_enable ),
       .io_in_1_ready( DecoupledInputMux_4_io_in_1_ready ),
       .io_in_1_valid( StandAloneP2SAccel_io_memPort_0_memWrReq_valid ),
       .io_in_1_bits_channelID( T84 ),
       .io_in_1_bits_isWrite( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_isWrite ),
       .io_in_1_bits_addr( T83 ),
       .io_in_1_bits_numBytes( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_numBytes ),
       .io_in_1_bits_metaData( StandAloneP2SAccel_io_memPort_0_memWrReq_bits_metaData ),
       .io_in_0_ready( DecoupledInputMux_4_io_in_0_ready ),
       .io_in_0_valid( ResultStage_io_dram_wr_req_valid ),
       .io_in_0_bits_channelID( ResultStage_io_dram_wr_req_bits_channelID ),
       .io_in_0_bits_isWrite( ResultStage_io_dram_wr_req_bits_isWrite ),
       .io_in_0_bits_addr( ResultStage_io_dram_wr_req_bits_addr ),
       .io_in_0_bits_numBytes( ResultStage_io_dram_wr_req_bits_numBytes ),
       .io_in_0_bits_metaData( ResultStage_io_dram_wr_req_bits_metaData ),
       .io_out_ready( io_memPort_0_memWrReq_ready ),
       .io_out_valid( DecoupledInputMux_4_io_out_valid ),
       .io_out_bits_channelID( DecoupledInputMux_4_io_out_bits_channelID ),
       .io_out_bits_isWrite( DecoupledInputMux_4_io_out_bits_isWrite ),
       .io_out_bits_addr( DecoupledInputMux_4_io_out_bits_addr ),
       .io_out_bits_numBytes( DecoupledInputMux_4_io_out_bits_numBytes ),
       .io_out_bits_metaData( DecoupledInputMux_4_io_out_bits_metaData )
  );
  DecoupledInputMux_2 DecoupledInputMux_5(
       .io_sel( io_enable ),
       .io_in_1_ready( DecoupledInputMux_5_io_in_1_ready ),
       .io_in_1_valid( StandAloneP2SAccel_io_memPort_0_memWrDat_valid ),
       .io_in_1_bits( StandAloneP2SAccel_io_memPort_0_memWrDat_bits ),
       .io_in_0_ready( DecoupledInputMux_5_io_in_0_ready ),
       .io_in_0_valid( ResultStage_io_dram_wr_dat_valid ),
       .io_in_0_bits( ResultStage_io_dram_wr_dat_bits ),
       .io_out_ready( io_memPort_0_memWrDat_ready ),
       .io_out_valid( DecoupledInputMux_5_io_out_valid ),
       .io_out_bits( DecoupledInputMux_5_io_out_bits )
  );
  DecoupledOutputDemux DecoupledOutputDemux(
       .io_sel( io_enable ),
       .io_in_ready( DecoupledOutputDemux_io_in_ready ),
       .io_in_valid( io_memPort_0_memRdRsp_valid ),
       .io_in_bits_channelID( T82 ),
       .io_in_bits_readData( io_memPort_0_memRdRsp_bits_readData ),
       .io_in_bits_isWrite( io_memPort_0_memRdRsp_bits_isWrite ),
       .io_in_bits_isLast( io_memPort_0_memRdRsp_bits_isLast ),
       .io_in_bits_metaData( io_memPort_0_memRdRsp_bits_metaData ),
       .io_out_1_ready( StandAloneP2SAccel_io_memPort_0_memRdRsp_ready ),
       .io_out_1_valid( DecoupledOutputDemux_io_out_1_valid ),
       .io_out_1_bits_channelID( DecoupledOutputDemux_io_out_1_bits_channelID ),
       .io_out_1_bits_readData( DecoupledOutputDemux_io_out_1_bits_readData ),
       .io_out_1_bits_isWrite( DecoupledOutputDemux_io_out_1_bits_isWrite ),
       .io_out_1_bits_isLast( DecoupledOutputDemux_io_out_1_bits_isLast ),
       .io_out_1_bits_metaData( DecoupledOutputDemux_io_out_1_bits_metaData ),
       .io_out_0_ready( FetchDecoupledStage_io_dram_rd_rsp_ready ),
       .io_out_0_valid( DecoupledOutputDemux_io_out_0_valid ),
       .io_out_0_bits_channelID( DecoupledOutputDemux_io_out_0_bits_channelID ),
       .io_out_0_bits_readData( DecoupledOutputDemux_io_out_0_bits_readData ),
       .io_out_0_bits_isWrite( DecoupledOutputDemux_io_out_0_bits_isWrite ),
       .io_out_0_bits_isLast( DecoupledOutputDemux_io_out_0_bits_isLast ),
       .io_out_0_bits_metaData( DecoupledOutputDemux_io_out_0_bits_metaData )
  );
  DecoupledOutputDemux DecoupledOutputDemux_1(
       .io_sel( io_enable ),
       .io_in_ready( DecoupledOutputDemux_1_io_in_ready ),
       .io_in_valid( io_memPort_0_memWrRsp_valid ),
       .io_in_bits_channelID( T81 ),
       .io_in_bits_readData( io_memPort_0_memWrRsp_bits_readData ),
       .io_in_bits_isWrite( io_memPort_0_memWrRsp_bits_isWrite ),
       .io_in_bits_isLast( io_memPort_0_memWrRsp_bits_isLast ),
       .io_in_bits_metaData( io_memPort_0_memWrRsp_bits_metaData ),
       .io_out_1_ready( StandAloneP2SAccel_io_memPort_0_memWrRsp_ready ),
       .io_out_1_valid( DecoupledOutputDemux_1_io_out_1_valid ),
       .io_out_1_bits_channelID( DecoupledOutputDemux_1_io_out_1_bits_channelID ),
       .io_out_1_bits_readData( DecoupledOutputDemux_1_io_out_1_bits_readData ),
       .io_out_1_bits_isWrite( DecoupledOutputDemux_1_io_out_1_bits_isWrite ),
       .io_out_1_bits_isLast( DecoupledOutputDemux_1_io_out_1_bits_isLast ),
       .io_out_1_bits_metaData( DecoupledOutputDemux_1_io_out_1_bits_metaData ),
       .io_out_0_ready( ResultStage_io_dram_wr_rsp_ready ),
       .io_out_0_valid( DecoupledOutputDemux_1_io_out_0_valid ),
       .io_out_0_bits_channelID( DecoupledOutputDemux_1_io_out_0_bits_channelID ),
       .io_out_0_bits_readData( DecoupledOutputDemux_1_io_out_0_bits_readData ),
       .io_out_0_bits_isWrite( DecoupledOutputDemux_1_io_out_0_bits_isWrite ),
       .io_out_0_bits_isLast( DecoupledOutputDemux_1_io_out_0_bits_isLast ),
       .io_out_0_bits_metaData( DecoupledOutputDemux_1_io_out_0_bits_metaData )
  );

  always @(posedge clk) begin
    R2 <= io_ackqueue_ready;
    R7 <= io_cmdqueue_valid;
    R12 <= io_addtoken_re;
    R15 <= io_addtoken_ef;
    R20 <= io_dsc_valid;
    R32 <= io_ins_valid;
    if(reset) begin
      regCC <= 32'h0;
    end else if(T68) begin
      regCC <= T67;
    end else if(T65) begin
      regCC <= 32'h0;
    end
    regCCEnablePrev <= io_perf_cc_enable;
  end
endmodule

module RegFile(input clk, input reset,
    input  io_extIF_cmd_valid,
    input [5:0] io_extIF_cmd_bits_regID,
    input  io_extIF_cmd_bits_read,
    input  io_extIF_cmd_bits_write,
    input [31:0] io_extIF_cmd_bits_writeData,
    output io_extIF_readData_valid,
    output[31:0] io_extIF_readData_bits,
    output[5:0] io_extIF_regCount,
    output[31:0] io_regOut_59,
    output[31:0] io_regOut_58,
    output[31:0] io_regOut_57,
    output[31:0] io_regOut_56,
    output[31:0] io_regOut_55,
    output[31:0] io_regOut_54,
    output[31:0] io_regOut_53,
    output[31:0] io_regOut_52,
    output[31:0] io_regOut_51,
    output[31:0] io_regOut_50,
    output[31:0] io_regOut_49,
    output[31:0] io_regOut_48,
    output[31:0] io_regOut_47,
    output[31:0] io_regOut_46,
    output[31:0] io_regOut_45,
    output[31:0] io_regOut_44,
    output[31:0] io_regOut_43,
    output[31:0] io_regOut_42,
    output[31:0] io_regOut_41,
    output[31:0] io_regOut_40,
    output[31:0] io_regOut_39,
    output[31:0] io_regOut_38,
    output[31:0] io_regOut_37,
    output[31:0] io_regOut_36,
    output[31:0] io_regOut_35,
    output[31:0] io_regOut_34,
    output[31:0] io_regOut_33,
    output[31:0] io_regOut_32,
    output[31:0] io_regOut_31,
    output[31:0] io_regOut_30,
    output[31:0] io_regOut_29,
    output[31:0] io_regOut_28,
    output[31:0] io_regOut_27,
    output[31:0] io_regOut_26,
    output[31:0] io_regOut_25,
    output[31:0] io_regOut_24,
    output[31:0] io_regOut_23,
    output[31:0] io_regOut_22,
    output[31:0] io_regOut_21,
    output[31:0] io_regOut_20,
    output[31:0] io_regOut_19,
    output[31:0] io_regOut_18,
    output[31:0] io_regOut_17,
    output[31:0] io_regOut_16,
    output[31:0] io_regOut_15,
    output[31:0] io_regOut_14,
    output[31:0] io_regOut_13,
    output[31:0] io_regOut_12,
    output[31:0] io_regOut_11,
    output[31:0] io_regOut_10,
    output[31:0] io_regOut_9,
    output[31:0] io_regOut_8,
    output[31:0] io_regOut_7,
    output[31:0] io_regOut_6,
    output[31:0] io_regOut_5,
    output[31:0] io_regOut_4,
    output[31:0] io_regOut_3,
    output[31:0] io_regOut_2,
    output[31:0] io_regOut_1,
    output[31:0] io_regOut_0,
    input  io_regIn_59_valid,
    input [31:0] io_regIn_59_bits,
    input  io_regIn_58_valid,
    input [31:0] io_regIn_58_bits,
    input  io_regIn_57_valid,
    input [31:0] io_regIn_57_bits,
    input  io_regIn_56_valid,
    input [31:0] io_regIn_56_bits,
    input  io_regIn_55_valid,
    input [31:0] io_regIn_55_bits,
    input  io_regIn_54_valid,
    input [31:0] io_regIn_54_bits,
    input  io_regIn_53_valid,
    input [31:0] io_regIn_53_bits,
    input  io_regIn_52_valid,
    input [31:0] io_regIn_52_bits,
    input  io_regIn_51_valid,
    input [31:0] io_regIn_51_bits,
    input  io_regIn_50_valid,
    input [31:0] io_regIn_50_bits,
    input  io_regIn_49_valid,
    input [31:0] io_regIn_49_bits,
    input  io_regIn_48_valid,
    input [31:0] io_regIn_48_bits,
    input  io_regIn_47_valid,
    input [31:0] io_regIn_47_bits,
    input  io_regIn_46_valid,
    input [31:0] io_regIn_46_bits,
    input  io_regIn_45_valid,
    input [31:0] io_regIn_45_bits,
    input  io_regIn_44_valid,
    input [31:0] io_regIn_44_bits,
    input  io_regIn_43_valid,
    input [31:0] io_regIn_43_bits,
    input  io_regIn_42_valid,
    input [31:0] io_regIn_42_bits,
    input  io_regIn_41_valid,
    input [31:0] io_regIn_41_bits,
    input  io_regIn_40_valid,
    input [31:0] io_regIn_40_bits,
    input  io_regIn_39_valid,
    input [31:0] io_regIn_39_bits,
    input  io_regIn_38_valid,
    input [31:0] io_regIn_38_bits,
    input  io_regIn_37_valid,
    input [31:0] io_regIn_37_bits,
    input  io_regIn_36_valid,
    input [31:0] io_regIn_36_bits,
    input  io_regIn_35_valid,
    input [31:0] io_regIn_35_bits,
    input  io_regIn_34_valid,
    input [31:0] io_regIn_34_bits,
    input  io_regIn_33_valid,
    input [31:0] io_regIn_33_bits,
    input  io_regIn_32_valid,
    input [31:0] io_regIn_32_bits,
    input  io_regIn_31_valid,
    input [31:0] io_regIn_31_bits,
    input  io_regIn_30_valid,
    input [31:0] io_regIn_30_bits,
    input  io_regIn_29_valid,
    input [31:0] io_regIn_29_bits,
    input  io_regIn_28_valid,
    input [31:0] io_regIn_28_bits,
    input  io_regIn_27_valid,
    input [31:0] io_regIn_27_bits,
    input  io_regIn_26_valid,
    input [31:0] io_regIn_26_bits,
    input  io_regIn_25_valid,
    input [31:0] io_regIn_25_bits,
    input  io_regIn_24_valid,
    input [31:0] io_regIn_24_bits,
    input  io_regIn_23_valid,
    input [31:0] io_regIn_23_bits,
    input  io_regIn_22_valid,
    input [31:0] io_regIn_22_bits,
    input  io_regIn_21_valid,
    input [31:0] io_regIn_21_bits,
    input  io_regIn_20_valid,
    input [31:0] io_regIn_20_bits,
    input  io_regIn_19_valid,
    input [31:0] io_regIn_19_bits,
    input  io_regIn_18_valid,
    input [31:0] io_regIn_18_bits,
    input  io_regIn_17_valid,
    input [31:0] io_regIn_17_bits,
    input  io_regIn_16_valid,
    input [31:0] io_regIn_16_bits,
    input  io_regIn_15_valid,
    input [31:0] io_regIn_15_bits,
    input  io_regIn_14_valid,
    input [31:0] io_regIn_14_bits,
    input  io_regIn_13_valid,
    input [31:0] io_regIn_13_bits,
    input  io_regIn_12_valid,
    input [31:0] io_regIn_12_bits,
    input  io_regIn_11_valid,
    input [31:0] io_regIn_11_bits,
    input  io_regIn_10_valid,
    input [31:0] io_regIn_10_bits,
    input  io_regIn_9_valid,
    input [31:0] io_regIn_9_bits,
    input  io_regIn_8_valid,
    input [31:0] io_regIn_8_bits,
    input  io_regIn_7_valid,
    input [31:0] io_regIn_7_bits,
    input  io_regIn_6_valid,
    input [31:0] io_regIn_6_bits,
    input  io_regIn_5_valid,
    input [31:0] io_regIn_5_bits,
    input  io_regIn_4_valid,
    input [31:0] io_regIn_4_bits,
    input  io_regIn_3_valid,
    input [31:0] io_regIn_3_bits,
    input  io_regIn_2_valid,
    input [31:0] io_regIn_2_bits,
    input  io_regIn_1_valid,
    input [31:0] io_regIn_1_bits,
    input  io_regIn_0_valid,
    input [31:0] io_regIn_0_bits
);

  reg [31:0] regFile_0;
  wire[31:0] T423;
  wire[31:0] T0;
  wire[31:0] T1;
  reg [31:0] regCommand_writeData;
  wire T2;
  wire T3;
  wire[63:0] T4;
  wire[5:0] T5;
  reg [5:0] regCommand_regID;
  wire hasExtWriteCommand;
  reg  regCommand_write;
  reg  regDoCmd;
  wire T424;
  wire T6;
  wire T7;
  reg [31:0] regFile_1;
  wire[31:0] T425;
  wire[31:0] T8;
  wire[31:0] T9;
  wire T10;
  wire T11;
  wire T12;
  reg [31:0] regFile_2;
  wire[31:0] T426;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire T17;
  reg [31:0] regFile_3;
  wire[31:0] T427;
  wire[31:0] T18;
  wire[31:0] T19;
  wire T20;
  wire T21;
  wire T22;
  reg [31:0] regFile_4;
  wire[31:0] T428;
  wire[31:0] T23;
  wire[31:0] T24;
  wire T25;
  wire T26;
  wire T27;
  reg [31:0] regFile_5;
  wire[31:0] T429;
  wire[31:0] T28;
  wire[31:0] T29;
  wire T30;
  wire T31;
  wire T32;
  reg [31:0] regFile_6;
  wire[31:0] T430;
  wire[31:0] T33;
  wire[31:0] T34;
  wire T35;
  wire T36;
  wire T37;
  reg [31:0] regFile_7;
  wire[31:0] T431;
  wire[31:0] T38;
  wire[31:0] T39;
  wire T40;
  wire T41;
  wire T42;
  reg [31:0] regFile_8;
  wire[31:0] T432;
  wire[31:0] T43;
  wire[31:0] T44;
  wire T45;
  wire T46;
  wire T47;
  reg [31:0] regFile_9;
  wire[31:0] T433;
  wire[31:0] T48;
  wire[31:0] T49;
  wire T50;
  wire T51;
  wire T52;
  reg [31:0] regFile_10;
  wire[31:0] T434;
  wire[31:0] T53;
  wire[31:0] T54;
  wire T55;
  wire T56;
  wire T57;
  reg [31:0] regFile_11;
  wire[31:0] T435;
  wire[31:0] T58;
  wire[31:0] T59;
  wire T60;
  wire T61;
  wire T62;
  reg [31:0] regFile_12;
  wire[31:0] T436;
  wire[31:0] T63;
  wire[31:0] T64;
  wire T65;
  wire T66;
  wire T67;
  reg [31:0] regFile_13;
  wire[31:0] T437;
  wire[31:0] T68;
  wire[31:0] T69;
  wire T70;
  wire T71;
  wire T72;
  reg [31:0] regFile_14;
  wire[31:0] T438;
  wire[31:0] T73;
  wire[31:0] T74;
  wire T75;
  wire T76;
  wire T77;
  reg [31:0] regFile_15;
  wire[31:0] T439;
  wire[31:0] T78;
  wire[31:0] T79;
  wire T80;
  wire T81;
  wire T82;
  reg [31:0] regFile_16;
  wire[31:0] T440;
  wire[31:0] T83;
  wire[31:0] T84;
  wire T85;
  wire T86;
  wire T87;
  reg [31:0] regFile_17;
  wire[31:0] T441;
  wire[31:0] T88;
  wire[31:0] T89;
  wire T90;
  wire T91;
  wire T92;
  reg [31:0] regFile_18;
  wire[31:0] T442;
  wire[31:0] T93;
  wire[31:0] T94;
  wire T95;
  wire T96;
  wire T97;
  reg [31:0] regFile_19;
  wire[31:0] T443;
  wire[31:0] T98;
  wire[31:0] T99;
  wire T100;
  wire T101;
  wire T102;
  reg [31:0] regFile_20;
  wire[31:0] T444;
  wire[31:0] T103;
  wire[31:0] T104;
  wire T105;
  wire T106;
  wire T107;
  reg [31:0] regFile_21;
  wire[31:0] T445;
  wire[31:0] T108;
  wire[31:0] T109;
  wire T110;
  wire T111;
  wire T112;
  reg [31:0] regFile_22;
  wire[31:0] T446;
  wire[31:0] T113;
  wire[31:0] T114;
  wire T115;
  wire T116;
  wire T117;
  reg [31:0] regFile_23;
  wire[31:0] T447;
  wire[31:0] T118;
  wire[31:0] T119;
  wire T120;
  wire T121;
  wire T122;
  reg [31:0] regFile_24;
  wire[31:0] T448;
  wire[31:0] T123;
  wire[31:0] T124;
  wire T125;
  wire T126;
  wire T127;
  reg [31:0] regFile_25;
  wire[31:0] T449;
  wire[31:0] T128;
  wire[31:0] T129;
  wire T130;
  wire T131;
  wire T132;
  reg [31:0] regFile_26;
  wire[31:0] T450;
  wire[31:0] T133;
  wire[31:0] T134;
  wire T135;
  wire T136;
  wire T137;
  reg [31:0] regFile_27;
  wire[31:0] T451;
  wire[31:0] T138;
  wire[31:0] T139;
  wire T140;
  wire T141;
  wire T142;
  reg [31:0] regFile_28;
  wire[31:0] T452;
  wire[31:0] T143;
  wire[31:0] T144;
  wire T145;
  wire T146;
  wire T147;
  reg [31:0] regFile_29;
  wire[31:0] T453;
  wire[31:0] T148;
  wire[31:0] T149;
  wire T150;
  wire T151;
  wire T152;
  reg [31:0] regFile_30;
  wire[31:0] T454;
  wire[31:0] T153;
  wire[31:0] T154;
  wire T155;
  wire T156;
  wire T157;
  reg [31:0] regFile_31;
  wire[31:0] T455;
  wire[31:0] T158;
  wire[31:0] T159;
  wire T160;
  wire T161;
  wire T162;
  reg [31:0] regFile_32;
  wire[31:0] T456;
  wire[31:0] T163;
  wire[31:0] T164;
  wire T165;
  wire T166;
  wire T167;
  reg [31:0] regFile_33;
  wire[31:0] T457;
  wire[31:0] T168;
  wire[31:0] T169;
  wire T170;
  wire T171;
  wire T172;
  reg [31:0] regFile_34;
  wire[31:0] T458;
  wire[31:0] T173;
  wire[31:0] T174;
  wire T175;
  wire T176;
  wire T177;
  reg [31:0] regFile_35;
  wire[31:0] T459;
  wire[31:0] T178;
  wire[31:0] T179;
  wire T180;
  wire T181;
  wire T182;
  reg [31:0] regFile_36;
  wire[31:0] T460;
  wire[31:0] T183;
  wire[31:0] T184;
  wire T185;
  wire T186;
  wire T187;
  reg [31:0] regFile_37;
  wire[31:0] T461;
  wire[31:0] T188;
  wire[31:0] T189;
  wire T190;
  wire T191;
  wire T192;
  reg [31:0] regFile_38;
  wire[31:0] T462;
  wire[31:0] T193;
  wire[31:0] T194;
  wire T195;
  wire T196;
  wire T197;
  reg [31:0] regFile_39;
  wire[31:0] T463;
  wire[31:0] T198;
  wire[31:0] T199;
  wire T200;
  wire T201;
  wire T202;
  reg [31:0] regFile_40;
  wire[31:0] T464;
  wire[31:0] T203;
  wire[31:0] T204;
  wire T205;
  wire T206;
  wire T207;
  reg [31:0] regFile_41;
  wire[31:0] T465;
  wire[31:0] T208;
  wire[31:0] T209;
  wire T210;
  wire T211;
  wire T212;
  reg [31:0] regFile_42;
  wire[31:0] T466;
  wire[31:0] T213;
  wire[31:0] T214;
  wire T215;
  wire T216;
  wire T217;
  reg [31:0] regFile_43;
  wire[31:0] T467;
  wire[31:0] T218;
  wire[31:0] T219;
  wire T220;
  wire T221;
  wire T222;
  reg [31:0] regFile_44;
  wire[31:0] T468;
  wire[31:0] T223;
  wire[31:0] T224;
  wire T225;
  wire T226;
  wire T227;
  reg [31:0] regFile_45;
  wire[31:0] T469;
  wire[31:0] T228;
  wire[31:0] T229;
  wire T230;
  wire T231;
  wire T232;
  reg [31:0] regFile_46;
  wire[31:0] T470;
  wire[31:0] T233;
  wire[31:0] T234;
  wire T235;
  wire T236;
  wire T237;
  reg [31:0] regFile_47;
  wire[31:0] T471;
  wire[31:0] T238;
  wire[31:0] T239;
  wire T240;
  wire T241;
  wire T242;
  reg [31:0] regFile_48;
  wire[31:0] T472;
  wire[31:0] T243;
  wire[31:0] T244;
  wire T245;
  wire T246;
  wire T247;
  reg [31:0] regFile_49;
  wire[31:0] T473;
  wire[31:0] T248;
  wire[31:0] T249;
  wire T250;
  wire T251;
  wire T252;
  reg [31:0] regFile_50;
  wire[31:0] T474;
  wire[31:0] T253;
  wire[31:0] T254;
  wire T255;
  wire T256;
  wire T257;
  reg [31:0] regFile_51;
  wire[31:0] T475;
  wire[31:0] T258;
  wire[31:0] T259;
  wire T260;
  wire T261;
  wire T262;
  reg [31:0] regFile_52;
  wire[31:0] T476;
  wire[31:0] T263;
  wire[31:0] T264;
  wire T265;
  wire T266;
  wire T267;
  reg [31:0] regFile_53;
  wire[31:0] T477;
  wire[31:0] T268;
  wire[31:0] T269;
  wire T270;
  wire T271;
  wire T272;
  reg [31:0] regFile_54;
  wire[31:0] T478;
  wire[31:0] T273;
  wire[31:0] T274;
  wire T275;
  wire T276;
  wire T277;
  reg [31:0] regFile_55;
  wire[31:0] T479;
  wire[31:0] T278;
  wire[31:0] T279;
  wire T280;
  wire T281;
  wire T282;
  reg [31:0] regFile_56;
  wire[31:0] T480;
  wire[31:0] T283;
  wire[31:0] T284;
  wire T285;
  wire T286;
  wire T287;
  reg [31:0] regFile_57;
  wire[31:0] T481;
  wire[31:0] T288;
  wire[31:0] T289;
  wire T290;
  wire T291;
  wire T292;
  reg [31:0] regFile_58;
  wire[31:0] T482;
  wire[31:0] T293;
  wire[31:0] T294;
  wire T295;
  wire T296;
  wire T297;
  reg [31:0] regFile_59;
  wire[31:0] T483;
  wire[31:0] T298;
  wire[31:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire[31:0] T303;
  wire[31:0] T304;
  wire[31:0] T305;
  wire[31:0] T306;
  wire[31:0] T307;
  wire[31:0] T308;
  wire[31:0] T309;
  wire T310;
  wire[31:0] T311;
  wire T312;
  wire T313;
  wire[31:0] T314;
  wire[31:0] T315;
  wire T316;
  wire[31:0] T317;
  wire T318;
  wire T319;
  wire T320;
  wire[31:0] T321;
  wire[31:0] T322;
  wire[31:0] T323;
  wire T324;
  wire[31:0] T325;
  wire T326;
  wire T327;
  wire[31:0] T328;
  wire[31:0] T329;
  wire T330;
  wire[31:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire T335;
  wire[31:0] T336;
  wire[31:0] T337;
  wire[31:0] T338;
  wire[31:0] T339;
  wire T340;
  wire[31:0] T341;
  wire T342;
  wire T343;
  wire[31:0] T344;
  wire[31:0] T345;
  wire T346;
  wire[31:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire[31:0] T351;
  wire[31:0] T352;
  wire[31:0] T353;
  wire T354;
  wire[31:0] T355;
  wire T356;
  wire T357;
  wire[31:0] T358;
  wire[31:0] T359;
  wire T360;
  wire[31:0] T361;
  wire T362;
  wire T363;
  wire T364;
  wire T365;
  wire T366;
  wire[31:0] T367;
  wire[31:0] T368;
  wire[31:0] T369;
  wire[31:0] T370;
  wire[31:0] T371;
  wire T372;
  wire[31:0] T373;
  wire T374;
  wire T375;
  wire[31:0] T376;
  wire[31:0] T377;
  wire T378;
  wire[31:0] T379;
  wire T380;
  wire T381;
  wire T382;
  wire[31:0] T383;
  wire[31:0] T384;
  wire[31:0] T385;
  wire T386;
  wire[31:0] T387;
  wire T388;
  wire T389;
  wire[31:0] T390;
  wire[31:0] T391;
  wire T392;
  wire[31:0] T393;
  wire T394;
  wire T395;
  wire T396;
  wire T397;
  wire[31:0] T398;
  wire[31:0] T399;
  wire[31:0] T400;
  wire[31:0] T401;
  wire T402;
  wire[31:0] T403;
  wire T404;
  wire T405;
  wire[31:0] T406;
  wire[31:0] T407;
  wire T408;
  wire[31:0] T409;
  wire T410;
  wire T411;
  wire T412;
  wire[31:0] T413;
  wire[31:0] T414;
  wire T415;
  wire[31:0] T416;
  wire T417;
  wire T418;
  wire T419;
  wire T420;
  wire T421;
  wire T422;
  wire hasExtReadCommand;
  reg  regCommand_read;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regFile_0 = {1{$random}};
    regCommand_writeData = {1{$random}};
    regCommand_regID = {1{$random}};
    regCommand_write = {1{$random}};
    regDoCmd = {1{$random}};
    regFile_1 = {1{$random}};
    regFile_2 = {1{$random}};
    regFile_3 = {1{$random}};
    regFile_4 = {1{$random}};
    regFile_5 = {1{$random}};
    regFile_6 = {1{$random}};
    regFile_7 = {1{$random}};
    regFile_8 = {1{$random}};
    regFile_9 = {1{$random}};
    regFile_10 = {1{$random}};
    regFile_11 = {1{$random}};
    regFile_12 = {1{$random}};
    regFile_13 = {1{$random}};
    regFile_14 = {1{$random}};
    regFile_15 = {1{$random}};
    regFile_16 = {1{$random}};
    regFile_17 = {1{$random}};
    regFile_18 = {1{$random}};
    regFile_19 = {1{$random}};
    regFile_20 = {1{$random}};
    regFile_21 = {1{$random}};
    regFile_22 = {1{$random}};
    regFile_23 = {1{$random}};
    regFile_24 = {1{$random}};
    regFile_25 = {1{$random}};
    regFile_26 = {1{$random}};
    regFile_27 = {1{$random}};
    regFile_28 = {1{$random}};
    regFile_29 = {1{$random}};
    regFile_30 = {1{$random}};
    regFile_31 = {1{$random}};
    regFile_32 = {1{$random}};
    regFile_33 = {1{$random}};
    regFile_34 = {1{$random}};
    regFile_35 = {1{$random}};
    regFile_36 = {1{$random}};
    regFile_37 = {1{$random}};
    regFile_38 = {1{$random}};
    regFile_39 = {1{$random}};
    regFile_40 = {1{$random}};
    regFile_41 = {1{$random}};
    regFile_42 = {1{$random}};
    regFile_43 = {1{$random}};
    regFile_44 = {1{$random}};
    regFile_45 = {1{$random}};
    regFile_46 = {1{$random}};
    regFile_47 = {1{$random}};
    regFile_48 = {1{$random}};
    regFile_49 = {1{$random}};
    regFile_50 = {1{$random}};
    regFile_51 = {1{$random}};
    regFile_52 = {1{$random}};
    regFile_53 = {1{$random}};
    regFile_54 = {1{$random}};
    regFile_55 = {1{$random}};
    regFile_56 = {1{$random}};
    regFile_57 = {1{$random}};
    regFile_58 = {1{$random}};
    regFile_59 = {1{$random}};
    regCommand_read = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_regOut_0 = regFile_0;
  assign T423 = reset ? 32'h0 : T0;
  assign T0 = T6 ? io_regIn_0_bits : T1;
  assign T1 = T2 ? regCommand_writeData : regFile_0;
  assign T2 = hasExtWriteCommand & T3;
  assign T3 = T4[0];
  assign T4 = 1'h1 << T5;
  assign T5 = regCommand_regID;
  assign hasExtWriteCommand = regDoCmd & regCommand_write;
  assign T424 = reset ? 1'h0 : io_extIF_cmd_valid;
  assign T6 = T7 & io_regIn_0_valid;
  assign T7 = hasExtWriteCommand ^ 1'h1;
  assign io_regOut_1 = regFile_1;
  assign T425 = reset ? 32'h0 : T8;
  assign T8 = T12 ? io_regIn_1_bits : T9;
  assign T9 = T10 ? regCommand_writeData : regFile_1;
  assign T10 = hasExtWriteCommand & T11;
  assign T11 = T4[1];
  assign T12 = T7 & io_regIn_1_valid;
  assign io_regOut_2 = regFile_2;
  assign T426 = reset ? 32'h0 : T13;
  assign T13 = T17 ? io_regIn_2_bits : T14;
  assign T14 = T15 ? regCommand_writeData : regFile_2;
  assign T15 = hasExtWriteCommand & T16;
  assign T16 = T4[2];
  assign T17 = T7 & io_regIn_2_valid;
  assign io_regOut_3 = regFile_3;
  assign T427 = reset ? 32'h0 : T18;
  assign T18 = T22 ? io_regIn_3_bits : T19;
  assign T19 = T20 ? regCommand_writeData : regFile_3;
  assign T20 = hasExtWriteCommand & T21;
  assign T21 = T4[3];
  assign T22 = T7 & io_regIn_3_valid;
  assign io_regOut_4 = regFile_4;
  assign T428 = reset ? 32'h0 : T23;
  assign T23 = T27 ? io_regIn_4_bits : T24;
  assign T24 = T25 ? regCommand_writeData : regFile_4;
  assign T25 = hasExtWriteCommand & T26;
  assign T26 = T4[4];
  assign T27 = T7 & io_regIn_4_valid;
  assign io_regOut_5 = regFile_5;
  assign T429 = reset ? 32'h0 : T28;
  assign T28 = T32 ? io_regIn_5_bits : T29;
  assign T29 = T30 ? regCommand_writeData : regFile_5;
  assign T30 = hasExtWriteCommand & T31;
  assign T31 = T4[5];
  assign T32 = T7 & io_regIn_5_valid;
  assign io_regOut_6 = regFile_6;
  assign T430 = reset ? 32'h0 : T33;
  assign T33 = T37 ? io_regIn_6_bits : T34;
  assign T34 = T35 ? regCommand_writeData : regFile_6;
  assign T35 = hasExtWriteCommand & T36;
  assign T36 = T4[6];
  assign T37 = T7 & io_regIn_6_valid;
  assign io_regOut_7 = regFile_7;
  assign T431 = reset ? 32'h0 : T38;
  assign T38 = T42 ? io_regIn_7_bits : T39;
  assign T39 = T40 ? regCommand_writeData : regFile_7;
  assign T40 = hasExtWriteCommand & T41;
  assign T41 = T4[7];
  assign T42 = T7 & io_regIn_7_valid;
  assign io_regOut_8 = regFile_8;
  assign T432 = reset ? 32'h0 : T43;
  assign T43 = T47 ? io_regIn_8_bits : T44;
  assign T44 = T45 ? regCommand_writeData : regFile_8;
  assign T45 = hasExtWriteCommand & T46;
  assign T46 = T4[8];
  assign T47 = T7 & io_regIn_8_valid;
  assign io_regOut_9 = regFile_9;
  assign T433 = reset ? 32'h0 : T48;
  assign T48 = T52 ? io_regIn_9_bits : T49;
  assign T49 = T50 ? regCommand_writeData : regFile_9;
  assign T50 = hasExtWriteCommand & T51;
  assign T51 = T4[9];
  assign T52 = T7 & io_regIn_9_valid;
  assign io_regOut_10 = regFile_10;
  assign T434 = reset ? 32'h0 : T53;
  assign T53 = T57 ? io_regIn_10_bits : T54;
  assign T54 = T55 ? regCommand_writeData : regFile_10;
  assign T55 = hasExtWriteCommand & T56;
  assign T56 = T4[10];
  assign T57 = T7 & io_regIn_10_valid;
  assign io_regOut_11 = regFile_11;
  assign T435 = reset ? 32'h0 : T58;
  assign T58 = T62 ? io_regIn_11_bits : T59;
  assign T59 = T60 ? regCommand_writeData : regFile_11;
  assign T60 = hasExtWriteCommand & T61;
  assign T61 = T4[11];
  assign T62 = T7 & io_regIn_11_valid;
  assign io_regOut_12 = regFile_12;
  assign T436 = reset ? 32'h0 : T63;
  assign T63 = T67 ? io_regIn_12_bits : T64;
  assign T64 = T65 ? regCommand_writeData : regFile_12;
  assign T65 = hasExtWriteCommand & T66;
  assign T66 = T4[12];
  assign T67 = T7 & io_regIn_12_valid;
  assign io_regOut_13 = regFile_13;
  assign T437 = reset ? 32'h0 : T68;
  assign T68 = T72 ? io_regIn_13_bits : T69;
  assign T69 = T70 ? regCommand_writeData : regFile_13;
  assign T70 = hasExtWriteCommand & T71;
  assign T71 = T4[13];
  assign T72 = T7 & io_regIn_13_valid;
  assign io_regOut_14 = regFile_14;
  assign T438 = reset ? 32'h0 : T73;
  assign T73 = T77 ? io_regIn_14_bits : T74;
  assign T74 = T75 ? regCommand_writeData : regFile_14;
  assign T75 = hasExtWriteCommand & T76;
  assign T76 = T4[14];
  assign T77 = T7 & io_regIn_14_valid;
  assign io_regOut_15 = regFile_15;
  assign T439 = reset ? 32'h0 : T78;
  assign T78 = T82 ? io_regIn_15_bits : T79;
  assign T79 = T80 ? regCommand_writeData : regFile_15;
  assign T80 = hasExtWriteCommand & T81;
  assign T81 = T4[15];
  assign T82 = T7 & io_regIn_15_valid;
  assign io_regOut_16 = regFile_16;
  assign T440 = reset ? 32'h0 : T83;
  assign T83 = T87 ? io_regIn_16_bits : T84;
  assign T84 = T85 ? regCommand_writeData : regFile_16;
  assign T85 = hasExtWriteCommand & T86;
  assign T86 = T4[16];
  assign T87 = T7 & io_regIn_16_valid;
  assign io_regOut_17 = regFile_17;
  assign T441 = reset ? 32'h0 : T88;
  assign T88 = T92 ? io_regIn_17_bits : T89;
  assign T89 = T90 ? regCommand_writeData : regFile_17;
  assign T90 = hasExtWriteCommand & T91;
  assign T91 = T4[17];
  assign T92 = T7 & io_regIn_17_valid;
  assign io_regOut_18 = regFile_18;
  assign T442 = reset ? 32'h0 : T93;
  assign T93 = T97 ? io_regIn_18_bits : T94;
  assign T94 = T95 ? regCommand_writeData : regFile_18;
  assign T95 = hasExtWriteCommand & T96;
  assign T96 = T4[18];
  assign T97 = T7 & io_regIn_18_valid;
  assign io_regOut_19 = regFile_19;
  assign T443 = reset ? 32'h0 : T98;
  assign T98 = T102 ? io_regIn_19_bits : T99;
  assign T99 = T100 ? regCommand_writeData : regFile_19;
  assign T100 = hasExtWriteCommand & T101;
  assign T101 = T4[19];
  assign T102 = T7 & io_regIn_19_valid;
  assign io_regOut_20 = regFile_20;
  assign T444 = reset ? 32'h0 : T103;
  assign T103 = T107 ? io_regIn_20_bits : T104;
  assign T104 = T105 ? regCommand_writeData : regFile_20;
  assign T105 = hasExtWriteCommand & T106;
  assign T106 = T4[20];
  assign T107 = T7 & io_regIn_20_valid;
  assign io_regOut_21 = regFile_21;
  assign T445 = reset ? 32'h0 : T108;
  assign T108 = T112 ? io_regIn_21_bits : T109;
  assign T109 = T110 ? regCommand_writeData : regFile_21;
  assign T110 = hasExtWriteCommand & T111;
  assign T111 = T4[21];
  assign T112 = T7 & io_regIn_21_valid;
  assign io_regOut_22 = regFile_22;
  assign T446 = reset ? 32'h0 : T113;
  assign T113 = T117 ? io_regIn_22_bits : T114;
  assign T114 = T115 ? regCommand_writeData : regFile_22;
  assign T115 = hasExtWriteCommand & T116;
  assign T116 = T4[22];
  assign T117 = T7 & io_regIn_22_valid;
  assign io_regOut_23 = regFile_23;
  assign T447 = reset ? 32'h0 : T118;
  assign T118 = T122 ? io_regIn_23_bits : T119;
  assign T119 = T120 ? regCommand_writeData : regFile_23;
  assign T120 = hasExtWriteCommand & T121;
  assign T121 = T4[23];
  assign T122 = T7 & io_regIn_23_valid;
  assign io_regOut_24 = regFile_24;
  assign T448 = reset ? 32'h0 : T123;
  assign T123 = T127 ? io_regIn_24_bits : T124;
  assign T124 = T125 ? regCommand_writeData : regFile_24;
  assign T125 = hasExtWriteCommand & T126;
  assign T126 = T4[24];
  assign T127 = T7 & io_regIn_24_valid;
  assign io_regOut_25 = regFile_25;
  assign T449 = reset ? 32'h0 : T128;
  assign T128 = T132 ? io_regIn_25_bits : T129;
  assign T129 = T130 ? regCommand_writeData : regFile_25;
  assign T130 = hasExtWriteCommand & T131;
  assign T131 = T4[25];
  assign T132 = T7 & io_regIn_25_valid;
  assign io_regOut_26 = regFile_26;
  assign T450 = reset ? 32'h0 : T133;
  assign T133 = T137 ? io_regIn_26_bits : T134;
  assign T134 = T135 ? regCommand_writeData : regFile_26;
  assign T135 = hasExtWriteCommand & T136;
  assign T136 = T4[26];
  assign T137 = T7 & io_regIn_26_valid;
  assign io_regOut_27 = regFile_27;
  assign T451 = reset ? 32'h0 : T138;
  assign T138 = T142 ? io_regIn_27_bits : T139;
  assign T139 = T140 ? regCommand_writeData : regFile_27;
  assign T140 = hasExtWriteCommand & T141;
  assign T141 = T4[27];
  assign T142 = T7 & io_regIn_27_valid;
  assign io_regOut_28 = regFile_28;
  assign T452 = reset ? 32'h0 : T143;
  assign T143 = T147 ? io_regIn_28_bits : T144;
  assign T144 = T145 ? regCommand_writeData : regFile_28;
  assign T145 = hasExtWriteCommand & T146;
  assign T146 = T4[28];
  assign T147 = T7 & io_regIn_28_valid;
  assign io_regOut_29 = regFile_29;
  assign T453 = reset ? 32'h0 : T148;
  assign T148 = T152 ? io_regIn_29_bits : T149;
  assign T149 = T150 ? regCommand_writeData : regFile_29;
  assign T150 = hasExtWriteCommand & T151;
  assign T151 = T4[29];
  assign T152 = T7 & io_regIn_29_valid;
  assign io_regOut_30 = regFile_30;
  assign T454 = reset ? 32'h0 : T153;
  assign T153 = T157 ? io_regIn_30_bits : T154;
  assign T154 = T155 ? regCommand_writeData : regFile_30;
  assign T155 = hasExtWriteCommand & T156;
  assign T156 = T4[30];
  assign T157 = T7 & io_regIn_30_valid;
  assign io_regOut_31 = regFile_31;
  assign T455 = reset ? 32'h0 : T158;
  assign T158 = T162 ? io_regIn_31_bits : T159;
  assign T159 = T160 ? regCommand_writeData : regFile_31;
  assign T160 = hasExtWriteCommand & T161;
  assign T161 = T4[31];
  assign T162 = T7 & io_regIn_31_valid;
  assign io_regOut_32 = regFile_32;
  assign T456 = reset ? 32'h0 : T163;
  assign T163 = T167 ? io_regIn_32_bits : T164;
  assign T164 = T165 ? regCommand_writeData : regFile_32;
  assign T165 = hasExtWriteCommand & T166;
  assign T166 = T4[32];
  assign T167 = T7 & io_regIn_32_valid;
  assign io_regOut_33 = regFile_33;
  assign T457 = reset ? 32'h0 : T168;
  assign T168 = T172 ? io_regIn_33_bits : T169;
  assign T169 = T170 ? regCommand_writeData : regFile_33;
  assign T170 = hasExtWriteCommand & T171;
  assign T171 = T4[33];
  assign T172 = T7 & io_regIn_33_valid;
  assign io_regOut_34 = regFile_34;
  assign T458 = reset ? 32'h0 : T173;
  assign T173 = T177 ? io_regIn_34_bits : T174;
  assign T174 = T175 ? regCommand_writeData : regFile_34;
  assign T175 = hasExtWriteCommand & T176;
  assign T176 = T4[34];
  assign T177 = T7 & io_regIn_34_valid;
  assign io_regOut_35 = regFile_35;
  assign T459 = reset ? 32'h0 : T178;
  assign T178 = T182 ? io_regIn_35_bits : T179;
  assign T179 = T180 ? regCommand_writeData : regFile_35;
  assign T180 = hasExtWriteCommand & T181;
  assign T181 = T4[35];
  assign T182 = T7 & io_regIn_35_valid;
  assign io_regOut_36 = regFile_36;
  assign T460 = reset ? 32'h0 : T183;
  assign T183 = T187 ? io_regIn_36_bits : T184;
  assign T184 = T185 ? regCommand_writeData : regFile_36;
  assign T185 = hasExtWriteCommand & T186;
  assign T186 = T4[36];
  assign T187 = T7 & io_regIn_36_valid;
  assign io_regOut_37 = regFile_37;
  assign T461 = reset ? 32'h0 : T188;
  assign T188 = T192 ? io_regIn_37_bits : T189;
  assign T189 = T190 ? regCommand_writeData : regFile_37;
  assign T190 = hasExtWriteCommand & T191;
  assign T191 = T4[37];
  assign T192 = T7 & io_regIn_37_valid;
  assign io_regOut_38 = regFile_38;
  assign T462 = reset ? 32'h0 : T193;
  assign T193 = T197 ? io_regIn_38_bits : T194;
  assign T194 = T195 ? regCommand_writeData : regFile_38;
  assign T195 = hasExtWriteCommand & T196;
  assign T196 = T4[38];
  assign T197 = T7 & io_regIn_38_valid;
  assign io_regOut_39 = regFile_39;
  assign T463 = reset ? 32'h0 : T198;
  assign T198 = T202 ? io_regIn_39_bits : T199;
  assign T199 = T200 ? regCommand_writeData : regFile_39;
  assign T200 = hasExtWriteCommand & T201;
  assign T201 = T4[39];
  assign T202 = T7 & io_regIn_39_valid;
  assign io_regOut_40 = regFile_40;
  assign T464 = reset ? 32'h0 : T203;
  assign T203 = T207 ? io_regIn_40_bits : T204;
  assign T204 = T205 ? regCommand_writeData : regFile_40;
  assign T205 = hasExtWriteCommand & T206;
  assign T206 = T4[40];
  assign T207 = T7 & io_regIn_40_valid;
  assign io_regOut_41 = regFile_41;
  assign T465 = reset ? 32'h0 : T208;
  assign T208 = T212 ? io_regIn_41_bits : T209;
  assign T209 = T210 ? regCommand_writeData : regFile_41;
  assign T210 = hasExtWriteCommand & T211;
  assign T211 = T4[41];
  assign T212 = T7 & io_regIn_41_valid;
  assign io_regOut_42 = regFile_42;
  assign T466 = reset ? 32'h0 : T213;
  assign T213 = T217 ? io_regIn_42_bits : T214;
  assign T214 = T215 ? regCommand_writeData : regFile_42;
  assign T215 = hasExtWriteCommand & T216;
  assign T216 = T4[42];
  assign T217 = T7 & io_regIn_42_valid;
  assign io_regOut_43 = regFile_43;
  assign T467 = reset ? 32'h0 : T218;
  assign T218 = T222 ? io_regIn_43_bits : T219;
  assign T219 = T220 ? regCommand_writeData : regFile_43;
  assign T220 = hasExtWriteCommand & T221;
  assign T221 = T4[43];
  assign T222 = T7 & io_regIn_43_valid;
  assign io_regOut_44 = regFile_44;
  assign T468 = reset ? 32'h0 : T223;
  assign T223 = T227 ? io_regIn_44_bits : T224;
  assign T224 = T225 ? regCommand_writeData : regFile_44;
  assign T225 = hasExtWriteCommand & T226;
  assign T226 = T4[44];
  assign T227 = T7 & io_regIn_44_valid;
  assign io_regOut_45 = regFile_45;
  assign T469 = reset ? 32'h0 : T228;
  assign T228 = T232 ? io_regIn_45_bits : T229;
  assign T229 = T230 ? regCommand_writeData : regFile_45;
  assign T230 = hasExtWriteCommand & T231;
  assign T231 = T4[45];
  assign T232 = T7 & io_regIn_45_valid;
  assign io_regOut_46 = regFile_46;
  assign T470 = reset ? 32'h0 : T233;
  assign T233 = T237 ? io_regIn_46_bits : T234;
  assign T234 = T235 ? regCommand_writeData : regFile_46;
  assign T235 = hasExtWriteCommand & T236;
  assign T236 = T4[46];
  assign T237 = T7 & io_regIn_46_valid;
  assign io_regOut_47 = regFile_47;
  assign T471 = reset ? 32'h0 : T238;
  assign T238 = T242 ? io_regIn_47_bits : T239;
  assign T239 = T240 ? regCommand_writeData : regFile_47;
  assign T240 = hasExtWriteCommand & T241;
  assign T241 = T4[47];
  assign T242 = T7 & io_regIn_47_valid;
  assign io_regOut_48 = regFile_48;
  assign T472 = reset ? 32'h0 : T243;
  assign T243 = T247 ? io_regIn_48_bits : T244;
  assign T244 = T245 ? regCommand_writeData : regFile_48;
  assign T245 = hasExtWriteCommand & T246;
  assign T246 = T4[48];
  assign T247 = T7 & io_regIn_48_valid;
  assign io_regOut_49 = regFile_49;
  assign T473 = reset ? 32'h0 : T248;
  assign T248 = T252 ? io_regIn_49_bits : T249;
  assign T249 = T250 ? regCommand_writeData : regFile_49;
  assign T250 = hasExtWriteCommand & T251;
  assign T251 = T4[49];
  assign T252 = T7 & io_regIn_49_valid;
  assign io_regOut_50 = regFile_50;
  assign T474 = reset ? 32'h0 : T253;
  assign T253 = T257 ? io_regIn_50_bits : T254;
  assign T254 = T255 ? regCommand_writeData : regFile_50;
  assign T255 = hasExtWriteCommand & T256;
  assign T256 = T4[50];
  assign T257 = T7 & io_regIn_50_valid;
  assign io_regOut_51 = regFile_51;
  assign T475 = reset ? 32'h0 : T258;
  assign T258 = T262 ? io_regIn_51_bits : T259;
  assign T259 = T260 ? regCommand_writeData : regFile_51;
  assign T260 = hasExtWriteCommand & T261;
  assign T261 = T4[51];
  assign T262 = T7 & io_regIn_51_valid;
  assign io_regOut_52 = regFile_52;
  assign T476 = reset ? 32'h0 : T263;
  assign T263 = T267 ? io_regIn_52_bits : T264;
  assign T264 = T265 ? regCommand_writeData : regFile_52;
  assign T265 = hasExtWriteCommand & T266;
  assign T266 = T4[52];
  assign T267 = T7 & io_regIn_52_valid;
  assign io_regOut_53 = regFile_53;
  assign T477 = reset ? 32'h0 : T268;
  assign T268 = T272 ? io_regIn_53_bits : T269;
  assign T269 = T270 ? regCommand_writeData : regFile_53;
  assign T270 = hasExtWriteCommand & T271;
  assign T271 = T4[53];
  assign T272 = T7 & io_regIn_53_valid;
  assign io_regOut_54 = regFile_54;
  assign T478 = reset ? 32'h0 : T273;
  assign T273 = T277 ? io_regIn_54_bits : T274;
  assign T274 = T275 ? regCommand_writeData : regFile_54;
  assign T275 = hasExtWriteCommand & T276;
  assign T276 = T4[54];
  assign T277 = T7 & io_regIn_54_valid;
  assign io_regOut_55 = regFile_55;
  assign T479 = reset ? 32'h0 : T278;
  assign T278 = T282 ? io_regIn_55_bits : T279;
  assign T279 = T280 ? regCommand_writeData : regFile_55;
  assign T280 = hasExtWriteCommand & T281;
  assign T281 = T4[55];
  assign T282 = T7 & io_regIn_55_valid;
  assign io_regOut_56 = regFile_56;
  assign T480 = reset ? 32'h0 : T283;
  assign T283 = T287 ? io_regIn_56_bits : T284;
  assign T284 = T285 ? regCommand_writeData : regFile_56;
  assign T285 = hasExtWriteCommand & T286;
  assign T286 = T4[56];
  assign T287 = T7 & io_regIn_56_valid;
  assign io_regOut_57 = regFile_57;
  assign T481 = reset ? 32'h0 : T288;
  assign T288 = T292 ? io_regIn_57_bits : T289;
  assign T289 = T290 ? regCommand_writeData : regFile_57;
  assign T290 = hasExtWriteCommand & T291;
  assign T291 = T4[57];
  assign T292 = T7 & io_regIn_57_valid;
  assign io_regOut_58 = regFile_58;
  assign T482 = reset ? 32'h0 : T293;
  assign T293 = T297 ? io_regIn_58_bits : T294;
  assign T294 = T295 ? regCommand_writeData : regFile_58;
  assign T295 = hasExtWriteCommand & T296;
  assign T296 = T4[58];
  assign T297 = T7 & io_regIn_58_valid;
  assign io_regOut_59 = regFile_59;
  assign T483 = reset ? 32'h0 : T298;
  assign T298 = T302 ? io_regIn_59_bits : T299;
  assign T299 = T300 ? regCommand_writeData : regFile_59;
  assign T300 = hasExtWriteCommand & T301;
  assign T301 = T4[59];
  assign T302 = T7 & io_regIn_59_valid;
  assign io_extIF_regCount = 6'h3c;
  assign io_extIF_readData_bits = T303;
  assign T303 = T422 ? T304 : 32'h0;
  assign T304 = T421 ? T367 : T305;
  assign T305 = T366 ? T336 : T306;
  assign T306 = T335 ? T321 : T307;
  assign T307 = T320 ? T314 : T308;
  assign T308 = T313 ? T311 : T309;
  assign T309 = T310 ? regFile_1 : regFile_0;
  assign T310 = T5[0];
  assign T311 = T312 ? regFile_3 : regFile_2;
  assign T312 = T5[0];
  assign T313 = T5[1];
  assign T314 = T319 ? T317 : T315;
  assign T315 = T316 ? regFile_5 : regFile_4;
  assign T316 = T5[0];
  assign T317 = T318 ? regFile_7 : regFile_6;
  assign T318 = T5[0];
  assign T319 = T5[1];
  assign T320 = T5[2];
  assign T321 = T334 ? T328 : T322;
  assign T322 = T327 ? T325 : T323;
  assign T323 = T324 ? regFile_9 : regFile_8;
  assign T324 = T5[0];
  assign T325 = T326 ? regFile_11 : regFile_10;
  assign T326 = T5[0];
  assign T327 = T5[1];
  assign T328 = T333 ? T331 : T329;
  assign T329 = T330 ? regFile_13 : regFile_12;
  assign T330 = T5[0];
  assign T331 = T332 ? regFile_15 : regFile_14;
  assign T332 = T5[0];
  assign T333 = T5[1];
  assign T334 = T5[2];
  assign T335 = T5[3];
  assign T336 = T365 ? T351 : T337;
  assign T337 = T350 ? T344 : T338;
  assign T338 = T343 ? T341 : T339;
  assign T339 = T340 ? regFile_17 : regFile_16;
  assign T340 = T5[0];
  assign T341 = T342 ? regFile_19 : regFile_18;
  assign T342 = T5[0];
  assign T343 = T5[1];
  assign T344 = T349 ? T347 : T345;
  assign T345 = T346 ? regFile_21 : regFile_20;
  assign T346 = T5[0];
  assign T347 = T348 ? regFile_23 : regFile_22;
  assign T348 = T5[0];
  assign T349 = T5[1];
  assign T350 = T5[2];
  assign T351 = T364 ? T358 : T352;
  assign T352 = T357 ? T355 : T353;
  assign T353 = T354 ? regFile_25 : regFile_24;
  assign T354 = T5[0];
  assign T355 = T356 ? regFile_27 : regFile_26;
  assign T356 = T5[0];
  assign T357 = T5[1];
  assign T358 = T363 ? T361 : T359;
  assign T359 = T360 ? regFile_29 : regFile_28;
  assign T360 = T5[0];
  assign T361 = T362 ? regFile_31 : regFile_30;
  assign T362 = T5[0];
  assign T363 = T5[1];
  assign T364 = T5[2];
  assign T365 = T5[3];
  assign T366 = T5[4];
  assign T367 = T420 ? T398 : T368;
  assign T368 = T397 ? T383 : T369;
  assign T369 = T382 ? T376 : T370;
  assign T370 = T375 ? T373 : T371;
  assign T371 = T372 ? regFile_33 : regFile_32;
  assign T372 = T5[0];
  assign T373 = T374 ? regFile_35 : regFile_34;
  assign T374 = T5[0];
  assign T375 = T5[1];
  assign T376 = T381 ? T379 : T377;
  assign T377 = T378 ? regFile_37 : regFile_36;
  assign T378 = T5[0];
  assign T379 = T380 ? regFile_39 : regFile_38;
  assign T380 = T5[0];
  assign T381 = T5[1];
  assign T382 = T5[2];
  assign T383 = T396 ? T390 : T384;
  assign T384 = T389 ? T387 : T385;
  assign T385 = T386 ? regFile_41 : regFile_40;
  assign T386 = T5[0];
  assign T387 = T388 ? regFile_43 : regFile_42;
  assign T388 = T5[0];
  assign T389 = T5[1];
  assign T390 = T395 ? T393 : T391;
  assign T391 = T392 ? regFile_45 : regFile_44;
  assign T392 = T5[0];
  assign T393 = T394 ? regFile_47 : regFile_46;
  assign T394 = T5[0];
  assign T395 = T5[1];
  assign T396 = T5[2];
  assign T397 = T5[3];
  assign T398 = T419 ? T413 : T399;
  assign T399 = T412 ? T406 : T400;
  assign T400 = T405 ? T403 : T401;
  assign T401 = T402 ? regFile_49 : regFile_48;
  assign T402 = T5[0];
  assign T403 = T404 ? regFile_51 : regFile_50;
  assign T404 = T5[0];
  assign T405 = T5[1];
  assign T406 = T411 ? T409 : T407;
  assign T407 = T408 ? regFile_53 : regFile_52;
  assign T408 = T5[0];
  assign T409 = T410 ? regFile_55 : regFile_54;
  assign T410 = T5[0];
  assign T411 = T5[1];
  assign T412 = T5[2];
  assign T413 = T418 ? T416 : T414;
  assign T414 = T415 ? regFile_57 : regFile_56;
  assign T415 = T5[0];
  assign T416 = T417 ? regFile_59 : regFile_58;
  assign T417 = T5[0];
  assign T418 = T5[1];
  assign T419 = T5[3];
  assign T420 = T5[4];
  assign T421 = T5[5];
  assign T422 = regCommand_regID < 6'h3c;
  assign io_extIF_readData_valid = hasExtReadCommand;
  assign hasExtReadCommand = regDoCmd & regCommand_read;

  always @(posedge clk) begin
    if(reset) begin
      regFile_0 <= 32'h0;
    end else if(T6) begin
      regFile_0 <= io_regIn_0_bits;
    end else if(T2) begin
      regFile_0 <= regCommand_writeData;
    end
    regCommand_writeData <= io_extIF_cmd_bits_writeData;
    regCommand_regID <= io_extIF_cmd_bits_regID;
    regCommand_write <= io_extIF_cmd_bits_write;
    if(reset) begin
      regDoCmd <= 1'h0;
    end else begin
      regDoCmd <= io_extIF_cmd_valid;
    end
    if(reset) begin
      regFile_1 <= 32'h0;
    end else if(T12) begin
      regFile_1 <= io_regIn_1_bits;
    end else if(T10) begin
      regFile_1 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_2 <= 32'h0;
    end else if(T17) begin
      regFile_2 <= io_regIn_2_bits;
    end else if(T15) begin
      regFile_2 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_3 <= 32'h0;
    end else if(T22) begin
      regFile_3 <= io_regIn_3_bits;
    end else if(T20) begin
      regFile_3 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_4 <= 32'h0;
    end else if(T27) begin
      regFile_4 <= io_regIn_4_bits;
    end else if(T25) begin
      regFile_4 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_5 <= 32'h0;
    end else if(T32) begin
      regFile_5 <= io_regIn_5_bits;
    end else if(T30) begin
      regFile_5 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_6 <= 32'h0;
    end else if(T37) begin
      regFile_6 <= io_regIn_6_bits;
    end else if(T35) begin
      regFile_6 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_7 <= 32'h0;
    end else if(T42) begin
      regFile_7 <= io_regIn_7_bits;
    end else if(T40) begin
      regFile_7 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_8 <= 32'h0;
    end else if(T47) begin
      regFile_8 <= io_regIn_8_bits;
    end else if(T45) begin
      regFile_8 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_9 <= 32'h0;
    end else if(T52) begin
      regFile_9 <= io_regIn_9_bits;
    end else if(T50) begin
      regFile_9 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_10 <= 32'h0;
    end else if(T57) begin
      regFile_10 <= io_regIn_10_bits;
    end else if(T55) begin
      regFile_10 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_11 <= 32'h0;
    end else if(T62) begin
      regFile_11 <= io_regIn_11_bits;
    end else if(T60) begin
      regFile_11 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_12 <= 32'h0;
    end else if(T67) begin
      regFile_12 <= io_regIn_12_bits;
    end else if(T65) begin
      regFile_12 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_13 <= 32'h0;
    end else if(T72) begin
      regFile_13 <= io_regIn_13_bits;
    end else if(T70) begin
      regFile_13 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_14 <= 32'h0;
    end else if(T77) begin
      regFile_14 <= io_regIn_14_bits;
    end else if(T75) begin
      regFile_14 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_15 <= 32'h0;
    end else if(T82) begin
      regFile_15 <= io_regIn_15_bits;
    end else if(T80) begin
      regFile_15 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_16 <= 32'h0;
    end else if(T87) begin
      regFile_16 <= io_regIn_16_bits;
    end else if(T85) begin
      regFile_16 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_17 <= 32'h0;
    end else if(T92) begin
      regFile_17 <= io_regIn_17_bits;
    end else if(T90) begin
      regFile_17 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_18 <= 32'h0;
    end else if(T97) begin
      regFile_18 <= io_regIn_18_bits;
    end else if(T95) begin
      regFile_18 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_19 <= 32'h0;
    end else if(T102) begin
      regFile_19 <= io_regIn_19_bits;
    end else if(T100) begin
      regFile_19 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_20 <= 32'h0;
    end else if(T107) begin
      regFile_20 <= io_regIn_20_bits;
    end else if(T105) begin
      regFile_20 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_21 <= 32'h0;
    end else if(T112) begin
      regFile_21 <= io_regIn_21_bits;
    end else if(T110) begin
      regFile_21 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_22 <= 32'h0;
    end else if(T117) begin
      regFile_22 <= io_regIn_22_bits;
    end else if(T115) begin
      regFile_22 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_23 <= 32'h0;
    end else if(T122) begin
      regFile_23 <= io_regIn_23_bits;
    end else if(T120) begin
      regFile_23 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_24 <= 32'h0;
    end else if(T127) begin
      regFile_24 <= io_regIn_24_bits;
    end else if(T125) begin
      regFile_24 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_25 <= 32'h0;
    end else if(T132) begin
      regFile_25 <= io_regIn_25_bits;
    end else if(T130) begin
      regFile_25 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_26 <= 32'h0;
    end else if(T137) begin
      regFile_26 <= io_regIn_26_bits;
    end else if(T135) begin
      regFile_26 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_27 <= 32'h0;
    end else if(T142) begin
      regFile_27 <= io_regIn_27_bits;
    end else if(T140) begin
      regFile_27 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_28 <= 32'h0;
    end else if(T147) begin
      regFile_28 <= io_regIn_28_bits;
    end else if(T145) begin
      regFile_28 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_29 <= 32'h0;
    end else if(T152) begin
      regFile_29 <= io_regIn_29_bits;
    end else if(T150) begin
      regFile_29 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_30 <= 32'h0;
    end else if(T157) begin
      regFile_30 <= io_regIn_30_bits;
    end else if(T155) begin
      regFile_30 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_31 <= 32'h0;
    end else if(T162) begin
      regFile_31 <= io_regIn_31_bits;
    end else if(T160) begin
      regFile_31 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_32 <= 32'h0;
    end else if(T167) begin
      regFile_32 <= io_regIn_32_bits;
    end else if(T165) begin
      regFile_32 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_33 <= 32'h0;
    end else if(T172) begin
      regFile_33 <= io_regIn_33_bits;
    end else if(T170) begin
      regFile_33 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_34 <= 32'h0;
    end else if(T177) begin
      regFile_34 <= io_regIn_34_bits;
    end else if(T175) begin
      regFile_34 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_35 <= 32'h0;
    end else if(T182) begin
      regFile_35 <= io_regIn_35_bits;
    end else if(T180) begin
      regFile_35 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_36 <= 32'h0;
    end else if(T187) begin
      regFile_36 <= io_regIn_36_bits;
    end else if(T185) begin
      regFile_36 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_37 <= 32'h0;
    end else if(T192) begin
      regFile_37 <= io_regIn_37_bits;
    end else if(T190) begin
      regFile_37 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_38 <= 32'h0;
    end else if(T197) begin
      regFile_38 <= io_regIn_38_bits;
    end else if(T195) begin
      regFile_38 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_39 <= 32'h0;
    end else if(T202) begin
      regFile_39 <= io_regIn_39_bits;
    end else if(T200) begin
      regFile_39 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_40 <= 32'h0;
    end else if(T207) begin
      regFile_40 <= io_regIn_40_bits;
    end else if(T205) begin
      regFile_40 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_41 <= 32'h0;
    end else if(T212) begin
      regFile_41 <= io_regIn_41_bits;
    end else if(T210) begin
      regFile_41 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_42 <= 32'h0;
    end else if(T217) begin
      regFile_42 <= io_regIn_42_bits;
    end else if(T215) begin
      regFile_42 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_43 <= 32'h0;
    end else if(T222) begin
      regFile_43 <= io_regIn_43_bits;
    end else if(T220) begin
      regFile_43 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_44 <= 32'h0;
    end else if(T227) begin
      regFile_44 <= io_regIn_44_bits;
    end else if(T225) begin
      regFile_44 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_45 <= 32'h0;
    end else if(T232) begin
      regFile_45 <= io_regIn_45_bits;
    end else if(T230) begin
      regFile_45 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_46 <= 32'h0;
    end else if(T237) begin
      regFile_46 <= io_regIn_46_bits;
    end else if(T235) begin
      regFile_46 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_47 <= 32'h0;
    end else if(T242) begin
      regFile_47 <= io_regIn_47_bits;
    end else if(T240) begin
      regFile_47 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_48 <= 32'h0;
    end else if(T247) begin
      regFile_48 <= io_regIn_48_bits;
    end else if(T245) begin
      regFile_48 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_49 <= 32'h0;
    end else if(T252) begin
      regFile_49 <= io_regIn_49_bits;
    end else if(T250) begin
      regFile_49 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_50 <= 32'h0;
    end else if(T257) begin
      regFile_50 <= io_regIn_50_bits;
    end else if(T255) begin
      regFile_50 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_51 <= 32'h0;
    end else if(T262) begin
      regFile_51 <= io_regIn_51_bits;
    end else if(T260) begin
      regFile_51 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_52 <= 32'h0;
    end else if(T267) begin
      regFile_52 <= io_regIn_52_bits;
    end else if(T265) begin
      regFile_52 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_53 <= 32'h0;
    end else if(T272) begin
      regFile_53 <= io_regIn_53_bits;
    end else if(T270) begin
      regFile_53 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_54 <= 32'h0;
    end else if(T277) begin
      regFile_54 <= io_regIn_54_bits;
    end else if(T275) begin
      regFile_54 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_55 <= 32'h0;
    end else if(T282) begin
      regFile_55 <= io_regIn_55_bits;
    end else if(T280) begin
      regFile_55 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_56 <= 32'h0;
    end else if(T287) begin
      regFile_56 <= io_regIn_56_bits;
    end else if(T285) begin
      regFile_56 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_57 <= 32'h0;
    end else if(T292) begin
      regFile_57 <= io_regIn_57_bits;
    end else if(T290) begin
      regFile_57 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_58 <= 32'h0;
    end else if(T297) begin
      regFile_58 <= io_regIn_58_bits;
    end else if(T295) begin
      regFile_58 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_59 <= 32'h0;
    end else if(T302) begin
      regFile_59 <= io_regIn_59_bits;
    end else if(T300) begin
      regFile_59 <= regCommand_writeData;
    end
    regCommand_read <= io_extIF_cmd_bits_read;
  end
endmodule

module Queue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_channelID,
    input  io_enq_bits_isWrite,
    input [47:0] io_enq_bits_addr,
    input [7:0] io_enq_bits_numBytes,
    input  io_enq_bits_metaData,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_channelID,
    output io_deq_bits_isWrite,
    output[47:0] io_deq_bits_addr,
    output[7:0] io_deq_bits_numBytes,
    output io_deq_bits_metaData,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T25;
  wire T2;
  wire T3;
  wire do_deq;
  reg  R4;
  wire T26;
  wire T5;
  wire T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T27;
  wire T8;
  wire T9;
  wire T10;
  wire[89:0] T11;
  reg [89:0] ram [1:0];
  wire[89:0] T12;
  wire[89:0] T13;
  wire[89:0] T14;
  wire[56:0] T15;
  wire[8:0] T16;
  wire[32:0] T17;
  wire[7:0] T18;
  wire[47:0] T19;
  wire T20;
  wire[31:0] T21;
  wire T22;
  wire empty;
  wire T23;
  wire T24;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {3{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T25 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T26 = reset ? 1'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 1'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T27 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits_metaData = T10;
  assign T10 = T11[0];
  assign T11 = ram[R1];
  assign T13 = T14;
  assign T14 = {T17, T15};
  assign T15 = {io_enq_bits_addr, T16};
  assign T16 = {io_enq_bits_numBytes, io_enq_bits_metaData};
  assign T17 = {io_enq_bits_channelID, io_enq_bits_isWrite};
  assign io_deq_bits_numBytes = T18;
  assign T18 = T11[8:1];
  assign io_deq_bits_addr = T19;
  assign T19 = T11[56:9];
  assign io_deq_bits_isWrite = T20;
  assign T20 = T11[57];
  assign io_deq_bits_channelID = T21;
  assign T21 = T11[89:58];
  assign io_deq_valid = T22;
  assign T22 = empty ^ 1'h1;
  assign empty = ptr_match & T23;
  assign T23 = maybe_full ^ 1'h1;
  assign io_enq_ready = T24;
  assign T24 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 1'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= T13;
  end
endmodule

module Queue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T15;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T16;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire[63:0] T10;
  reg [63:0] ram [15:0];
  wire[63:0] T11;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {2{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T15 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T16 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= io_enq_bits;
  end
endmodule

module Queue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_channelID,
    input [63:0] io_enq_bits_readData,
    input  io_enq_bits_isWrite,
    input  io_enq_bits_isLast,
    input  io_enq_bits_metaData,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_channelID,
    output[63:0] io_deq_bits_readData,
    output io_deq_bits_isWrite,
    output io_deq_bits_isLast,
    output io_deq_bits_metaData,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T25;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T26;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T27;
  wire T8;
  wire T9;
  wire T10;
  wire[98:0] T11;
  reg [98:0] ram [15:0];
  wire[98:0] T12;
  wire[98:0] T13;
  wire[98:0] T14;
  wire[2:0] T15;
  wire[1:0] T16;
  wire[95:0] T17;
  wire T18;
  wire T19;
  wire[63:0] T20;
  wire[31:0] T21;
  wire T22;
  wire empty;
  wire T23;
  wire T24;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {4{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T25 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T26 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T27 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits_metaData = T10;
  assign T10 = T11[0];
  assign T11 = ram[R1];
  assign T13 = T14;
  assign T14 = {T17, T15};
  assign T15 = {io_enq_bits_isWrite, T16};
  assign T16 = {io_enq_bits_isLast, io_enq_bits_metaData};
  assign T17 = {io_enq_bits_channelID, io_enq_bits_readData};
  assign io_deq_bits_isLast = T18;
  assign T18 = T11[1];
  assign io_deq_bits_isWrite = T19;
  assign T19 = T11[2];
  assign io_deq_bits_readData = T20;
  assign T20 = T11[66:3];
  assign io_deq_bits_channelID = T21;
  assign T21 = T11[98:67];
  assign io_deq_valid = T22;
  assign T22 = empty ^ 1'h1;
  assign empty = ptr_match & T23;
  assign T23 = maybe_full ^ 1'h1;
  assign io_enq_ready = T24;
  assign T24 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= T13;
  end
endmodule

module VerilatedTesterWrapper(input clk, input reset,
    input  io_regFileIF_cmd_valid,
    input [5:0] io_regFileIF_cmd_bits_regID,
    input  io_regFileIF_cmd_bits_read,
    input  io_regFileIF_cmd_bits_write,
    input [31:0] io_regFileIF_cmd_bits_writeData,
    output io_regFileIF_readData_valid,
    output[31:0] io_regFileIF_readData_bits,
    output[5:0] io_regFileIF_regCount,
    input [47:0] io_memAddr,
    input  io_memWriteEn,
    input [63:0] io_memWriteData,
    output[63:0] io_memReadData
);

  wire T95;
  reg  regWrapperReset;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T0;
  reg  R1;
  wire T102;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  reg [7:0] R7;
  wire[7:0] T8;
  wire[7:0] T103;
  wire[7:0] T9;
  wire[7:0] T10;
  wire[7:0] T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  reg [31:0] R17;
  wire[31:0] T18;
  wire[31:0] T104;
  wire[31:0] T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  reg  R25;
  wire T105;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  reg [7:0] R33;
  wire[7:0] T34;
  wire[7:0] T106;
  wire[7:0] T35;
  wire[7:0] T36;
  wire[7:0] T37;
  wire[7:0] T38;
  wire T39;
  wire[7:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire[31:0] T107;
  wire[31:0] T108;
  wire[31:0] T109;
  wire[31:0] T110;
  wire T48;
  wire T49;
  wire[3:0] T111;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[1:0] T112;
  wire[1:0] T113;
  wire[1:0] T114;
  wire T54;
  wire[207:0] T115;
  wire[223:0] T55;
  wire[191:0] T56;
  wire[159:0] T57;
  wire[127:0] T58;
  wire[95:0] T59;
  wire[63:0] T60;
  wire T61;
  wire[127:0] T62;
  wire[95:0] T63;
  wire[63:0] T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire[63:0] T72;
  reg [63:0] mem [67108863:0];
  wire[63:0] T73;
  wire[25:0] T116;
  wire[44:0] T74;
  reg [47:0] R75;
  wire[47:0] T76;
  wire[47:0] T117;
  wire[47:0] T77;
  wire[47:0] T78;
  wire[47:0] T79;
  wire[63:0] T80;
  wire[25:0] T118;
  wire[44:0] memWord;
  wire[25:0] T119;
  wire[44:0] T81;
  reg [47:0] R82;
  wire[47:0] T83;
  wire[47:0] T120;
  wire[47:0] T84;
  wire[47:0] T85;
  wire[47:0] T86;
  wire[47:0] T87;
  wire[47:0] T88;
  reg [31:0] R89;
  wire[31:0] T90;
  wire[31:0] T121;
  wire[31:0] T91;
  wire[31:0] T92;
  wire[31:0] T93;
  wire[63:0] T94;
  wire[25:0] T122;
  wire RegFile_io_extIF_readData_valid;
  wire[31:0] RegFile_io_extIF_readData_bits;
  wire[5:0] RegFile_io_extIF_regCount;
  wire[31:0] RegFile_io_regOut_54;
  wire[31:0] RegFile_io_regOut_53;
  wire[31:0] RegFile_io_regOut_51;
  wire[31:0] RegFile_io_regOut_49;
  wire[31:0] RegFile_io_regOut_47;
  wire[31:0] RegFile_io_regOut_45;
  wire[31:0] RegFile_io_regOut_43;
  wire[31:0] RegFile_io_regOut_42;
  wire[31:0] RegFile_io_regOut_41;
  wire[31:0] RegFile_io_regOut_40;
  wire[31:0] RegFile_io_regOut_39;
  wire[31:0] RegFile_io_regOut_27;
  wire[31:0] RegFile_io_regOut_25;
  wire[31:0] RegFile_io_regOut_24;
  wire[31:0] RegFile_io_regOut_23;
  wire[31:0] RegFile_io_regOut_21;
  wire[31:0] RegFile_io_regOut_20;
  wire[31:0] RegFile_io_regOut_19;
  wire[31:0] RegFile_io_regOut_18;
  wire[31:0] RegFile_io_regOut_17;
  wire[31:0] RegFile_io_regOut_16;
  wire[31:0] RegFile_io_regOut_15;
  wire[31:0] RegFile_io_regOut_14;
  wire[31:0] RegFile_io_regOut_12;
  wire[31:0] RegFile_io_regOut_11;
  wire[31:0] RegFile_io_regOut_10;
  wire[31:0] RegFile_io_regOut_9;
  wire[31:0] RegFile_io_regOut_8;
  wire[31:0] RegFile_io_regOut_7;
  wire[31:0] RegFile_io_regOut_6;
  wire[31:0] RegFile_io_regOut_5;
  wire[31:0] RegFile_io_regOut_4;
  wire[31:0] RegFile_io_regOut_2;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire[31:0] Queue_io_deq_bits_channelID;
  wire Queue_io_deq_bits_isWrite;
  wire[47:0] Queue_io_deq_bits_addr;
  wire[7:0] Queue_io_deq_bits_numBytes;
  wire Queue_io_deq_bits_metaData;
  wire Queue_1_io_enq_ready;
  wire Queue_1_io_deq_valid;
  wire[31:0] Queue_1_io_deq_bits_channelID;
  wire Queue_1_io_deq_bits_isWrite;
  wire[47:0] Queue_1_io_deq_bits_addr;
  wire[7:0] Queue_1_io_deq_bits_numBytes;
  wire Queue_1_io_deq_bits_metaData;
  wire Queue_2_io_enq_ready;
  wire Queue_2_io_deq_valid;
  wire[31:0] Queue_2_io_deq_bits_channelID;
  wire Queue_2_io_deq_bits_isWrite;
  wire[47:0] Queue_2_io_deq_bits_addr;
  wire[7:0] Queue_2_io_deq_bits_numBytes;
  wire Queue_2_io_deq_bits_metaData;
  wire Queue_3_io_enq_ready;
  wire Queue_3_io_deq_valid;
  wire[31:0] Queue_3_io_deq_bits_channelID;
  wire Queue_3_io_deq_bits_isWrite;
  wire[47:0] Queue_3_io_deq_bits_addr;
  wire[7:0] Queue_3_io_deq_bits_numBytes;
  wire Queue_3_io_deq_bits_metaData;
  wire Queue_4_io_enq_ready;
  wire Queue_4_io_deq_valid;
  wire[31:0] Queue_4_io_deq_bits_channelID;
  wire Queue_4_io_deq_bits_isWrite;
  wire[47:0] Queue_4_io_deq_bits_addr;
  wire[7:0] Queue_4_io_deq_bits_numBytes;
  wire Queue_4_io_deq_bits_metaData;
  wire Queue_5_io_enq_ready;
  wire Queue_5_io_deq_valid;
  wire[31:0] Queue_5_io_deq_bits_channelID;
  wire Queue_5_io_deq_bits_isWrite;
  wire[47:0] Queue_5_io_deq_bits_addr;
  wire[7:0] Queue_5_io_deq_bits_numBytes;
  wire Queue_5_io_deq_bits_metaData;
  wire Queue_6_io_enq_ready;
  wire Queue_6_io_deq_valid;
  wire[31:0] Queue_6_io_deq_bits_channelID;
  wire Queue_6_io_deq_bits_isWrite;
  wire[47:0] Queue_6_io_deq_bits_addr;
  wire[7:0] Queue_6_io_deq_bits_numBytes;
  wire Queue_6_io_deq_bits_metaData;
  wire Queue_7_io_enq_ready;
  wire Queue_7_io_deq_valid;
  wire[31:0] Queue_7_io_deq_bits_channelID;
  wire Queue_7_io_deq_bits_isWrite;
  wire[47:0] Queue_7_io_deq_bits_addr;
  wire[7:0] Queue_7_io_deq_bits_numBytes;
  wire Queue_7_io_deq_bits_metaData;
  wire Queue_8_io_enq_ready;
  wire Queue_8_io_deq_valid;
  wire[31:0] Queue_8_io_deq_bits_channelID;
  wire Queue_8_io_deq_bits_isWrite;
  wire[47:0] Queue_8_io_deq_bits_addr;
  wire[7:0] Queue_8_io_deq_bits_numBytes;
  wire Queue_8_io_deq_bits_metaData;
  wire Queue_9_io_enq_ready;
  wire Queue_9_io_deq_valid;
  wire[31:0] Queue_9_io_deq_bits_channelID;
  wire Queue_9_io_deq_bits_isWrite;
  wire[47:0] Queue_9_io_deq_bits_addr;
  wire[7:0] Queue_9_io_deq_bits_numBytes;
  wire Queue_9_io_deq_bits_metaData;
  wire Queue_10_io_enq_ready;
  wire Queue_10_io_deq_valid;
  wire[31:0] Queue_10_io_deq_bits_channelID;
  wire Queue_10_io_deq_bits_isWrite;
  wire[47:0] Queue_10_io_deq_bits_addr;
  wire[7:0] Queue_10_io_deq_bits_numBytes;
  wire Queue_10_io_deq_bits_metaData;
  wire Queue_11_io_enq_ready;
  wire Queue_11_io_deq_valid;
  wire[31:0] Queue_11_io_deq_bits_channelID;
  wire Queue_11_io_deq_bits_isWrite;
  wire[47:0] Queue_11_io_deq_bits_addr;
  wire[7:0] Queue_11_io_deq_bits_numBytes;
  wire Queue_11_io_deq_bits_metaData;
  wire Queue_12_io_enq_ready;
  wire Queue_12_io_deq_valid;
  wire[31:0] Queue_12_io_deq_bits_channelID;
  wire Queue_12_io_deq_bits_isWrite;
  wire[47:0] Queue_12_io_deq_bits_addr;
  wire[7:0] Queue_12_io_deq_bits_numBytes;
  wire Queue_12_io_deq_bits_metaData;
  wire Queue_13_io_enq_ready;
  wire Queue_13_io_deq_valid;
  wire[31:0] Queue_13_io_deq_bits_channelID;
  wire Queue_13_io_deq_bits_isWrite;
  wire[47:0] Queue_13_io_deq_bits_addr;
  wire[7:0] Queue_13_io_deq_bits_numBytes;
  wire Queue_13_io_deq_bits_metaData;
  wire Queue_14_io_enq_ready;
  wire Queue_14_io_deq_valid;
  wire[31:0] Queue_14_io_deq_bits_channelID;
  wire[47:0] Queue_14_io_deq_bits_addr;
  wire[7:0] Queue_14_io_deq_bits_numBytes;
  wire Queue_15_io_enq_ready;
  wire Queue_15_io_deq_valid;
  wire[63:0] Queue_15_io_deq_bits;
  wire Queue_16_io_enq_ready;
  wire Queue_16_io_deq_valid;
  wire[31:0] Queue_16_io_deq_bits_channelID;
  wire[63:0] Queue_16_io_deq_bits_readData;
  wire Queue_16_io_deq_bits_isWrite;
  wire Queue_16_io_deq_bits_isLast;
  wire Queue_16_io_deq_bits_metaData;
  wire Queue_17_io_enq_ready;
  wire Queue_17_io_deq_valid;
  wire[31:0] Queue_17_io_deq_bits_channelID;
  wire Queue_17_io_deq_bits_isWrite;
  wire[47:0] Queue_17_io_deq_bits_addr;
  wire[7:0] Queue_17_io_deq_bits_numBytes;
  wire Queue_17_io_deq_bits_metaData;
  wire Queue_18_io_enq_ready;
  wire Queue_18_io_deq_valid;
  wire[31:0] Queue_18_io_deq_bits_channelID;
  wire Queue_18_io_deq_bits_isWrite;
  wire[47:0] Queue_18_io_deq_bits_addr;
  wire[7:0] Queue_18_io_deq_bits_numBytes;
  wire Queue_18_io_deq_bits_metaData;
  wire Queue_19_io_enq_ready;
  wire Queue_19_io_deq_valid;
  wire[31:0] Queue_19_io_deq_bits_channelID;
  wire Queue_19_io_deq_bits_isWrite;
  wire[47:0] Queue_19_io_deq_bits_addr;
  wire[7:0] Queue_19_io_deq_bits_numBytes;
  wire Queue_19_io_deq_bits_metaData;
  wire Queue_20_io_enq_ready;
  wire Queue_20_io_deq_valid;
  wire[31:0] Queue_20_io_deq_bits_channelID;
  wire Queue_20_io_deq_bits_isWrite;
  wire[47:0] Queue_20_io_deq_bits_addr;
  wire[7:0] Queue_20_io_deq_bits_numBytes;
  wire Queue_20_io_deq_bits_metaData;
  wire Queue_21_io_enq_ready;
  wire Queue_21_io_deq_valid;
  wire[31:0] Queue_21_io_deq_bits_channelID;
  wire Queue_21_io_deq_bits_isWrite;
  wire[47:0] Queue_21_io_deq_bits_addr;
  wire[7:0] Queue_21_io_deq_bits_numBytes;
  wire Queue_21_io_deq_bits_metaData;
  wire Queue_22_io_enq_ready;
  wire Queue_22_io_deq_valid;
  wire[31:0] Queue_22_io_deq_bits_channelID;
  wire Queue_22_io_deq_bits_isWrite;
  wire[47:0] Queue_22_io_deq_bits_addr;
  wire[7:0] Queue_22_io_deq_bits_numBytes;
  wire Queue_22_io_deq_bits_metaData;
  wire Queue_23_io_enq_ready;
  wire Queue_23_io_deq_valid;
  wire[31:0] Queue_23_io_deq_bits_channelID;
  wire Queue_23_io_deq_bits_isWrite;
  wire[47:0] Queue_23_io_deq_bits_addr;
  wire[7:0] Queue_23_io_deq_bits_numBytes;
  wire Queue_23_io_deq_bits_metaData;
  wire Queue_24_io_enq_ready;
  wire Queue_24_io_deq_valid;
  wire[31:0] Queue_24_io_deq_bits_channelID;
  wire Queue_24_io_deq_bits_isWrite;
  wire[47:0] Queue_24_io_deq_bits_addr;
  wire[7:0] Queue_24_io_deq_bits_numBytes;
  wire Queue_24_io_deq_bits_metaData;
  wire Queue_25_io_enq_ready;
  wire Queue_25_io_deq_valid;
  wire[31:0] Queue_25_io_deq_bits_channelID;
  wire Queue_25_io_deq_bits_isWrite;
  wire[47:0] Queue_25_io_deq_bits_addr;
  wire[7:0] Queue_25_io_deq_bits_numBytes;
  wire Queue_25_io_deq_bits_metaData;
  wire Queue_26_io_enq_ready;
  wire Queue_26_io_deq_valid;
  wire[31:0] Queue_26_io_deq_bits_channelID;
  wire[47:0] Queue_26_io_deq_bits_addr;
  wire[7:0] Queue_26_io_deq_bits_numBytes;
  wire BitSerialMatMulAccel_io_memPort_0_memRdReq_valid;
  wire[31:0] BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_channelID;
  wire BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_isWrite;
  wire[47:0] BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_addr;
  wire[7:0] BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_numBytes;
  wire BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_metaData;
  wire BitSerialMatMulAccel_io_memPort_0_memRdRsp_ready;
  wire BitSerialMatMulAccel_io_memPort_0_memWrReq_valid;
  wire[31:0] BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_channelID;
  wire BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_isWrite;
  wire[47:0] BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_addr;
  wire[7:0] BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_numBytes;
  wire BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_metaData;
  wire BitSerialMatMulAccel_io_memPort_0_memWrDat_valid;
  wire[63:0] BitSerialMatMulAccel_io_memPort_0_memWrDat_bits;
  wire BitSerialMatMulAccel_io_memPort_0_memWrRsp_ready;
  wire[31:0] BitSerialMatMulAccel_io_signature;
  wire BitSerialMatMulAccel_io_ins_ready;
  wire BitSerialMatMulAccel_io_dsc_ready;
  wire[31:0] BitSerialMatMulAccel_io_fetch_op_count;
  wire[31:0] BitSerialMatMulAccel_io_exec_op_count;
  wire[31:0] BitSerialMatMulAccel_io_result_op_count;
  wire[31:0] BitSerialMatMulAccel_io_hw_readChanWidth;
  wire[31:0] BitSerialMatMulAccel_io_hw_writeChanWidth;
  wire[31:0] BitSerialMatMulAccel_io_hw_dpaDimLHS;
  wire[31:0] BitSerialMatMulAccel_io_hw_dpaDimRHS;
  wire[31:0] BitSerialMatMulAccel_io_hw_dpaDimCommon;
  wire[31:0] BitSerialMatMulAccel_io_hw_lhsEntriesPerMem;
  wire[31:0] BitSerialMatMulAccel_io_hw_rhsEntriesPerMem;
  wire[31:0] BitSerialMatMulAccel_io_hw_accWidth;
  wire[31:0] BitSerialMatMulAccel_io_hw_maxShiftSteps;
  wire[31:0] BitSerialMatMulAccel_io_hw_cmdQueueEntries;
  wire[31:0] BitSerialMatMulAccel_io_perf_cc;
  wire[31:0] BitSerialMatMulAccel_io_perf_prf_fetch_count;
  wire[31:0] BitSerialMatMulAccel_io_perf_prf_exec_count;
  wire[31:0] BitSerialMatMulAccel_io_perf_prf_res_count;
  wire[31:0] BitSerialMatMulAccel_io_tc_fe;
  wire[31:0] BitSerialMatMulAccel_io_tc_ef;
  wire[31:0] BitSerialMatMulAccel_io_tc_re;
  wire[31:0] BitSerialMatMulAccel_io_tc_er;
  wire BitSerialMatMulAccel_io_cmdqueue_ready;
  wire BitSerialMatMulAccel_io_ackqueue_valid;
  wire[31:0] BitSerialMatMulAccel_io_ackqueue_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regWrapperReset = {1{$random}};
    R1 = {1{$random}};
    R7 = {1{$random}};
    R17 = {1{$random}};
    R25 = {1{$random}};
    R33 = {1{$random}};
    for (initvar = 0; initvar < 67108864; initvar = initvar+1)
      mem[initvar] = {2{$random}};
    R75 = {2{$random}};
    R82 = {2{$random}};
    R89 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T95 = reset | regWrapperReset;
  assign T96 = reset ? 1'h0 : T97;
  assign T97 = T99 ? T98 : regWrapperReset;
  assign T98 = io_regFileIF_cmd_bits_writeData[0];
  assign T99 = T101 & T100;
  assign T100 = io_regFileIF_cmd_bits_regID == 6'h0;
  assign T101 = io_regFileIF_cmd_valid & io_regFileIF_cmd_bits_write;
  assign T0 = 1'h0 == R1;
  assign T102 = reset ? 1'h0 : T2;
  assign T2 = T5 ? 1'h0 : T3;
  assign T3 = T4 ? 1'h1 : R1;
  assign T4 = T0 & Queue_26_io_deq_valid;
  assign T5 = T16 & T6;
  assign T6 = R7 == 8'h0;
  assign T8 = 8'h0;
  assign T103 = reset ? T8 : T9;
  assign T9 = T12 ? T11 : T10;
  assign T10 = T4 ? Queue_26_io_deq_bits_numBytes : R7;
  assign T11 = R7 - 8'h8;
  assign T12 = T14 & T13;
  assign T13 = Queue_16_io_enq_ready & Queue_15_io_deq_valid;
  assign T14 = T16 & T15;
  assign T15 = T6 ^ 1'h1;
  assign T16 = 1'h1 == R1;
  assign T18 = 32'h0;
  assign T104 = reset ? T18 : T19;
  assign T19 = T4 ? Queue_26_io_deq_bits_channelID : R17;
  assign T20 = T12 & T21;
  assign T21 = R7 == 8'h8;
  assign T22 = T46 ? 1'h1 : T23;
  assign T23 = T31 ? 1'h1 : T24;
  assign T24 = 1'h0 == R25;
  assign T105 = reset ? 1'h0 : T26;
  assign T26 = T29 ? 1'h0 : T27;
  assign T27 = T28 ? 1'h1 : R25;
  assign T28 = T24 & Queue_14_io_deq_valid;
  assign T29 = T31 & T30;
  assign T30 = Queue_14_io_deq_valid ^ 1'h1;
  assign T31 = T45 & T32;
  assign T32 = R33 == 8'h0;
  assign T34 = 8'h0;
  assign T106 = reset ? T34 : T35;
  assign T35 = T44 ? Queue_14_io_deq_bits_numBytes : T36;
  assign T36 = T41 ? T40 : T37;
  assign T37 = T39 ? Queue_14_io_deq_bits_numBytes : T38;
  assign T38 = T28 ? Queue_14_io_deq_bits_numBytes : R33;
  assign T39 = T31 & Queue_14_io_deq_valid;
  assign T40 = R33 - 8'h8;
  assign T41 = T42 & BitSerialMatMulAccel_io_memPort_0_memRdRsp_ready;
  assign T42 = T45 & T43;
  assign T43 = T32 ^ 1'h1;
  assign T44 = T46 & Queue_14_io_deq_valid;
  assign T45 = 1'h1 == R25;
  assign T46 = T41 & T47;
  assign T47 = R33 == 8'h8;
  assign T107 = {31'h0, BitSerialMatMulAccel_io_ackqueue_valid};
  assign T108 = {31'h0, BitSerialMatMulAccel_io_cmdqueue_ready};
  assign T109 = {31'h0, BitSerialMatMulAccel_io_dsc_ready};
  assign T110 = {31'h0, BitSerialMatMulAccel_io_ins_ready};
  assign T48 = RegFile_io_regOut_2[0];
  assign T49 = RegFile_io_regOut_11[0];
  assign T111 = RegFile_io_regOut_6[3:0];
  assign T50 = RegFile_io_regOut_14[0];
  assign T51 = RegFile_io_regOut_24[0];
  assign T52 = RegFile_io_regOut_5[0];
  assign T53 = RegFile_io_regOut_4[0];
  assign T112 = RegFile_io_regOut_53[1:0];
  assign T113 = RegFile_io_regOut_49[1:0];
  assign T114 = RegFile_io_regOut_51[1:0];
  assign T54 = RegFile_io_regOut_47[0];
  assign T115 = T55[207:0];
  assign T55 = {T56, RegFile_io_regOut_21};
  assign T56 = {T57, RegFile_io_regOut_20};
  assign T57 = {T58, RegFile_io_regOut_19};
  assign T58 = {T59, RegFile_io_regOut_18};
  assign T59 = {T60, RegFile_io_regOut_17};
  assign T60 = {RegFile_io_regOut_15, RegFile_io_regOut_16};
  assign T61 = RegFile_io_regOut_23[0];
  assign T62 = {T63, RegFile_io_regOut_43};
  assign T63 = {T64, RegFile_io_regOut_42};
  assign T64 = {RegFile_io_regOut_40, RegFile_io_regOut_41};
  assign T65 = RegFile_io_regOut_45[0];
  assign T66 = RegFile_io_regOut_39[0];
  assign T67 = RegFile_io_regOut_54[0];
  assign T68 = RegFile_io_regOut_25[0];
  assign T69 = RegFile_io_regOut_27[0];
  assign T70 = T42 ? T71 : 1'h0;
  assign T71 = R33 == 8'h8;
  assign T72 = mem[T119];
  assign T116 = T74[25:0];
  assign T74 = R75 >> 2'h3;
  assign T76 = 48'h0;
  assign T117 = reset ? T76 : T77;
  assign T77 = T12 ? T79 : T78;
  assign T78 = T4 ? Queue_26_io_deq_bits_addr : R75;
  assign T79 = R75 + 48'h8;
  assign T118 = memWord[25:0];
  assign memWord = io_memAddr >> 2'h3;
  assign T119 = T81[25:0];
  assign T81 = R82 >> 2'h3;
  assign T83 = 48'h0;
  assign T120 = reset ? T83 : T84;
  assign T84 = T44 ? Queue_14_io_deq_bits_addr : T85;
  assign T85 = T41 ? T88 : T86;
  assign T86 = T39 ? Queue_14_io_deq_bits_addr : T87;
  assign T87 = T28 ? Queue_14_io_deq_bits_addr : R82;
  assign T88 = R82 + 48'h8;
  assign T90 = 32'h0;
  assign T121 = reset ? T90 : T91;
  assign T91 = T44 ? Queue_14_io_deq_bits_channelID : T92;
  assign T92 = T39 ? Queue_14_io_deq_bits_channelID : T93;
  assign T93 = T28 ? Queue_14_io_deq_bits_channelID : R89;
  assign io_memReadData = T94;
  assign T94 = mem[T122];
  assign T122 = memWord[25:0];
  assign io_regFileIF_regCount = RegFile_io_extIF_regCount;
  assign io_regFileIF_readData_bits = RegFile_io_extIF_readData_bits;
  assign io_regFileIF_readData_valid = RegFile_io_extIF_readData_valid;
  BitSerialMatMulAccel BitSerialMatMulAccel(.clk(clk), .reset(T95),
       .io_memPort_0_memRdReq_ready( Queue_io_enq_ready ),
       .io_memPort_0_memRdReq_valid( BitSerialMatMulAccel_io_memPort_0_memRdReq_valid ),
       .io_memPort_0_memRdReq_bits_channelID( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_channelID ),
       .io_memPort_0_memRdReq_bits_isWrite( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_isWrite ),
       .io_memPort_0_memRdReq_bits_addr( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_addr ),
       .io_memPort_0_memRdReq_bits_numBytes( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_numBytes ),
       .io_memPort_0_memRdReq_bits_metaData( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_metaData ),
       .io_memPort_0_memRdRsp_ready( BitSerialMatMulAccel_io_memPort_0_memRdRsp_ready ),
       .io_memPort_0_memRdRsp_valid( T42 ),
       .io_memPort_0_memRdRsp_bits_channelID( R89 ),
       .io_memPort_0_memRdRsp_bits_readData( T72 ),
       .io_memPort_0_memRdRsp_bits_isWrite( 1'h0 ),
       .io_memPort_0_memRdRsp_bits_isLast( T70 ),
       .io_memPort_0_memRdRsp_bits_metaData( 1'h0 ),
       .io_memPort_0_memWrReq_ready( Queue_17_io_enq_ready ),
       .io_memPort_0_memWrReq_valid( BitSerialMatMulAccel_io_memPort_0_memWrReq_valid ),
       .io_memPort_0_memWrReq_bits_channelID( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_channelID ),
       .io_memPort_0_memWrReq_bits_isWrite( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_isWrite ),
       .io_memPort_0_memWrReq_bits_addr( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_addr ),
       .io_memPort_0_memWrReq_bits_numBytes( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_numBytes ),
       .io_memPort_0_memWrReq_bits_metaData( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_metaData ),
       .io_memPort_0_memWrDat_ready( Queue_15_io_enq_ready ),
       .io_memPort_0_memWrDat_valid( BitSerialMatMulAccel_io_memPort_0_memWrDat_valid ),
       .io_memPort_0_memWrDat_bits( BitSerialMatMulAccel_io_memPort_0_memWrDat_bits ),
       .io_memPort_0_memWrRsp_ready( BitSerialMatMulAccel_io_memPort_0_memWrRsp_ready ),
       .io_memPort_0_memWrRsp_valid( Queue_16_io_deq_valid ),
       .io_memPort_0_memWrRsp_bits_channelID( Queue_16_io_deq_bits_channelID ),
       .io_memPort_0_memWrRsp_bits_readData( Queue_16_io_deq_bits_readData ),
       .io_memPort_0_memWrRsp_bits_isWrite( Queue_16_io_deq_bits_isWrite ),
       .io_memPort_0_memWrRsp_bits_isLast( Queue_16_io_deq_bits_isLast ),
       .io_memPort_0_memWrRsp_bits_metaData( Queue_16_io_deq_bits_metaData ),
       .io_signature( BitSerialMatMulAccel_io_signature ),
       .io_fetch_enable( T69 ),
       .io_exec_enable( T68 ),
       .io_result_enable( T67 ),
       .io_insOrDsc( T66 ),
       .io_ins_ready( BitSerialMatMulAccel_io_ins_ready ),
       .io_ins_valid( T65 ),
       .io_ins_bits( T62 ),
       .io_dsc_ready( BitSerialMatMulAccel_io_dsc_ready ),
       .io_dsc_valid( T61 ),
       .io_dsc_bits( T115 ),
       .io_fetch_op_count( BitSerialMatMulAccel_io_fetch_op_count ),
       .io_exec_op_count( BitSerialMatMulAccel_io_exec_op_count ),
       .io_result_op_count( BitSerialMatMulAccel_io_result_op_count ),
       .io_hw_readChanWidth( BitSerialMatMulAccel_io_hw_readChanWidth ),
       .io_hw_writeChanWidth( BitSerialMatMulAccel_io_hw_writeChanWidth ),
       .io_hw_dpaDimLHS( BitSerialMatMulAccel_io_hw_dpaDimLHS ),
       .io_hw_dpaDimRHS( BitSerialMatMulAccel_io_hw_dpaDimRHS ),
       .io_hw_dpaDimCommon( BitSerialMatMulAccel_io_hw_dpaDimCommon ),
       .io_hw_lhsEntriesPerMem( BitSerialMatMulAccel_io_hw_lhsEntriesPerMem ),
       .io_hw_rhsEntriesPerMem( BitSerialMatMulAccel_io_hw_rhsEntriesPerMem ),
       .io_hw_accWidth( BitSerialMatMulAccel_io_hw_accWidth ),
       .io_hw_maxShiftSteps( BitSerialMatMulAccel_io_hw_maxShiftSteps ),
       .io_hw_cmdQueueEntries( BitSerialMatMulAccel_io_hw_cmdQueueEntries ),
       .io_perf_cc( BitSerialMatMulAccel_io_perf_cc ),
       .io_perf_cc_enable( T54 ),
       .io_perf_prf_fetch_count( BitSerialMatMulAccel_io_perf_prf_fetch_count ),
       .io_perf_prf_fetch_sel( T114 ),
       .io_perf_prf_exec_count( BitSerialMatMulAccel_io_perf_prf_exec_count ),
       .io_perf_prf_exec_sel( T113 ),
       .io_perf_prf_res_count( BitSerialMatMulAccel_io_perf_prf_res_count ),
       .io_perf_prf_res_sel( T112 ),
       .io_tc_fe( BitSerialMatMulAccel_io_tc_fe ),
       .io_tc_ef( BitSerialMatMulAccel_io_tc_ef ),
       .io_tc_re( BitSerialMatMulAccel_io_tc_re ),
       .io_tc_er( BitSerialMatMulAccel_io_tc_er ),
       .io_addtoken_ef( T53 ),
       .io_addtoken_re( T52 ),
       .io_enable( T51 ),
       .io_cmdqueue_ready( BitSerialMatMulAccel_io_cmdqueue_ready ),
       .io_cmdqueue_valid( T50 ),
       .io_cmdqueue_bits_dramBaseAddrSrc( RegFile_io_regOut_8 ),
       .io_cmdqueue_bits_dramBaseAddrDst( RegFile_io_regOut_7 ),
       .io_cmdqueue_bits_matrixRows( RegFile_io_regOut_10 ),
       .io_cmdqueue_bits_matrixColsGroup( RegFile_io_regOut_9 ),
       .io_cmdqueue_bits_actualPrecision( T111 ),
       .io_cmdqueue_bits_waitCompleteBytes( RegFile_io_regOut_12 ),
       .io_cmdqueue_bits_signed( T49 ),
       .io_ackqueue_ready( T48 ),
       .io_ackqueue_valid( BitSerialMatMulAccel_io_ackqueue_valid ),
       .io_ackqueue_bits( BitSerialMatMulAccel_io_ackqueue_bits )
  );
  RegFile RegFile(.clk(clk), .reset(reset),
       .io_extIF_cmd_valid( io_regFileIF_cmd_valid ),
       .io_extIF_cmd_bits_regID( io_regFileIF_cmd_bits_regID ),
       .io_extIF_cmd_bits_read( io_regFileIF_cmd_bits_read ),
       .io_extIF_cmd_bits_write( io_regFileIF_cmd_bits_write ),
       .io_extIF_cmd_bits_writeData( io_regFileIF_cmd_bits_writeData ),
       .io_extIF_readData_valid( RegFile_io_extIF_readData_valid ),
       .io_extIF_readData_bits( RegFile_io_extIF_readData_bits ),
       .io_extIF_regCount( RegFile_io_extIF_regCount ),
       //.io_regOut_59(  )
       //.io_regOut_58(  )
       //.io_regOut_57(  )
       //.io_regOut_56(  )
       //.io_regOut_55(  )
       .io_regOut_54( RegFile_io_regOut_54 ),
       .io_regOut_53( RegFile_io_regOut_53 ),
       //.io_regOut_52(  )
       .io_regOut_51( RegFile_io_regOut_51 ),
       //.io_regOut_50(  )
       .io_regOut_49( RegFile_io_regOut_49 ),
       //.io_regOut_48(  )
       .io_regOut_47( RegFile_io_regOut_47 ),
       //.io_regOut_46(  )
       .io_regOut_45( RegFile_io_regOut_45 ),
       //.io_regOut_44(  )
       .io_regOut_43( RegFile_io_regOut_43 ),
       .io_regOut_42( RegFile_io_regOut_42 ),
       .io_regOut_41( RegFile_io_regOut_41 ),
       .io_regOut_40( RegFile_io_regOut_40 ),
       .io_regOut_39( RegFile_io_regOut_39 ),
       //.io_regOut_38(  )
       //.io_regOut_37(  )
       //.io_regOut_36(  )
       //.io_regOut_35(  )
       //.io_regOut_34(  )
       //.io_regOut_33(  )
       //.io_regOut_32(  )
       //.io_regOut_31(  )
       //.io_regOut_30(  )
       //.io_regOut_29(  )
       //.io_regOut_28(  )
       .io_regOut_27( RegFile_io_regOut_27 ),
       //.io_regOut_26(  )
       .io_regOut_25( RegFile_io_regOut_25 ),
       .io_regOut_24( RegFile_io_regOut_24 ),
       .io_regOut_23( RegFile_io_regOut_23 ),
       //.io_regOut_22(  )
       .io_regOut_21( RegFile_io_regOut_21 ),
       .io_regOut_20( RegFile_io_regOut_20 ),
       .io_regOut_19( RegFile_io_regOut_19 ),
       .io_regOut_18( RegFile_io_regOut_18 ),
       .io_regOut_17( RegFile_io_regOut_17 ),
       .io_regOut_16( RegFile_io_regOut_16 ),
       .io_regOut_15( RegFile_io_regOut_15 ),
       .io_regOut_14( RegFile_io_regOut_14 ),
       //.io_regOut_13(  )
       .io_regOut_12( RegFile_io_regOut_12 ),
       .io_regOut_11( RegFile_io_regOut_11 ),
       .io_regOut_10( RegFile_io_regOut_10 ),
       .io_regOut_9( RegFile_io_regOut_9 ),
       .io_regOut_8( RegFile_io_regOut_8 ),
       .io_regOut_7( RegFile_io_regOut_7 ),
       .io_regOut_6( RegFile_io_regOut_6 ),
       .io_regOut_5( RegFile_io_regOut_5 ),
       .io_regOut_4( RegFile_io_regOut_4 ),
       //.io_regOut_3(  )
       .io_regOut_2( RegFile_io_regOut_2 ),
       //.io_regOut_1(  )
       //.io_regOut_0(  )
       .io_regIn_59_valid( 1'h1 ),
       .io_regIn_59_bits( BitSerialMatMulAccel_io_tc_re ),
       .io_regIn_58_valid( 1'h1 ),
       .io_regIn_58_bits( BitSerialMatMulAccel_io_tc_fe ),
       .io_regIn_57_valid( 1'h1 ),
       .io_regIn_57_bits( BitSerialMatMulAccel_io_tc_er ),
       .io_regIn_56_valid( 1'h1 ),
       .io_regIn_56_bits( BitSerialMatMulAccel_io_tc_ef ),
       .io_regIn_55_valid( 1'h1 ),
       .io_regIn_55_bits( BitSerialMatMulAccel_io_result_op_count ),
       .io_regIn_54_valid( 1'h0 ),
       //.io_regIn_54_bits(  )
       .io_regIn_53_valid( 1'h0 ),
       //.io_regIn_53_bits(  )
       .io_regIn_52_valid( 1'h1 ),
       .io_regIn_52_bits( BitSerialMatMulAccel_io_perf_prf_res_count ),
       .io_regIn_51_valid( 1'h0 ),
       //.io_regIn_51_bits(  )
       .io_regIn_50_valid( 1'h1 ),
       .io_regIn_50_bits( BitSerialMatMulAccel_io_perf_prf_fetch_count ),
       .io_regIn_49_valid( 1'h0 ),
       //.io_regIn_49_bits(  )
       .io_regIn_48_valid( 1'h1 ),
       .io_regIn_48_bits( BitSerialMatMulAccel_io_perf_prf_exec_count ),
       .io_regIn_47_valid( 1'h0 ),
       //.io_regIn_47_bits(  )
       .io_regIn_46_valid( 1'h1 ),
       .io_regIn_46_bits( BitSerialMatMulAccel_io_perf_cc ),
       .io_regIn_45_valid( 1'h0 ),
       //.io_regIn_45_bits(  )
       .io_regIn_44_valid( 1'h1 ),
       .io_regIn_44_bits( T110 ),
       .io_regIn_43_valid( 1'h0 ),
       //.io_regIn_43_bits(  )
       .io_regIn_42_valid( 1'h0 ),
       //.io_regIn_42_bits(  )
       .io_regIn_41_valid( 1'h0 ),
       //.io_regIn_41_bits(  )
       .io_regIn_40_valid( 1'h0 ),
       //.io_regIn_40_bits(  )
       .io_regIn_39_valid( 1'h0 ),
       //.io_regIn_39_bits(  )
       .io_regIn_38_valid( 1'h1 ),
       .io_regIn_38_bits( BitSerialMatMulAccel_io_hw_writeChanWidth ),
       .io_regIn_37_valid( 1'h1 ),
       .io_regIn_37_bits( BitSerialMatMulAccel_io_hw_rhsEntriesPerMem ),
       .io_regIn_36_valid( 1'h1 ),
       .io_regIn_36_bits( BitSerialMatMulAccel_io_hw_readChanWidth ),
       .io_regIn_35_valid( 1'h1 ),
       .io_regIn_35_bits( BitSerialMatMulAccel_io_hw_maxShiftSteps ),
       .io_regIn_34_valid( 1'h1 ),
       .io_regIn_34_bits( BitSerialMatMulAccel_io_hw_lhsEntriesPerMem ),
       .io_regIn_33_valid( 1'h1 ),
       .io_regIn_33_bits( BitSerialMatMulAccel_io_hw_dpaDimRHS ),
       .io_regIn_32_valid( 1'h1 ),
       .io_regIn_32_bits( BitSerialMatMulAccel_io_hw_dpaDimLHS ),
       .io_regIn_31_valid( 1'h1 ),
       .io_regIn_31_bits( BitSerialMatMulAccel_io_hw_dpaDimCommon ),
       .io_regIn_30_valid( 1'h1 ),
       .io_regIn_30_bits( BitSerialMatMulAccel_io_hw_cmdQueueEntries ),
       .io_regIn_29_valid( 1'h1 ),
       .io_regIn_29_bits( BitSerialMatMulAccel_io_hw_accWidth ),
       .io_regIn_28_valid( 1'h1 ),
       .io_regIn_28_bits( BitSerialMatMulAccel_io_fetch_op_count ),
       .io_regIn_27_valid( 1'h0 ),
       //.io_regIn_27_bits(  )
       .io_regIn_26_valid( 1'h1 ),
       .io_regIn_26_bits( BitSerialMatMulAccel_io_exec_op_count ),
       .io_regIn_25_valid( 1'h0 ),
       //.io_regIn_25_bits(  )
       .io_regIn_24_valid( 1'h0 ),
       //.io_regIn_24_bits(  )
       .io_regIn_23_valid( 1'h0 ),
       //.io_regIn_23_bits(  )
       .io_regIn_22_valid( 1'h1 ),
       .io_regIn_22_bits( T109 ),
       .io_regIn_21_valid( 1'h0 ),
       //.io_regIn_21_bits(  )
       .io_regIn_20_valid( 1'h0 ),
       //.io_regIn_20_bits(  )
       .io_regIn_19_valid( 1'h0 ),
       //.io_regIn_19_bits(  )
       .io_regIn_18_valid( 1'h0 ),
       //.io_regIn_18_bits(  )
       .io_regIn_17_valid( 1'h0 ),
       //.io_regIn_17_bits(  )
       .io_regIn_16_valid( 1'h0 ),
       //.io_regIn_16_bits(  )
       .io_regIn_15_valid( 1'h0 ),
       //.io_regIn_15_bits(  )
       .io_regIn_14_valid( 1'h0 ),
       //.io_regIn_14_bits(  )
       .io_regIn_13_valid( 1'h1 ),
       .io_regIn_13_bits( T108 ),
       .io_regIn_12_valid( 1'h0 ),
       //.io_regIn_12_bits(  )
       .io_regIn_11_valid( 1'h0 ),
       //.io_regIn_11_bits(  )
       .io_regIn_10_valid( 1'h0 ),
       //.io_regIn_10_bits(  )
       .io_regIn_9_valid( 1'h0 ),
       //.io_regIn_9_bits(  )
       .io_regIn_8_valid( 1'h0 ),
       //.io_regIn_8_bits(  )
       .io_regIn_7_valid( 1'h0 ),
       //.io_regIn_7_bits(  )
       .io_regIn_6_valid( 1'h0 ),
       //.io_regIn_6_bits(  )
       .io_regIn_5_valid( 1'h0 ),
       //.io_regIn_5_bits(  )
       .io_regIn_4_valid( 1'h0 ),
       //.io_regIn_4_bits(  )
       .io_regIn_3_valid( 1'h1 ),
       .io_regIn_3_bits( T107 ),
       .io_regIn_2_valid( 1'h0 ),
       //.io_regIn_2_bits(  )
       .io_regIn_1_valid( 1'h1 ),
       .io_regIn_1_bits( BitSerialMatMulAccel_io_ackqueue_bits ),
       .io_regIn_0_valid( 1'h1 ),
       .io_regIn_0_bits( BitSerialMatMulAccel_io_signature )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RegFile.io_regIn_54_bits = {1{$random}};
    assign RegFile.io_regIn_53_bits = {1{$random}};
    assign RegFile.io_regIn_51_bits = {1{$random}};
    assign RegFile.io_regIn_49_bits = {1{$random}};
    assign RegFile.io_regIn_47_bits = {1{$random}};
    assign RegFile.io_regIn_45_bits = {1{$random}};
    assign RegFile.io_regIn_43_bits = {1{$random}};
    assign RegFile.io_regIn_42_bits = {1{$random}};
    assign RegFile.io_regIn_41_bits = {1{$random}};
    assign RegFile.io_regIn_40_bits = {1{$random}};
    assign RegFile.io_regIn_39_bits = {1{$random}};
    assign RegFile.io_regIn_27_bits = {1{$random}};
    assign RegFile.io_regIn_25_bits = {1{$random}};
    assign RegFile.io_regIn_24_bits = {1{$random}};
    assign RegFile.io_regIn_23_bits = {1{$random}};
    assign RegFile.io_regIn_21_bits = {1{$random}};
    assign RegFile.io_regIn_20_bits = {1{$random}};
    assign RegFile.io_regIn_19_bits = {1{$random}};
    assign RegFile.io_regIn_18_bits = {1{$random}};
    assign RegFile.io_regIn_17_bits = {1{$random}};
    assign RegFile.io_regIn_16_bits = {1{$random}};
    assign RegFile.io_regIn_15_bits = {1{$random}};
    assign RegFile.io_regIn_14_bits = {1{$random}};
    assign RegFile.io_regIn_12_bits = {1{$random}};
    assign RegFile.io_regIn_11_bits = {1{$random}};
    assign RegFile.io_regIn_10_bits = {1{$random}};
    assign RegFile.io_regIn_9_bits = {1{$random}};
    assign RegFile.io_regIn_8_bits = {1{$random}};
    assign RegFile.io_regIn_7_bits = {1{$random}};
    assign RegFile.io_regIn_6_bits = {1{$random}};
    assign RegFile.io_regIn_5_bits = {1{$random}};
    assign RegFile.io_regIn_4_bits = {1{$random}};
    assign RegFile.io_regIn_2_bits = {1{$random}};
// synthesis translate_on
`endif
  Queue_0 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( BitSerialMatMulAccel_io_memPort_0_memRdReq_valid ),
       .io_enq_bits_channelID( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_channelID ),
       .io_enq_bits_isWrite( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_isWrite ),
       .io_enq_bits_addr( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_addr ),
       .io_enq_bits_numBytes( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_numBytes ),
       .io_enq_bits_metaData( BitSerialMatMulAccel_io_memPort_0_memRdReq_bits_metaData ),
       .io_deq_ready( Queue_1_io_enq_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits_channelID( Queue_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_1(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_1_io_enq_ready ),
       .io_enq_valid( Queue_io_deq_valid ),
       .io_enq_bits_channelID( Queue_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_io_deq_bits_metaData ),
       .io_deq_ready( Queue_2_io_enq_ready ),
       .io_deq_valid( Queue_1_io_deq_valid ),
       .io_deq_bits_channelID( Queue_1_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_1_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_1_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_1_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_1_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_2(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_2_io_enq_ready ),
       .io_enq_valid( Queue_1_io_deq_valid ),
       .io_enq_bits_channelID( Queue_1_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_1_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_1_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_1_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_1_io_deq_bits_metaData ),
       .io_deq_ready( Queue_3_io_enq_ready ),
       .io_deq_valid( Queue_2_io_deq_valid ),
       .io_deq_bits_channelID( Queue_2_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_2_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_2_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_2_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_2_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_3(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_3_io_enq_ready ),
       .io_enq_valid( Queue_2_io_deq_valid ),
       .io_enq_bits_channelID( Queue_2_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_2_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_2_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_2_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_2_io_deq_bits_metaData ),
       .io_deq_ready( Queue_4_io_enq_ready ),
       .io_deq_valid( Queue_3_io_deq_valid ),
       .io_deq_bits_channelID( Queue_3_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_3_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_3_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_3_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_3_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_4(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_4_io_enq_ready ),
       .io_enq_valid( Queue_3_io_deq_valid ),
       .io_enq_bits_channelID( Queue_3_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_3_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_3_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_3_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_3_io_deq_bits_metaData ),
       .io_deq_ready( Queue_5_io_enq_ready ),
       .io_deq_valid( Queue_4_io_deq_valid ),
       .io_deq_bits_channelID( Queue_4_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_4_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_4_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_4_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_4_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_5(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_5_io_enq_ready ),
       .io_enq_valid( Queue_4_io_deq_valid ),
       .io_enq_bits_channelID( Queue_4_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_4_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_4_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_4_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_4_io_deq_bits_metaData ),
       .io_deq_ready( Queue_6_io_enq_ready ),
       .io_deq_valid( Queue_5_io_deq_valid ),
       .io_deq_bits_channelID( Queue_5_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_5_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_5_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_5_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_5_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_6(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_6_io_enq_ready ),
       .io_enq_valid( Queue_5_io_deq_valid ),
       .io_enq_bits_channelID( Queue_5_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_5_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_5_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_5_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_5_io_deq_bits_metaData ),
       .io_deq_ready( Queue_7_io_enq_ready ),
       .io_deq_valid( Queue_6_io_deq_valid ),
       .io_deq_bits_channelID( Queue_6_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_6_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_6_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_6_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_6_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_7(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_7_io_enq_ready ),
       .io_enq_valid( Queue_6_io_deq_valid ),
       .io_enq_bits_channelID( Queue_6_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_6_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_6_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_6_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_6_io_deq_bits_metaData ),
       .io_deq_ready( Queue_8_io_enq_ready ),
       .io_deq_valid( Queue_7_io_deq_valid ),
       .io_deq_bits_channelID( Queue_7_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_7_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_7_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_7_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_7_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_8(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_8_io_enq_ready ),
       .io_enq_valid( Queue_7_io_deq_valid ),
       .io_enq_bits_channelID( Queue_7_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_7_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_7_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_7_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_7_io_deq_bits_metaData ),
       .io_deq_ready( Queue_9_io_enq_ready ),
       .io_deq_valid( Queue_8_io_deq_valid ),
       .io_deq_bits_channelID( Queue_8_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_8_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_8_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_8_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_8_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_9(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_9_io_enq_ready ),
       .io_enq_valid( Queue_8_io_deq_valid ),
       .io_enq_bits_channelID( Queue_8_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_8_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_8_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_8_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_8_io_deq_bits_metaData ),
       .io_deq_ready( Queue_10_io_enq_ready ),
       .io_deq_valid( Queue_9_io_deq_valid ),
       .io_deq_bits_channelID( Queue_9_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_9_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_9_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_9_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_9_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_10(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_10_io_enq_ready ),
       .io_enq_valid( Queue_9_io_deq_valid ),
       .io_enq_bits_channelID( Queue_9_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_9_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_9_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_9_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_9_io_deq_bits_metaData ),
       .io_deq_ready( Queue_11_io_enq_ready ),
       .io_deq_valid( Queue_10_io_deq_valid ),
       .io_deq_bits_channelID( Queue_10_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_10_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_10_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_10_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_10_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_11(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_11_io_enq_ready ),
       .io_enq_valid( Queue_10_io_deq_valid ),
       .io_enq_bits_channelID( Queue_10_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_10_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_10_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_10_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_10_io_deq_bits_metaData ),
       .io_deq_ready( Queue_12_io_enq_ready ),
       .io_deq_valid( Queue_11_io_deq_valid ),
       .io_deq_bits_channelID( Queue_11_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_11_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_11_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_11_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_11_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_12(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_12_io_enq_ready ),
       .io_enq_valid( Queue_11_io_deq_valid ),
       .io_enq_bits_channelID( Queue_11_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_11_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_11_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_11_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_11_io_deq_bits_metaData ),
       .io_deq_ready( Queue_13_io_enq_ready ),
       .io_deq_valid( Queue_12_io_deq_valid ),
       .io_deq_bits_channelID( Queue_12_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_12_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_12_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_12_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_12_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_13(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_13_io_enq_ready ),
       .io_enq_valid( Queue_12_io_deq_valid ),
       .io_enq_bits_channelID( Queue_12_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_12_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_12_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_12_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_12_io_deq_bits_metaData ),
       .io_deq_ready( Queue_14_io_enq_ready ),
       .io_deq_valid( Queue_13_io_deq_valid ),
       .io_deq_bits_channelID( Queue_13_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_13_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_13_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_13_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_13_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_14(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_14_io_enq_ready ),
       .io_enq_valid( Queue_13_io_deq_valid ),
       .io_enq_bits_channelID( Queue_13_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_13_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_13_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_13_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_13_io_deq_bits_metaData ),
       .io_deq_ready( T22 ),
       .io_deq_valid( Queue_14_io_deq_valid ),
       .io_deq_bits_channelID( Queue_14_io_deq_bits_channelID ),
       //.io_deq_bits_isWrite(  )
       .io_deq_bits_addr( Queue_14_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_14_io_deq_bits_numBytes )
       //.io_deq_bits_metaData(  )
       //.io_count(  )
  );
  Queue_1 Queue_15(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_15_io_enq_ready ),
       .io_enq_valid( BitSerialMatMulAccel_io_memPort_0_memWrDat_valid ),
       .io_enq_bits( BitSerialMatMulAccel_io_memPort_0_memWrDat_bits ),
       .io_deq_ready( T12 ),
       .io_deq_valid( Queue_15_io_deq_valid ),
       .io_deq_bits( Queue_15_io_deq_bits )
       //.io_count(  )
  );
  Queue_2 Queue_16(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_16_io_enq_ready ),
       .io_enq_valid( T20 ),
       .io_enq_bits_channelID( R17 ),
       .io_enq_bits_readData( 64'h0 ),
       .io_enq_bits_isWrite( 1'h0 ),
       .io_enq_bits_isLast( 1'h0 ),
       .io_enq_bits_metaData( 1'h0 ),
       .io_deq_ready( BitSerialMatMulAccel_io_memPort_0_memWrRsp_ready ),
       .io_deq_valid( Queue_16_io_deq_valid ),
       .io_deq_bits_channelID( Queue_16_io_deq_bits_channelID ),
       .io_deq_bits_readData( Queue_16_io_deq_bits_readData ),
       .io_deq_bits_isWrite( Queue_16_io_deq_bits_isWrite ),
       .io_deq_bits_isLast( Queue_16_io_deq_bits_isLast ),
       .io_deq_bits_metaData( Queue_16_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_17(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_17_io_enq_ready ),
       .io_enq_valid( BitSerialMatMulAccel_io_memPort_0_memWrReq_valid ),
       .io_enq_bits_channelID( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_channelID ),
       .io_enq_bits_isWrite( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_isWrite ),
       .io_enq_bits_addr( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_addr ),
       .io_enq_bits_numBytes( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_numBytes ),
       .io_enq_bits_metaData( BitSerialMatMulAccel_io_memPort_0_memWrReq_bits_metaData ),
       .io_deq_ready( Queue_18_io_enq_ready ),
       .io_deq_valid( Queue_17_io_deq_valid ),
       .io_deq_bits_channelID( Queue_17_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_17_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_17_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_17_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_17_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_18(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_18_io_enq_ready ),
       .io_enq_valid( Queue_17_io_deq_valid ),
       .io_enq_bits_channelID( Queue_17_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_17_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_17_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_17_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_17_io_deq_bits_metaData ),
       .io_deq_ready( Queue_19_io_enq_ready ),
       .io_deq_valid( Queue_18_io_deq_valid ),
       .io_deq_bits_channelID( Queue_18_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_18_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_18_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_18_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_18_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_19(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_19_io_enq_ready ),
       .io_enq_valid( Queue_18_io_deq_valid ),
       .io_enq_bits_channelID( Queue_18_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_18_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_18_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_18_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_18_io_deq_bits_metaData ),
       .io_deq_ready( Queue_20_io_enq_ready ),
       .io_deq_valid( Queue_19_io_deq_valid ),
       .io_deq_bits_channelID( Queue_19_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_19_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_19_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_19_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_19_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_20(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_20_io_enq_ready ),
       .io_enq_valid( Queue_19_io_deq_valid ),
       .io_enq_bits_channelID( Queue_19_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_19_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_19_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_19_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_19_io_deq_bits_metaData ),
       .io_deq_ready( Queue_21_io_enq_ready ),
       .io_deq_valid( Queue_20_io_deq_valid ),
       .io_deq_bits_channelID( Queue_20_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_20_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_20_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_20_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_20_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_21(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_21_io_enq_ready ),
       .io_enq_valid( Queue_20_io_deq_valid ),
       .io_enq_bits_channelID( Queue_20_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_20_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_20_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_20_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_20_io_deq_bits_metaData ),
       .io_deq_ready( Queue_22_io_enq_ready ),
       .io_deq_valid( Queue_21_io_deq_valid ),
       .io_deq_bits_channelID( Queue_21_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_21_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_21_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_21_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_21_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_22(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_22_io_enq_ready ),
       .io_enq_valid( Queue_21_io_deq_valid ),
       .io_enq_bits_channelID( Queue_21_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_21_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_21_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_21_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_21_io_deq_bits_metaData ),
       .io_deq_ready( Queue_23_io_enq_ready ),
       .io_deq_valid( Queue_22_io_deq_valid ),
       .io_deq_bits_channelID( Queue_22_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_22_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_22_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_22_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_22_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_23(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_23_io_enq_ready ),
       .io_enq_valid( Queue_22_io_deq_valid ),
       .io_enq_bits_channelID( Queue_22_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_22_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_22_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_22_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_22_io_deq_bits_metaData ),
       .io_deq_ready( Queue_24_io_enq_ready ),
       .io_deq_valid( Queue_23_io_deq_valid ),
       .io_deq_bits_channelID( Queue_23_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_23_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_23_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_23_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_23_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_24(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_24_io_enq_ready ),
       .io_enq_valid( Queue_23_io_deq_valid ),
       .io_enq_bits_channelID( Queue_23_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_23_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_23_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_23_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_23_io_deq_bits_metaData ),
       .io_deq_ready( Queue_25_io_enq_ready ),
       .io_deq_valid( Queue_24_io_deq_valid ),
       .io_deq_bits_channelID( Queue_24_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_24_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_24_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_24_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_24_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_25(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_25_io_enq_ready ),
       .io_enq_valid( Queue_24_io_deq_valid ),
       .io_enq_bits_channelID( Queue_24_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_24_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_24_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_24_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_24_io_deq_bits_metaData ),
       .io_deq_ready( Queue_26_io_enq_ready ),
       .io_deq_valid( Queue_25_io_deq_valid ),
       .io_deq_bits_channelID( Queue_25_io_deq_bits_channelID ),
       .io_deq_bits_isWrite( Queue_25_io_deq_bits_isWrite ),
       .io_deq_bits_addr( Queue_25_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_25_io_deq_bits_numBytes ),
       .io_deq_bits_metaData( Queue_25_io_deq_bits_metaData )
       //.io_count(  )
  );
  Queue_0 Queue_26(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_26_io_enq_ready ),
       .io_enq_valid( Queue_25_io_deq_valid ),
       .io_enq_bits_channelID( Queue_25_io_deq_bits_channelID ),
       .io_enq_bits_isWrite( Queue_25_io_deq_bits_isWrite ),
       .io_enq_bits_addr( Queue_25_io_deq_bits_addr ),
       .io_enq_bits_numBytes( Queue_25_io_deq_bits_numBytes ),
       .io_enq_bits_metaData( Queue_25_io_deq_bits_metaData ),
       .io_deq_ready( T0 ),
       .io_deq_valid( Queue_26_io_deq_valid ),
       .io_deq_bits_channelID( Queue_26_io_deq_bits_channelID ),
       //.io_deq_bits_isWrite(  )
       .io_deq_bits_addr( Queue_26_io_deq_bits_addr ),
       .io_deq_bits_numBytes( Queue_26_io_deq_bits_numBytes )
       //.io_deq_bits_metaData(  )
       //.io_count(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      regWrapperReset <= 1'h0;
    end else if(T99) begin
      regWrapperReset <= T98;
    end
    if(reset) begin
      R1 <= 1'h0;
    end else if(T5) begin
      R1 <= 1'h0;
    end else if(T4) begin
      R1 <= 1'h1;
    end
    if(reset) begin
      R7 <= T8;
    end else if(T12) begin
      R7 <= T11;
    end else if(T4) begin
      R7 <= Queue_26_io_deq_bits_numBytes;
    end
    if(reset) begin
      R17 <= T18;
    end else if(T4) begin
      R17 <= Queue_26_io_deq_bits_channelID;
    end
    if(reset) begin
      R25 <= 1'h0;
    end else if(T29) begin
      R25 <= 1'h0;
    end else if(T28) begin
      R25 <= 1'h1;
    end
    if(reset) begin
      R33 <= T34;
    end else if(T44) begin
      R33 <= Queue_14_io_deq_bits_numBytes;
    end else if(T41) begin
      R33 <= T40;
    end else if(T39) begin
      R33 <= Queue_14_io_deq_bits_numBytes;
    end else if(T28) begin
      R33 <= Queue_14_io_deq_bits_numBytes;
    end
    if (T12)
      mem[T116] <= Queue_15_io_deq_bits;
    if(reset) begin
      R75 <= T76;
    end else if(T12) begin
      R75 <= T79;
    end else if(T4) begin
      R75 <= Queue_26_io_deq_bits_addr;
    end
    if (io_memWriteEn)
      mem[T118] <= io_memWriteData;
    if(reset) begin
      R82 <= T83;
    end else if(T44) begin
      R82 <= Queue_14_io_deq_bits_addr;
    end else if(T41) begin
      R82 <= T88;
    end else if(T39) begin
      R82 <= Queue_14_io_deq_bits_addr;
    end else if(T28) begin
      R82 <= Queue_14_io_deq_bits_addr;
    end
    if(reset) begin
      R89 <= T90;
    end else if(T44) begin
      R89 <= Queue_14_io_deq_bits_channelID;
    end else if(T39) begin
      R89 <= Queue_14_io_deq_bits_channelID;
    end else if(T28) begin
      R89 <= Queue_14_io_deq_bits_channelID;
    end
  end
endmodule

