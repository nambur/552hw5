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
   
   output reg [15:0] DataOut;
   output reg Done;
   output reg Stall;
   output CacheHit;
   output err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter mem_type = 0;

   localparam IDLE = 4'b0000;  // idle state signaling done
   localparam WR_CMPCACHE = 4'b0001;   // comparing data in cache on a wr request
   localparam WR_WRDIRTY = 4'b0010;    // data in cache was dirty, write it to memory
   localparam WR_WRCACHE = 4'b0011;    // write the data from input to the cache, set as dirty
   localparam RD_CMPCACHE = 4'b0100;   // comparing data in cache on a rd request
   localparam RD_HIT = 4'b0101;        // cache hit on a read, return data from cache
   localparam RD_WRDIRTY = 4'b0110;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_RDMEM = 4'b0111;      // read input addr from memory
   localparam RD_WRCACHE = 4'b1000;// write data returned from memory to cache

   // cache wires
   wire cEnable, cComp, cWrite, cTag_out, cDirty, cValid, cErr;
   wire [15:0] cDataOut;
   reg [15:0] cDataIn;
   reg cValidIn;

   // four_bank_mem wires
   wire mStall, mErr;
   reg mWr, mRd; 
   wire [15:0] mDataOut,mDataIn;
   reg [15:0] mAddr;
   wire [3:0] mBusy;

   // fsm wires
   reg nxState;
   reg state;
   reg nxStall, nxStall_IDLE;
   reg nxDone, nxDone_WR_CMPCACHE;
   wire Doneff, Stallff; 
   reg DoneCheck, rdDone, StallCheck, rdStall;
   reg [3:0] requestType, nxSt_WR_CMPCACHE, nxSt_WR_WRDIRTY, nxSt_RD_CMPCACHE, nxSt_RD_WRDIRTY; // determines the next state 
   wire [15:0] mDataOut;

   dff ff0(.q(state), .d(nxState), .clk(clk), .rst(rst));
   dff ff1(.q(Stallff), .d(nxStall), .clk(clk), .rst(rst));
   dff ff1(.q(Doneff), .d(nxDone), .clk(clk), .rst(rst));

   assign Done = (DoneCheck) ? 1'b1 : Doneff;
   assign Stall = (StallCheck) ? 1'b0 : Stallff;
   
   // You must pass the mem_type parameter 
   // and createdump inputs to the 
   // cache modules

   assign err = mErr | eErr;

   cache #(0) cache0(.enable(cEnable), .clk(clk), .rst(rst), .createdump(createdump), 
                    .tag_in(Addr[15:11]), .index(Addr[10:3]), .offset(Addr[2:0]), .data_in(cDataIn),
                    .comp(cComp), .write(cWrite), .valid_in(cValidIn), .tag_out(cTag_out), .data_out(cDataOut),
                    .hit(CacheHit), .dirty(cDirty), .valid(cValid), .err(cErr));

   four_bank_mem fmem(.clk(clk), .rst(rst), .createdump(createdump), .addr(mAddr), .data_in(cDataOut), .wr(mWr), .rd(mRd),
                    .data_out(mDataOut), .stall(mStall), .busy(mBusy), .err(mErr));

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
            requestType = 4'bxxxx;
            nxStall_IDLE = 1'bx;
         end
      endcase
   end

   // determines the next state from WR_CMPCACHE
   always @(*) begin
      nxDone_WR_CMPCACHE = 1'b0;
      nxStall_WR_CMPCACHE = 1'b1;
      
      casex ({cValid, cDirty, CacheHit})
         3'b110: nxSt_WR_CMPCACHE = WR_WRDIRTY;
         3'b1x1: begin
            nxSt_WR_CMPCACHE = IDLE;
            nxDone_WR_CMPCACHE = 1'b1;
            nxStall_WR_CMPCACHE = 1'b0;
         end
         3'b0xx: nxSt_WR_CMPCACHE = WR_WRCACHE;
         default: begin
            nxSt_WR_CMPCACHE = 4'bxxxx;
            nxDone_WR_CMPCACHE = 1'bx;
         end
      endcase
   end

   // determins the next state from WR_WRDIRTY
   assign nxSt_WR_WRDIRTY = (mStall) ? WR_WRDIRTY : WR_CACHE;

   // determins the next state from RD_CMPCACHE
   always @(*) begin
      rdDone = 1'b0;
      rdStall = 1'b1;

      casex({cValid, cDirty, CacheHit})
         3'b110: nxSt_RD_CMPCACHE = RD_WRDIRTY;
         3'b1x1: begin
            nxSt_RD_CMPCACHE = IDLE;
            rdDone = 1'b1;
            rdStall = 1'b0;
         end
         3'b0xx: nxSt_RD_CMPCACHE = RD_RDMEM;
         3'b100: nxSt_RD_CMPCACHE = RD_RDMEM;
         default: begin
            nxSt_RD_CMPCACHE = 3'bxxx;
            rdDone = 1'bx;
            rdStall = 1'bx;
         end
      endcase
   end

   // determins the next state from RD_WRDIRTY
   assign nxSt_RD_WRDIRTY = (mStall) ? RD_WRDIRTY : RD_RDMEM;

   // determins the next state from RD_WRDIRTY
   assign nxSt_RD_RDMEM = (mStall) ? RD_RDMEM : IDLE;
   assign rdDone_RDMEM = (mStall) ? 1'b0 : 1'b1;

   always @(*) begin
      nxDone = 1'b0;
      nxStall = 1'b0;
      cEnable = 1'b0;
      cComp = 1'b0;
      cWrite = 1'b0;
      mWr = 1'b0;
      mRd = 1'b0;
      DataOut = cDataOut;
      cDataIn = DataIn;
      cValidIn = 1'b0;
      DoneCheck = 1'b0;
      StallCheck = 1'b0;
      mAddr = {cTag_out,Addr[10:0]};

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
            nxStall = nxStall_WR_CMPCACHE;
            nxState = nxSt_WR_CMPCACHE;
         end
         WR_WRDIRTY: begin
            cEnable = 1'b1;
            mWr = 1'b1;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY;
         end
         WR_WRCACHE: begin
            cEnable = 1'b1;
            cWrite = 1'b1;
            cValidIn = 1'b1;
            nxStall = 1'b0;
            nxDone = 1'b1;
            nxState = IDLE;
         end
         RD_CMPCACHE: begin
            cEnable = 1'b1;
            cComp = 1'b1;
            DoneCheck = rdDone;
            StallCheck = rdStall;
         end
         RD_WRDIRTY: begin
            cEnable = 1'b1;
            mWr = 1'b1;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY;
         end
         RD_RDMEM: begin
            mAddr = Addr;
            mRd = 1'b1;
            cEnable = ~mStall;
            cComp = 1'b0;
            cWrite = 1'b1;
            cDataIn = mDataOut;
            cValidIn = 1'b1;
            DataOut = mDataOut;
            nxState = nxSt_RD_RDMEM;
            DoneCheck = rdDone_RDMEM;
            StallCheck = ~rdDone_RDMEM;
         end
         default: begin
            nxState = 4'bxxxx;
         end
      endcase
   end

endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:
