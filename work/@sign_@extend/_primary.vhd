library verilog;
use verilog.vl_types.all;
entity Sign_Extend is
    port(
        instr_in        : in     vl_logic_vector(15 downto 0);
        instr_out       : out    vl_logic_vector(31 downto 0)
    );
end Sign_Extend;
