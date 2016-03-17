int adjust_menu();
{
 int choice;
 send_data(display,"Choose DSP block:\n");
 send_data(display,"1. A\n");
 send_data(display,"2. B\n");
 send_data(display,"3. C\n");

 
while(1)
{
 choice = get_data("adjust");
   
 switch (choice)
 {
    case 1: adjust_var(choice);
          break;
    case 2: adjust_var(choice);
          break;
	case 3: adjust_var(choice);
		  break;
     default:	return -1;
                    break;
 } 
  
}
return 1;
}