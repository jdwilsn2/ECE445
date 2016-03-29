

int menu()
{
	int choice;
 send_data(display,"Menu:\n");
 send_data(display,"1. Route\n");
 send_data(display,"2. Adjust\n");
while(1)
{

choice = get_data("Main");
   
 switch (choice)
 {
    case 1: route_menu();
          break;
    case 2: adjust_menu();
          break;
     default: return -1;
                    break;
 } 
  
}
return 1;
}