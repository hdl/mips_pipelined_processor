library verilog;
use verilog.vl_types.all;
entity IDEX is
    port(
        WB_in           : in     vl_logic_vector(1 downto 0);
        M_in            : in     vl_logic_vector(2 downto 0);
        EX_in           : in     vl_logic_vector(3 downto 0);
        ReadData1_in    : in     vl_logic_vector(31 downto 0);
        ReadData2_in    : in     vl_logic_vector(31 downto 0);
        sign_ext_in     : in     vl_logic_vector(31 downto 0);
        Inst25to21_in   : in     vl_logic_vector(4 downto 0);
        Inst20to16_in   : in     vl_logic_vector(4 downto 0);
        Inst15to11_in   : in     vl_logic_vector(4 downto 0);
        Inst5to0_in     : in     vl_logic_vector(5 downto 0);
        WB_out          : out    vl_logic_vector(1 downto 0);
        M_out           : out    vl_logic_vector(2 downto 0);
        EX_out          : out    vl_logic_vector(3 downto 0);
        ReadData1_out   : out    vl_logic_vector(31 downto 0);
        ReadData2_out   : out    vl_logic_vector(31 downto 0);
        sign_ext_out    : out    vl_logic_vector(31 downto 0);
        Inst25to21_out  : out    vl_logic_vector(4 downto 0);
        Inst20to16_out  : out    vl_logic_vector(4 downto 0);
        Inst15to11_out  : out    vl_logic_vector(4 downto 0);
        Inst5to0_out    : out    vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end IDEX;
