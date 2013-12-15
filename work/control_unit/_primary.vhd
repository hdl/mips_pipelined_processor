library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        Control_out     : out    vl_logic_vector(8 downto 0)
    );
end control_unit;
