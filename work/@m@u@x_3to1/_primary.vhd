library verilog;
use verilog.vl_types.all;
entity MUX_3to1 is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        in3             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        select_2bit     : in     vl_logic_vector(1 downto 0)
    );
end MUX_3to1;
