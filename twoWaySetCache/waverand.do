onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/mem_type
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/Rd
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/Wr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/createdump
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/Done
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/Stall
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/CacheHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/err
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/clk
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/rst
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/DataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/DataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/Addr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mem_type
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/IDLE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRDIRTY0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRDIRTY1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRDIRTY2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRDIRTY3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRMEM
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RDMEMWAIT
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE3WR
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WRDIRTY0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WRDIRTY1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WRDIRTY2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WRDIRTY3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM3WR
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEMDONE
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Rd
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Wr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/createdump
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/clk
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/rst
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Done
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Stall
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/state
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/CacheHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/err
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cValid
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cDirty
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cErr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cDataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cOffset
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cValidIn
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cEnable
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cComp
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cWrite
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/mStall
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/mErr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/mWr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/mRd
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mAddr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxState
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxStall
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxStall_IDLE
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/startWait
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxDone
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxDone_WR_CMPCACHE
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Doneff
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Stallff
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/holdMemff
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxCacheHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxholdMem
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/requestType
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/waitStNxt
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cDataOutHold
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataOutHold
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRMEM
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/waitStOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_RDMEM3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_RDMEM2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_RDMEM1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_RDMEM0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_WRDIRTY3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_WRDIRTY2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_WRDIRTY1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_WRDIRTY0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRCACHE3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRCACHE2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRCACHE1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRCACHE0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRDIRTY3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRDIRTY2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRDIRTY1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRDIRTY0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/waitIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/wait1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mBusy
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cDataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cTag_out
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/DataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/DataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/Addr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/CacheHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Done
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Stall
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/Addr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DataIn
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Rd
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Wr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/createdump
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/clk
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/rst
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Done_ref
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/Stall_ref
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/CacheHit_ref
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/reg_readorwrite
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/n_requests
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/n_replies
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/n_cache_hits
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/n_cache_hits_total
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/req_cycle
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/test_success
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DataOut_ref
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DataOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1467950 ns} 0}
WaveRestoreZoom {1467260 ns} {1468320 ns}
configure wave -namecolwidth 373
configure wave -valuecolwidth 74
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
