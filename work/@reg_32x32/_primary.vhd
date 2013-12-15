library verilog;
use verilog.vl_types.all;
entity Reg_32x32 is
    port(
        en              : in     vl_logic;
        reset           : in     vl_logic;
        rd_add1         : in     vl_logic_vector(4 downto 0);
        rd_add2         : in     vl_logic_vector(4 downto 0);
        wr_add          : in     vl_logic_vector(4 downto 0);
        write           : in     vl_logic_vector(31 downto 0);
        mread1          : out    vl_logic_vector(31 downto 0);
        mread2          : out    vl_logic_vector(31 downto 0)
    );
end Reg_32x32;
