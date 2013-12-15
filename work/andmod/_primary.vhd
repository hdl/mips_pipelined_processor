library verilog;
use verilog.vl_types.all;
entity andmod is
    port(
        and_in1         : in     vl_logic;
        and_in2         : in     vl_logic;
        and_select      : out    vl_logic
    );
end andmod;
