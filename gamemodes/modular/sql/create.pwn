    server_database = db_open(SERVER_DATABASE);

    //TABLE USERS
    db_query(server_database, "CREATE TABLE IF NOT EXISTS `USERS`\
(`NAME`, `PASS`, `SCORE`, `KILLS`, `DEATHS`, `GAMESWON`, `MONEY`, `ADMIN, `SKIN`, `CUSTOMSKIN`)");