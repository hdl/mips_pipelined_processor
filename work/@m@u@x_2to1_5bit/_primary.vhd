library verilog;
use verilog.vl_types.all;
entity MUX_2to1_5bit is
    port(
        in1_5bit        : in     vl_logic_vector(4 downto 0);
        in2_5bit        : in     vl_logic_vector(4 downto 0);
        out_5bit        : out    vl_logic_vector(4 downto 0);
        \select\        : in     vl_logic
    );
end MUX_2to1_5bit;
