library verilog;
use verilog.vl_types.all;
entity MUX_2to1 is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic
    );
end MUX_2to1;
