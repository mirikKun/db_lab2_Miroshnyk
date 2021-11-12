import psycopg2
import matplotlib.pyplot as plt

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

    cur.execute(query_1)
    characters = []
    characters_count = []

    for row in cur:
        characters.append(str(row[0]))
        characters_count.append(row[1])

    cur.execute(query_2)
    attributes = []
    attributes_count = []

    for row in cur:
        attributes.append(row[0] + '. ' + str(row[1]))
        attributes_count.append(row[1])

    cur.execute(query_3)
    attributes2 = []
    attributes_count2 = []

    for row in cur:
        attributes2.append(row[0])
        attributes_count2.append(row[1])

    fig, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)
    fig.set_size_inches(15, 10)

    # bar
    bar_ax.set_title('Количество игр за год')
    bar_ax.set_xlabel('Год')
    bar_ax.set_ylabel('Количество игр')
    bar = bar_ax.bar(characters, characters_count)
    bar_ax.set_xticks(range(len(characters)))
    bar_ax.set_xticklabels(characters, rotation=30)

    # pie
    pie_ax.pie(attributes_count, labels=attributes, autopct='%1.1f%%')
    pie_ax.set_title('Количество аддонов у каждого издадтеля')

    # graph
    graph_ax.plot(attributes2, attributes_count2, marker='o')
    graph_ax.set_title('Общая стоимость игр у каждого из издателей')
    graph_ax.set_xlabel('Издатель')
    graph_ax.set_ylabel('Стоимость')
    for gnr, count in zip(attributes2, attributes_count2):
        graph_ax.annotate(count, xy=(gnr, count), xytext=(7, 2), textcoords='offset points')

plt.get_current_fig_manager().resize(1600, 600)
plt.show()