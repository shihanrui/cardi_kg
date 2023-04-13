import json
import csv

category = "心肌疾病"
with open(f'{category}_relations.json', 'r', encoding='utf-8-sig') as f:
    data = json.load(f)

# print(data[0])

metrix = []


for item in data:
    line = []
    if item['n1']["properties"].get("name") is not None:
        node1 = item["n1"]['properties']['name']
    elif item['n1']["properties"].get("characteristic") is not None:
        node1 = item["n1"]['properties']['characteristic']
    else:
        node1 = item["n1"]['properties']['disease']

    if item['n2']["properties"].get("name") is not None:
        node2 = item["n2"]['properties']['name']
    elif item['n2']["properties"].get("characteristic") is not None:
        node2 = item["n2"]['properties']['characteristic']
    else:
        node2 = item["n2"]['properties']['disease']

    relation = item["r"]["type"]

    line.append(node1)
    line.append(relation)
    line.append(node2)
    metrix.append(line)

with open(f'{category}_relations.csv', 'w', newline='', encoding='utf-8-sig') as file:
    writer = csv.writer(file)
    writer.writerows(metrix)
