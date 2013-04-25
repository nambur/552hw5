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
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/DataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/Addr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mem_type
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/IDLE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRDIRTY
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/WR_WRCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_HIT
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WRDIRTY
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_RDMEM
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WAIT
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/RD_WAITDONE
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Rd
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/Wr
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/createdump
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/clk
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/rst
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/DataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cDataOut
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
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/rdDone_RDMEM
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/holdMemff
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxCacheHit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/DoneCheck
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/rdDone
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/StallCheck
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/rdStall
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/stallSet
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/nxholdMem
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/requestType
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataIn
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/waitff
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/waitin
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cDataOutHold
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mDataOutHold
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_RDMEM
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRCACHE
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_RD_WRDIRTY
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/nxSt_WR_WRDIRTY
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/waitIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/wait1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/mBusy
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cTag_out
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/DataOut
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/DataIn
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/Addr
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/cache_id
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/enable
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/clk
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/rst
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/createdump
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/comp
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/write
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/valid_in
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/hit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/dirty
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/valid
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/err
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/go
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/match
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_word0
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_word1
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_word2
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_word3
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_dirty
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_tag
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/wr_valid
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/dirty_in
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/dirtybit
add wave -noupdate -format Logic -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/validbit
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/w3
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/w2
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/w1
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/w0
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram5_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram4_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram3_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram2_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram1_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/ram0_id
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/data_out
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/tag_out
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/data_in
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/offset
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/index
add wave -noupdate -format Literal -radix hexadecimal /mem_system_randbench/DUT/m0/cache0/tag_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {136373 ns} 0}
WaveRestoreZoom {134335 ns} {136511 ns}
configure wave -namecolwidth 393
configure wave -valuecolwidth 64
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
