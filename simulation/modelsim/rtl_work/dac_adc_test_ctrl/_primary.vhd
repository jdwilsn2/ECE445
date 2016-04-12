library verilog;
use verilog.vl_types.all;
entity dac_adc_test_ctrl is
    port(
        CLOCK_50        : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        begin_transmit  : out    vl_logic;
        begin_receive   : out    vl_logic
    );
end dac_adc_test_ctrl;
