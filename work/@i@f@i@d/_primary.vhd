library verilog;
use verilog.vl_types.all;
entity IFID is
    port(
        IFIDWrite       : in     vl_logic;
        PC_Plus4_in     : in     vl_logic_vector(31 downto 0);
        Inst_in         : in     vl_logic_vector(31 downto 0);
        Inst_out        : out    vl_logic_vector(31 downto 0);
        PC_Plus4_out    : out    vl_logic_vector(31 downto 0);
        flush           : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end IFID;
