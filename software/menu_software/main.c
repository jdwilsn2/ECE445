#include "altera_up_avalon_character_lcd.h"

#define keys (volatile char*) 0x0002020;
#define control_words (char*) 0x0002030;
#define lcd_interface (char*) 0x0002048;
#define to_fsm_ack (char*) 0x0002000;
#define to_cpu_ack (volatile char*) 0x0002010;
#define I_HATE_MY_LIFE 1;

int main()
{
	int index;
	//make array here
	while(I_HATE_MY_LIFE)
	{
		switch(index)
		{
			case 0 : 
				if(*keys + 0x1) //key1
					{
						
					}
			case 1 :
			case 2 : 
			case 3 : 
			case 4 : 
			case 5 : 
			case 6 : 
			case 7 : 
			case 8 : 
			case 9 : 
			case 10 : 
			case 11 : 
			case 12 : 
			case 13 : 
			case 14 : 
		}
	}
	return 1;
}
