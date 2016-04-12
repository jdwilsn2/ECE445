library verilog;
use verilog.vl_types.all;
entity dac_adc_test is
    port(
        CLOCK_50        : in     vl_logic;
        deserializedL   : out    vl_logic_vector(23 downto 0);
        deserializedR   : out    vl_logic_vector(23 downto 0);
        reset           : in     vl_logic;
        begin_transmit  : in     vl_logic;
        begin_receive   : in     vl_logic;
        ADC_data        : in     vl_logic;
        DAC_data        : out    vl_logic;
        SCK             : in     vl_logic;
        LRCK            : out    vl_logic;
        BCK             : out    vl_logic;
        check           : out    vl_logic
    );
end dac_adc_test;
