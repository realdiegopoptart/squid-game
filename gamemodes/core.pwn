/*

	SQUID GAME IN SA:MP - realdiegopoptart#2998
		
Dependencies
	a_samp     - SA:MP Development Team (https://sa-mp.com)
	izcmd      - YashasSamaga (https://github.com/YashasSamaga/I-ZCMD/)
	sscanf2    - maddinat0r (https://github.com/maddinat0r/sscanf)
	streamer   - Incognito (https://github.com/samp-incognito/samp-streamer-plugin)
	afk		   - realdiegopoptart (https://github.com/realdiegopoptart/samp-libaries/blob/main/iafk.inc)
	eSelection - TommyB (https://github.com/TommyB123/eSelection)
	PawnPlus   - IllidanS4 (https://github.com/IllidanS4/PawnPlus)

Skins: 
    20001 = Circle
    20002 = Triangle
    20003 = Square
    20004 = Girl

*/

#include <a_samp>
#include <izcmd>
#include <foreach>
#include <sscanf2>
#include <samp_bcrypt>
#include <streamer>
#include <iafk>
#include <eSelection>
#include <PawnPlus>
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
#include "./modular/sql/load.pwn"
#include "./modular/dialog.pwn"
#include "./modular/cmds/player.pwn"
#include "./modular/cmds/admin.pwn"


public OnGameModeInit()
{
	SetGameModeText(""SERVER_NAME" - Ver. "SERVER_VER"");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	#include "./modular/custom.pwn"
	#include "./modular/sql/create.pwn"
	return 1;
}

public OnGameModeExit()
{
    db_close(server_database);
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
	SetPlayerScore(playerid, 0);
	
	PlayerInfo[playerid][pKills] = 0;
	PlayerInfo[playerid][pDeaths] = 0;
	
	PlayerInfo[playerid][pLogged] = false;
	
    new query[128];
	format(query, sizeof(query), "SELECT `NAME` FROM `USERS` WHERE `NAME` = '%s' COLLATE NOCASE", DB_Escape(GetPlayerNameEx(playerid)));
  	database_result = db_query(server_database, query);
  	if(db_num_rows(database_result))
	{
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FFFFFF}Account Login", "{FFFFFF}Please enter your password below to login to your account:", "Enter", "Leave");
	}
	else
	{
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{FFFFFF}Register Account", "{FFFFFF}Please enter a password below to register an account:", "Enter", "Leave");
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	SaveAccount(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}`

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