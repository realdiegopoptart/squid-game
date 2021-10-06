/*

Skins: 
    20001 = Circle
    20002 = Triangle
    20003 = Square
    20004 = Girl

*/

#include <a_samp>
#include <izcmd>
#include <sscanf2>
#include <samp_bcrypt>
#include <streamer>
#include <afk>
#include "./modular/define.pwn"
#include "./modular/variable.pwn"
#include "./modular/stock.pwn"


main()
{
	print("\n----------------------------------");
	print(" SA-MP Squid Game - realdiegopoptart");
	print("----------------------------------\n");
}

#include "./modular/function.pwn"
#include "./modular/native.pwn"
#include "./modular/dialog.pwn"
#include "./modular/cmds/player.pwn"
#include "./modular/cmds/admin.pwn"


public OnGameModeInit()
{
    AddCharModel(280, 20001, "staff/circle.dff", "staff/circle.txd");
    AddCharModel(280, 20002, "staff/triangle.dff", "staff/triangle.txd");
    AddCharModel(280, 20003, "staff/square.dff", "staff/square.txd");
    AddCharModel(280, 20004, "player/girl.dff", "player/girl.txd");
	SetGameModeText("Squid Game - Ver. 0.0.1");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}