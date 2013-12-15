library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        funccode        : in     vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end ALU;
