import psycopg2

username = 'postgres'
password = ''
database = 'postgres'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT release_year, COUNT(*) FROM game
GROUP BY release_year ORDER BY release_year;
'''
query_2 = '''
SELECT developer.developer_name,count(game_addon.*)
AS developer_addons FROM developer
INNER JOIN game ON developer.developer_name = game.developer_name
INNER JOIN game_addon ON game.appid = game_addon.appid
group by developer.developer_name;
'''

query_3 = '''
SELECT developer.developer_name,SUM(game.price)
AS developer_addons FROM developer
INNER JOIN  game ON developer.developer_name = game.developer_name
group by developer.developer_name
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
with conn:
    cur = conn.cursor()

    print('Query 1:')
    cur.execute(query_1)
    for row in cur:
        print(row)

    print('\nQuery 2:')
    cur.execute(query_2)
    for row in cur:
        print(row)

    print('\nQuery 3:')
    cur.execute(query_3)
    for row in cur:
        print(row)