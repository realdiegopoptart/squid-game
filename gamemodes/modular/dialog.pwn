public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_REGISTER:
		{
			if(response)
			{
				if(strlen(inputtext) < 3 || strlen(inputtext) > 24)
				{
					SendClientMessage(playerid, -1, "SERVER: Your password must be from 3-24 characters.");
					return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "{FFFFFF}Register Account", "{FFFFFF}Please enter a password below to register an account:", "Enter", "Leave");
				}
				
				bcrypt_hash(playerid, "OnPlayerRegister", inputtext, 12);
				return 1;
			}
			else
			{
				Kick(playerid);
			}
		}
		case DIALOG_LOGIN:
		{
			if(response)
			{
				new query[256], field[64];
				format(query, sizeof(query), "SELECT `PASS` FROM `USERS` WHERE `NAME` = '%s' COLLATE NOCASE", DB_Escape(GetPlayerNameEx(playerid)));
				database_result = db_query(server_database, query);
				if(db_num_rows(database_result))
				{
					db_get_field_assoc(database_result, "PASS", field, sizeof(field));
					bcrypt_verify(playerid, "OnPlayerLogin", inputtext, field);
				}
				return 1;
			}
			else
			{
				Kick(playerid);
			}
		}
	}
	return 1;
}