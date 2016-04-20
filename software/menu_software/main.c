#include "altera_up_avalon_character_lcd.h"

#define keys (volatile char*) 0x0002020;
#define control_words (char*) 0x0002030;
#define lcd_interface (char*) 0x0002048;
#define to_fsm_ack (char*) 0x0002000;
#define to_cpu_ack (volatile char*) 0x0002010;
void main()
{
	while(1)
	{

	}
}
