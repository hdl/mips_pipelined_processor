library verilog;
use verilog.vl_types.all;
entity PC_reg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        PCWrite         : in     vl_logic;
        PC_out          : out    vl_logic_vector(31 downto 0)
    );
end PC_reg;
