library verilog;
use verilog.vl_types.all;
entity ee357_mem is
    generic(
        INIT_FILE       : string  := "mem_file.txt";
        ADDR_SIZE       : integer := 8;
        DATA_SIZE       : integer := 32
    );
    port(
        addr            : in     vl_logic_vector(7 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        clk             : in     vl_logic;
        rdata           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_SIZE : constant is 1;
end ee357_mem;
