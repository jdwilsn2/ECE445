library verilog;
use verilog.vl_types.all;
entity deserializer is
    port(
        SCK             : in     vl_logic;
        \in\            : in     vl_logic;
        begin_receive   : in     vl_logic;
        LRCK            : in     vl_logic;
        BCK             : in     vl_logic;
        left            : out    vl_logic_vector(23 downto 0);
        right           : out    vl_logic_vector(23 downto 0)
    );
end deserializer;
