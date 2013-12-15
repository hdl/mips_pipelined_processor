library verilog;
use verilog.vl_types.all;
entity Shift_Left is
    port(
        instruction     : in     vl_logic_vector(25 downto 0);
        jump_address    : out    vl_logic_vector(31 downto 0)
    );
end Shift_Left;
