

int route_menu()
{
 int choice;
 send_data(display,"Menu:\n");
 send_data(display,"1. A->B->C\n");
 send_data(display,"2. A->C->B\n");
 send_data(display,"3. B->A->C\n");
 send_data(display,"4. B->C->A\n");
 send_data(display,"5. C->A->B\n");
 send_data(display,"6. C->B->A");

 
while(1)
{
 choice = get_data("Route");
   
 switch (choice)
 {
    case 1: send_data("Route","abc");
          break;
    case 2: send_data("Route","acb");
          break;
	case 3: send_data("Route","bac");
		  break;
	case 4: send_data("Route","bca");
		  break;
	case 5: send_data("Route","cab");
		  break;
	case 6: send_data("Route","cba");
		  break
     default:	return -1;
                    break;
 } 
  
}
return 1;
}