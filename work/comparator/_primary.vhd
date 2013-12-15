library verilog;
use verilog.vl_types.all;
entity comparator is
    port(
        ReadData1_compare: in     vl_logic_vector(31 downto 0);
        ReadData2_compare: in     vl_logic_vector(31 downto 0);
        compare_select  : out    vl_logic
    );
end comparator;
