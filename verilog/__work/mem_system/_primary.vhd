library verilog;
use verilog.vl_types.all;
entity mem_system is
    generic(
        mem_type        : integer := 0;
        idle            : integer := 0;
        wr_cmpcache     : integer := 1;
        wr_wrdirty      : integer := 2;
        wr_wrcache      : integer := 3;
        rd_cmpcache     : integer := 4;
        rd_hit          : integer := 5;
        rd_wrdirty      : integer := 6;
        rd_rdmem        : integer := 7;
        rd_wait         : integer := 8;
        rd_waitdone     : integer := 9
    );
    port(
        dataout         : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        stall           : out    vl_logic;
        cachehit        : out    vl_logic;
        err             : out    vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        datain          : in     vl_logic_vector(15 downto 0);
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        createdump      : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mem_system;
