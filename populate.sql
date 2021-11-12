INSERT INTO Developer (developer_name)
VALUES ('Blizzard');
INSERT INTO Developer (developer_name)
VALUES ('Steam');
INSERT INTO Developer (developer_name)
VALUES ('Ubisoft');

INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1111, 'Half-Life', 1998, 300, 'Steam');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1122, 'Dota 2', 2010, 0, 'Steam');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1211, 'Warcraft 3', 2002, 130, 'Blizzard');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1121, 'Diablo', 2002, 100, 'Blizzard');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1141, 'Starcraft 2', 2004, 200, 'Blizzard');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1311, 'Far cry', 2004, 350, 'Ubisoft');
INSERT INTO Game (appid, name, release_year, price, developer_name)
VALUES (1331, 'Assasins creed', 2004, 350, 'Ubisoft');

INSERT INTO Steam_Sale (sale_id, appid, discount)
VALUES (111, 1111, 50),
       (121, 1311, 80),
       (131, 1331, 75);

INSERT INTO Game_Addon (addon_id, price, appid)
VALUES (11, 99, 1211),
       (12, 89, 1331);