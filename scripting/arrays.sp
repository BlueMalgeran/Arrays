#include <sourcemod>

new Items[32][2]; //multidemensional array

public Plugin:myinfo = {
  name = "Arrays",
  author = "Blue Malgeran",
  description = "Blue Malgeran's test plugin for the second time",
  version = "1.0",
  url = "BlueMalgeran.tk"
};

public OnPluginStart()
{
  RegConsoleCmd("sm_setnum", CommandSetNum, "");
  RegConsoleCmd("sm_setnum", CommandSetNum, "");
}

public Action:CommandSetNum(client, args)
{
  if(args < 1)
  {
    PrintToChat(client, "[SM] Please enter a number");
    return Plugin_Handled;
  }

  new String:arg1[3], arg1int;

  GetCmdArg(1, arg1, sizeof(arg1));

  arg1int = StringToInt(arg1);

  Items[client][0] = arg1int;
  Items[client][1] = 2 * arg1int;

  PrintToChat(client, "[SM] Number %d has been stored and that number multiplied by 2 equals %d.", Items[client][0], Items[client][1]);

  return Plugin_Handled;
}

public Action:CommandGetNum(client, args)
{
     PrintToChat(client, "[SM] Number stored is: %d, and that number multiplied by 2 equals %d", Items[client][0], Items[client][1]);
     return Plugin_Handled;
}
