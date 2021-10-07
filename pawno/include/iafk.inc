/*
  Improved afk.inc by realdiegopoptart
  fixes bugs that I discovered with the include
  Orignal Credits to Miihai
*/
 
new bool:PlayerAFK[MAX_PLAYERS]; // Sets player variable [0-NOT-AFK | 1-AFK]
new AFKDetect[MAX_PLAYERS]; // Sets current date/time to player from OnPlayerUpdate(OPU)
new bool: FunctionCall[2][MAX_PLAYERS]; // Helps to not repeat OnPlayerPause or/and OnPlayerUnpause
new playerAName[50]; //Player name
new AFKTime[MAX_PLAYERS];
 
#include <a_samp>
#include <foreach>
 
#if defined _AFKDETECT_INC
        #endinput
#endif
#define _AFKDETECT_INC
 
forward OnPlayerPause(playerid);
forward OnPlayerUnpause(playerid);
forward AFKChecker();
forward IsPlayerPause(playerid);
forward TimeSincePaused(playerid);
 
public OnPlayerUpdate(playerid)
{
        AFKDetect[playerid] = gettime();
    #if defined VFUNC_OnPlayerUpdate
        return VFUNC_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}
#if defined VFUNC_OnPlayerUpdate
    forward VFUNC_OnPlayerUpdate(playerid);
#endif
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate VFUNC_OnPlayerUpdate
 
public OnPlayerDisconnect(playerid, reason)
{
        if(PlayerAFK[playerid] == true && FunctionCall[1][playerid] == false)
        {
                GetPlayerName(playerid, playerAName,sizeof(playerAName)),
                PlayerAFK[playerid] = false;
                printf("[resume] %s is no longer AFK because he's left the game. (%d seconds)",playerAName,gettime()-AFKTime[playerid]);
                FunctionCall[1][playerid] = true;
                FunctionCall[0][playerid] = false;
                AFKTime[playerid] = 0;
                CallLocalFunction("OnPlayerUnpause", "i", playerid);
        }
    #if defined VFUNC_OnPlayerDisconnect
        return VFUNC_OnPlayerDisconnect(playerid, reason);
    #else
        return 1;
    #endif
}
#if defined VFUNC_OnPlayerDisconnect
    forward VFUNC_OnPlayerDisconnect(playerid, reason);
#endif
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect VFUNC_OnPlayerDisconnect
 
public OnGameModeInit()
{
        SetTimer("AFKChecker",1000,true);
    #if defined VFUNC_OnGameModeInit
        return VFUNC_OnGameModeInit();
    #else
        return 1;
    #endif
}
#if defined VFUNC_OnGameModeInit
    forward VFUNC_OnGameModeInit();
#endif
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit VFUNC_OnGameModeInit
public AFKChecker()
{
    foreach(Player, i)
    {
        if(gettime()-AFKDetect[i] > 5)
        {
            if(PlayerAFK[i] == false && FunctionCall[0][i] == false)
                GetPlayerName(i, playerAName,sizeof(playerAName)),
                PlayerAFK[i] = true,
                CallLocalFunction("OnPlayerPause", "i", i),
                //printf("[pause] %s is now AFK.",playerAName),
                FunctionCall[0][i] = true,
                FunctionCall[1][i] = false,
                AFKTime[i] = gettime();
        }
        else
        {
        if(PlayerAFK[i] == true && FunctionCall[1][i] == false)
            GetPlayerName(i, playerAName,sizeof(playerAName)),
            PlayerAFK[i] = false,
            CallLocalFunction("OnPlayerUnpause", "i", i),
            //printf("[resume] %s is no longer AFK. (%d seconds)",playerAName,gettime()-AFKTime[i]),
            FunctionCall[1][i] = true,
            FunctionCall[0][i] = false,
            AFKTime[i] = gettime()-AFKTime[i];
        }
    }
    return 1;
}

public IsPlayerPause(playerid)
        if(PlayerAFK[playerid] == true) return 1;
                else return 0;
 
public TimeSincePaused(playerid) {
        if(PlayerAFK[playerid] == true) return gettime()-AFKTime[playerid];
        else return AFKTime[playerid];
}
