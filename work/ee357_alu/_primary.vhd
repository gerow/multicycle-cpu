library verilog;
use verilog.vl_types.all;
entity ee357_alu is
    port(
        opa             : in     vl_logic_vector(31 downto 0);
        opb             : in     vl_logic_vector(31 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        res             : out    vl_logic_vector(31 downto 0);
        uov             : out    vl_logic;
        sov             : out    vl_logic;
        zero            : out    vl_logic;
        cout            : out    vl_logic
    );
end ee357_alu;
