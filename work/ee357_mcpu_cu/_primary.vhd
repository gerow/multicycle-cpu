library verilog;
use verilog.vl_types.all;
entity ee357_mcpu_cu is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        pcw             : out    vl_logic;
        pcwc            : out    vl_logic;
        iord            : out    vl_logic;
        mr              : out    vl_logic;
        mw              : out    vl_logic;
        irw             : out    vl_logic;
        regw            : out    vl_logic;
        mtor            : out    vl_logic;
        rdst            : out    vl_logic;
        alusela         : out    vl_logic;
        aluselb         : out    vl_logic_vector(1 downto 0);
        aluop           : out    vl_logic_vector(1 downto 0);
        tw              : out    vl_logic;
        pcs             : out    vl_logic_vector(1 downto 0)
    );
end ee357_mcpu_cu;
