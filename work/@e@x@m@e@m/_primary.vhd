library verilog;
use verilog.vl_types.all;
entity EXMEM is
    port(
        WB2_in          : in     vl_logic_vector(1 downto 0);
        M2_in           : in     vl_logic_vector(2 downto 0);
        ALU_in          : in     vl_logic_vector(31 downto 0);
        Instmux_in      : in     vl_logic_vector(4 downto 0);
        ReadData2_in    : in     vl_logic_vector(31 downto 0);
        M2_out          : out    vl_logic_vector(2 downto 0);
        WB2_out         : out    vl_logic_vector(1 downto 0);
        ALU_out         : out    vl_logic_vector(31 downto 0);
        Instmux_out     : out    vl_logic_vector(4 downto 0);
        ReadData2_out   : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end EXMEM;
