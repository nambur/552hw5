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

   // cache wires
   wire cEnable, eComp, eWrite, eValid_in, eTag_out, eDirty, eValid, eErr;
   
   // You must pass the mem_type parameter 
   // and createdump inputs to the 
   // cache modules

   cache #(0) cache0(.enable(cEnable), .clk(clk), .rst(rst), .createdump(createdump), 
                    .tag_in(Addr[15:11]), .index(Addr[10:3]), .offset(Addr[2:0]), .data_in(DataIn),
                    .comp(eComp), .write(eWrite), .valid_in(eValid_in), .tag_out(eTag_out), .data_out(DataOut),
                    .hit(CacheHit), .dirty(eDirty), .valid(eValid), .err(eErr));



endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:
