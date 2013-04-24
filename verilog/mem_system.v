/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err, 
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input [15:0] Addr;
   input [15:0] DataIn;
   input        Rd;
   input        Wr;
   input        createdump;
   input        clk;
   input        rst;
   
   output [15:0] DataOut;
   output Done;
   output Stall;
   output CacheHit;
   output err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter mem_type = 0;

   localparam IDLE =         5'b00000;  // idle state signaling done
   localparam WR_CMPCACHE =  5'b00001;   // comparing data in cache on a wr request
   localparam WR_WRDIRTY0 =  5'b00010;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY1 =  5'b00011;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY2 =  5'b00100;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY3 =  5'b00101;    // data in cache was dirty, write it to memory
   localparam WR_WRCACHE0 =  5'b00110;    // write the data from input to the memory
   localparam WR_WRCACHE1 =  5'b00111;    // write the data from input to the memory
   localparam WR_WRCACHE2 =  5'b01000;    // write the data from input to the memory
   localparam WR_WRCACHE3 =  5'b01001;    // write the data from input to the memory
   localparam RD_CMPCACHE =  5'b01010;   // comparing data in cache on a rd request
   localparam RD_WRDIRTY0 =  5'b01011;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY1 =  5'b01100;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY2 =  5'b01101;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY3 =  5'b01110;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_RDMEM0 =    5'b01111;      // read input addr from memory
   localparam RD_RDMEM1 =    5'b10000;      // read input addr from memory
   localparam RD_RDMEM2 =    5'b10001;      // read input addr from memory
   localparam RD_RDMEM3 =    5'b10010;      // read input addr from memory
   localparam RD_WAIT =      5'b10011;       // write data returned from memory to cache
   localparam RD_WAITDONE =  5'b10100;

   // cache wires
   wire cDirty, cValid, cErr;
   wire [4:0] cTag_out;
   wire [15:0] cDataOut;
   reg [15:0] cDataIn;
   reg [2:0] cOffset;
   reg cValidIn, cEnable, cComp, cWrite;

   // four_bank_mem wires
   wire mStall, mErr;
   reg mWr, mRd; 
   wire [15:0] mDataOut;
   reg [15:0] mAddr;
   wire [3:0] mBusy;

   // fsm wires
   reg [4:0] nxState;
   wire [4:0] state;
   wire [2:0] wait1, waitIn;
   reg nxStall, nxStall_IDLE, startWait;
   reg nxDone, nxDone_WR_CMPCACHE;
   wire Doneff, Stallff, cHit, rdDone_RDMEM, holdMemff, nxCacheHit;
   reg DoneCheck, rdDone, StallCheck, rdStall, stallSet, nxholdMem;
   reg [4:0] requestType, nxSt_WR_CMPCACHE, nxSt_RD_CMPCACHE; // determines the next state 
   wire [4:0] nxSt_WR_WRDIRTY0, nxSt_WR_WRDIRTY1, nxSt_WR_WRDIRTY2, nxSt_WR_WRDIRTY3;
   wire [4:0] nxSt_WR_WRCACHE0, nxSt_WR_WRCACHE1, nxSt_WR_WRCACHE2, nxSt_WR_WRCACHE3;
   wire [4:0] nxSt_RD_WRDIRTY0, nxSt_RD_WRDIRTY1, nxSt_RD_WRDIRTY2, nxSt_RD_WRDIRTY3;
   wire [4:0] nxSt_RD_RDMEM;
   reg [15:0] mDataIn;
   wire [15:0] mDataOutHold, cDataOutHold;

   reg4bit streg(.clk(clk), .rst(rst), .en(1'b1), .in(nxState), .out(state));
   dff ff1(.q(Stallff), .d(nxStall), .clk(clk), .rst(rst));
   dff ff2(.q(Doneff), .d(nxDone), .clk(clk), .rst(rst));

   assign Done = (DoneCheck) ? 1'b1 : Doneff;
   assign Stall = (StallCheck) ? stallSet : Stallff;
   
   // You must pass the mem_type parameter 
   // and createdump inputs to the 
   // cache modules

   assign err = mErr | cErr;

   assign nxCacheHit = cValid & cHit;
   dff ff5(.q(CacheHit), .d(nxCacheHit), .clk(clk), .rst(rst));

   cache #(0) cache0(.enable(cEnable), .clk(clk), .rst(rst), .createdump(createdump), 
                    .tag_in(Addr[15:11]), .index(Addr[10:3]), .offset(cOffset), .data_in(cDataIn),
                    .comp(cComp), .write(cWrite), .valid_in(cValidIn), .tag_out(cTag_out), .data_out(cDataOut),
                    .hit(cHit), .dirty(cDirty), .valid(cValid), .err(cErr));

   four_bank_mem fmem(.clk(clk), .rst(rst), .createdump(createdump), .addr(mAddr), .data_in(mDataIn), .wr(mWr), .rd(mRd),
                    .data_out(mDataOut), .stall(mStall), .busy(mBusy), .err(mErr));

   reg16bit reg16_0(.clk(clk), .rst(rst), .en(1'b1), .in(mDataOut), .out(mDataOutHold));
   reg16bit reg16_1(.clk(clk), .rst(rst), .en(1'b1), .in(cDataOut), .out(cDataOutHold));

   // determines the next state from IDLE and sets up the values for the cache
   always @(*) begin
      casex ({Rd, Wr})
         2'b00: begin
            requestType = IDLE;
            nxStall_IDLE = 1'b0;
         end
         2'b01: begin
            requestType = WR_CMPCACHE;
            nxStall_IDLE = 1'b1;
         end
         2'b10: begin
            requestType = RD_CMPCACHE;
            nxStall_IDLE = 1'b1;
         end
         default: begin
            requestType = 5'bxxxxx;
            nxStall_IDLE = 1'bx;
         end
      endcase
   end

   // determines the next state from WR_CMPCACHE
   always @(*) begin
      nxDone_WR_CMPCACHE = 1'b0;
      
      casex ({cValid, cDirty, cHit})
         3'b110: nxSt_WR_CMPCACHE = WR_WRDIRTY0;
         3'b100: nxSt_WR_CMPCACHE = WR_WRCACHE0;
         3'b1x1: begin
            nxSt_WR_CMPCACHE = IDLE;
            nxDone_WR_CMPCACHE = 1'b1;
         end
         3'b0xx: nxSt_WR_CMPCACHE = WR_WRCACHE0;
         default: begin
            nxSt_WR_CMPCACHE = 5'bxxxxx;
            nxDone_WR_CMPCACHE = 1'bx;
         end
      endcase
   end

   // determins the next state from WR_WRDIRTY
   assign nxSt_WR_WRDIRTY0 = (mStall) ? WR_WRDIRTY0 : WR_WRDIRTY1;
   assign nxSt_WR_WRDIRTY1 = (mStall) ? WR_WRDIRTY1 : WR_WRDIRTY2;
   assign nxSt_WR_WRDIRTY2 = (mStall) ? WR_WRDIRTY2 : WR_WRDIRTY3;
   assign nxSt_WR_WRDIRTY3 = (mStall) ? WR_WRDIRTY3 : WR_WRCACHE0;

   // determins the next state from RD_CMPCACHE
   always @(*) begin
      rdDone = 1'b0;
      rdStall = 1'b1;

      casex({cValid, cDirty, cHit})
         3'b110: nxSt_RD_CMPCACHE = RD_WRDIRTY0;
         3'b1x1: begin
            nxSt_RD_CMPCACHE = IDLE;
            rdDone = 1'b1;
            rdStall = 1'b0;
         end
         3'b0xx: nxSt_RD_CMPCACHE = RD_RDMEM;
         3'b100: nxSt_RD_CMPCACHE = RD_RDMEM;
         default: begin
            nxSt_RD_CMPCACHE = 5'bxxxxx;
            rdDone = 1'bx;
            rdStall = 1'bx;
         end
      endcase
   end

   // determins the next state from RD_WRDIRTY
   assign nxSt_RD_WRDIRTY0 = (mStall) ? RD_WRDIRTY0 : RD_WRDIRTY1;
   assign nxSt_RD_WRDIRTY1 = (mStall) ? RD_WRDIRTY1 : RD_WRDIRTY2;
   assign nxSt_RD_WRDIRTY2 = (mStall) ? RD_WRDIRTY2 : RD_WRDIRTY3;
   assign nxSt_RD_WRDIRTY3 = (mStall) ? RD_WRDIRTY3 : RD_RDMEM;

   // determins the next state from RD_RDMEM
   // TODO: do write of whole cache line from mem to cache
   assign nxSt_RD_RDMEM = (mStall | (|wait1)) ? RD_RDMEM : RD_WAIT;
   assign rdDone_RDMEM = (mStall | (|wait1)) ? 1'b0 : 1'b1;

   // determins the next state from WR_WRCACHE
   // TODO: add a 1 wait state for reading like done with writing
   assign nxSt_WR_WRCACHE0 = (mStall | ("some read wait var")) ? WR_WRCACHE0 : WR_WRCACHE1;
   assign nxSt_WR_WRCACHE1 = (mStall | ("some read wait var")) ? WR_WRCACHE1 : WR_WRCACHE2;
   assign nxSt_WR_WRCACHE2 = (mStall | ("some read wait var")) ? WR_WRCACHE2 : WR_WRCACHE3;
   assign nxSt_WR_WRCACHE3 = (mStall | ("some read wait var")) ? WR_WRCACHE3 : IDLE;

   // waiting for a number of cycles
   dff ff3(.q(waitff), .d(waitin), .clk(clk), .rst(rst));

   // write wait fsm (signal asserted for 4 cycles)
   reg3bit reg3_0(.clk(clk), .rst(rst), .en(1'b1), .in(waitIn), .out(wait1));
   assign waitIn = ({startWait, wait1[2:1]});

   dff ff4(.q(holdMemff), .d(nxholdMem), .clk(clk), .rst(rst));
   assign DataOut = (holdMemff) ? cDataOutHold : mDataOutHold;

//TODO: add new states
always @(*) begin
      nxDone = 1'b0;
      nxStall = 1'b0;
      cEnable = 1'b0;
      cComp = 1'b0;
      cWrite = 1'b0;
      mWr = 1'b0;
      mRd = 1'b0;
      cDataIn = DataIn;
      cValidIn = 1'b0;
      DoneCheck = 1'b0;
      StallCheck = 1'b0;
      mAddr = {cTag_out,Addr[10:0]};
      mDataIn = cDataOut;
      startWait = 1'b0;
      stallSet = 1'b0;
      nxholdMem = 1'b0;
      cOffset = Addr[2:0];

      casex (state)
         IDLE: begin
            nxStall = nxStall_IDLE;
            nxState = requestType;
         end
         WR_CMPCACHE: begin
            cEnable = 1'b1;
            cComp = 1'b1;
            cWrite = 1'b1;
            nxDone = nxDone_WR_CMPCACHE;
            nxStall = ~nxDone_WR_CMPCACHE;
            nxState = nxSt_WR_CMPCACHE;
         end
         WR_WRDIRTY0: begin
            cEnable = 1'b1;
            cOffset = 3'b000;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b000};
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY0;
         end
         WR_WRCACHE: begin
            mWr = 1'b1;
            cEnable = (nxSt_WR_WRCACHE == IDLE) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cValidIn = 1'b1;
            nxDone = (nxSt_WR_WRCACHE == IDLE) ? 1'b1 : 1'b0;
            nxStall= (nxSt_WR_WRCACHE == IDLE) ? 1'b0 : 1'b1;
            startWait = (nxSt_WR_WRCACHE == IDLE) ? 1'b1 : 1'b0;
            mAddr = Addr;
            mDataIn = DataIn;
            nxState = nxSt_WR_WRCACHE;
         end
         RD_CMPCACHE: begin
            cEnable = 1'b1;
            cComp = 1'b1;
            nxDone = (nxSt_RD_CMPCACHE == IDLE) ? 1'b1 : 1'b0;
            nxStall = (nxSt_RD_CMPCACHE == IDLE) ? 1'b0 : 1'b1;
            nxState = nxSt_RD_CMPCACHE;
            nxholdMem = 1'b1;
         end
         RD_WRDIRTY: begin
            cEnable = 1'b1;
            mWr = 1'b1;
            startWait = (nxSt_RD_WRDIRTY) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY;
         end
         RD_RDMEM: begin
            mAddr = Addr;
            mRd = 1'b1;
            nxState = nxSt_RD_RDMEM;
            nxStall = 1'b1;
         end
         RD_WAIT: begin
            nxState = RD_WAITDONE;
            nxStall = 1'b1;
            nxDone = 1'b0;
         end
         RD_WAITDONE: begin
            nxState = IDLE;
            cEnable = 1'b1;
            cWrite = 1'b1;
            cValidIn = 1'b1;
            nxDone = 1'b1;
            cDataIn = mDataOut;
         end
         default: begin
            nxState = 4'bxxxx;
         end
      endcase
   end

endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:
