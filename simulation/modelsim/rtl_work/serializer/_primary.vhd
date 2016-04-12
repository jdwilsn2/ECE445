library verilog;
use verilog.vl_types.all;
entity serializer is
    port(
        SCK             : in     vl_logic;
        left            : in     vl_logic_vector(23 downto 0);
        right           : in     vl_logic_vector(23 downto 0);
        begin_transmit  : in     vl_logic;
        LRCK            : in     vl_logic;
        BCK             : in     vl_logic;
        \out\           : out    vl_logic
    );
end serializer;
