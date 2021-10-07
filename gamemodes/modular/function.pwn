forward OnPlayerLogin(playerid, bool:success);
public OnPlayerLogin(playerid, bool:success)
{
 	if(success)
	{
		new query[256], field[24];
	    format(query, sizeof(query), "SELECT * FROM `USERS` WHERE `NAME` = '%s' COLLATE NOCASE", DB_Escape(GetPlayerNameEx(playerid)));
		database_result = db_query(server_database, query);
		if(db_num_rows(database_result))
		{
			db_get_field_assoc(database_result, "SCORE", field, sizeof(field));
			SetPlayerScore(playerid, strval(field));

			db_get_field_assoc(database_result, "KILLS", field, sizeof(field));
			PlayerInfo[playerid][pKills] = strval(field);

			db_get_field_assoc(database_result, "DEATHS", field, sizeof(field));
			PlayerInfo[playerid][pDeaths] = strval(field);
		}

		db_free_result(database_result);
		
		PlayerInfo[playerid][pLogged] = true;

		SendClientMessage(playerid, -1, "SERVER: You have successfully logged into your account.");
		return 1;
 	}
	else
 	{
 		Kick(playerid);
 	}
	return 1;
}

forward OnPlayerRegister(playerid);
public OnPlayerRegister(playerid)
{
	new password[64];
	bcrypt_get_hash(password);

	new query[256];
	format(query, sizeof(query), "INSERT INTO `USERS` (`NAME`, `PASS`, `SCORE`, `KILLS`, `DEATHS`) VALUES ('%s', '%s', '%d', '%d', '%d')", DB_Escape(GetPlayerNameEx(playerid)), password, GetPlayerScore(playerid), PlayerInfo[playerid][pKills], PlayerInfo[playerid][pDeaths]);
	database_result = db_query(server_database, query);
	db_free_result(database_result);

	PlayerInfo[playerid][pLogged] = true;
	
	SendClientMessage(playerid, -1, "SERVER: You have successfully registered an account.");
	return 1;
}

