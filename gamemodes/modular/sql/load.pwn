stock DB_Escape(text[])//Credits: Y_Less
{
    new ret[80 * 2], ch, i, j;
    while ((ch = text[i++]) && j < sizeof (ret))
    {
        if (ch == '\'')
        {
            if (j < sizeof (ret) - 2)
            {
                ret[j++] = '\'';
                ret[j++] = '\'';
            }
        }
        else if (j < sizeof (ret))
        {
            ret[j++] = ch;
        }
        else
        {
            j++;
        }
    }
    ret[sizeof (ret) - 1] = '\0';
    return ret;
}

stock SaveAccount(playerid)
{
    new query[256];
	if(PlayerInfo[playerid][pLogged] == true)
	{
	    format(query, sizeof(query),
		"UPDATE `USERS` SET SCORE = '%d', KILLS = '%d', DEATHS = '%d' WHERE `NAME` = '%s' COLLATE NOCASE", GetPlayerScore(playerid), PlayerInfo[playerid][pKills], PlayerInfo[playerid][pDeaths], DB_Escape(GetPlayerNameEx(playerid)));
		database_result = db_query(server_database, query);
		db_free_result(database_result);
	}
	return 1;
}