library verilog;
use verilog.vl_types.all;
entity clk_div_2N is
    generic(
        WIDTH           : integer := 3;
        N               : integer := 4
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 1;
end clk_div_2N;
