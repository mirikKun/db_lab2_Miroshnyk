SELECT release_year, COUNT(*) FROM game
GROUP BY release_year ORDER BY release_year;

SELECT developer.developer_name,count(game_addon.*)
AS developer_addons FROM developer
INNER JOIN game ON developer.developer_name = game.developer_name
INNER JOIN game_addon ON game.appid = game_addon.appid
group by developer.developer_name;

SELECT developer.developer_name,SUM(game.price)
AS developer_addons FROM developer
INNER JOIN  game ON developer.developer_name = game.developer_name
group by developer.developer_name