library verilog;
use verilog.vl_types.all;
entity MEMWB is
    port(
        WB3_in          : in     vl_logic_vector(1 downto 0);
        ReadData_in     : in     vl_logic_vector(31 downto 0);
        ALU2_in         : in     vl_logic_vector(31 downto 0);
        Instmux2_in     : in     vl_logic_vector(4 downto 0);
        WB3_out         : out    vl_logic_vector(1 downto 0);
        ReadData_out    : out    vl_logic_vector(31 downto 0);
        ALU2_out        : out    vl_logic_vector(31 downto 0);
        Instmux2_out    : out    vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end MEMWB;
