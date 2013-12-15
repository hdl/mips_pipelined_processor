library verilog;
use verilog.vl_types.all;
entity MUX_2to1_9bit is
    port(
        in1_9bit        : in     vl_logic_vector(8 downto 0);
        in2_9bit        : in     vl_logic_vector(8 downto 0);
        out_9bit        : out    vl_logic_vector(8 downto 0);
        \select\        : in     vl_logic
    );
end MUX_2to1_9bit;
