library verilog;
use verilog.vl_types.all;
entity register_file_32_bit is
    port(
        ReadAdd1        : in     vl_logic_vector(4 downto 0);
        ReadAdd2        : in     vl_logic_vector(4 downto 0);
        ReadData1       : out    vl_logic_vector(31 downto 0);
        ReadData2       : out    vl_logic_vector(31 downto 0);
        WriteAdd        : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        RegWrite        : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end register_file_32_bit;
