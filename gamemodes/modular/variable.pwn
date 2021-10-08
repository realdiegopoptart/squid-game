new DB:server_database;
new DBResult:database_result;


enum player_data
{
    pName,
	pKills,
	pDeaths,
    pScore,
    pGamesWon,
    pMoney,
    pAdmin,
    pSkin,
    pCustomSkin,
	bool:pLogged
};
new PlayerInfo[MAX_PLAYERS][player_data];

enum
{
    DIALOG_NONE = 1,
    DIALOG_REGISTER,
    DIALOG_LOGIN
};