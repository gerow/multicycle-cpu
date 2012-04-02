library verilog;
use verilog.vl_types.all;
entity ee357_regfile_2r1w is
    generic(
        INIT_FILE       : string  := "reg_file.txt";
        ADDR_SIZE       : integer := 5;
        DATA_SIZE       : integer := 32
    );
    port(
        ra              : in     vl_logic_vector(4 downto 0);
        rb              : in     vl_logic_vector(4 downto 0);
        wa              : in     vl_logic_vector(4 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        wen             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        radata          : out    vl_logic_vector(31 downto 0);
        rbdata          : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
    attribute mti_svvh_generic_type of DATA_SIZE : constant is 1;
end ee357_regfile_2r1w;
