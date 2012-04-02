library verilog;
use verilog.vl_types.all;
entity ee357_mcpu is
    port(
        mem_addr        : out    vl_logic_vector(31 downto 0);
        mem_wdata       : out    vl_logic_vector(31 downto 0);
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        mem_rdata       : in     vl_logic_vector(31 downto 0);
        reg_ra          : out    vl_logic_vector(4 downto 0);
        reg_rb          : out    vl_logic_vector(4 downto 0);
        reg_wa          : out    vl_logic_vector(4 downto 0);
        reg_radata      : out    vl_logic_vector(31 downto 0);
        reg_rbdata      : out    vl_logic_vector(31 downto 0);
        reg_wdata       : out    vl_logic_vector(31 downto 0);
        regwrite        : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end ee357_mcpu;
