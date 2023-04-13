
import io
import sys
import json
import csv
# 打开并读取 JSON 文件
category = "心肌疾病"

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

with open(f'{category}_nodes.json', 'r', encoding='utf-8-sig') as f:
    data = json.load(f)

metrix = []
for item in data:
    line = []
    # keys = list(item['n']["properties"].keys())
    # first_key = keys[0]

    if item['n']["properties"].get("name") is not None:
        line.append(item['n']["properties"]['name'])
    elif item['n']["properties"].get("characteristic") is not None:
        line.append(item['n']["properties"]['characteristic'])
    else:
        line.append(item['n']["properties"]['disease'])

    # line.append(item['n']["properties"][first_key])
    line.append(item['n']["labels"][0])
    str = ''
    for key, val in item['n']["properties"].items():
        str += f"{key}: {val}\n"
    line.append(str[:-1])
    metrix.append(line)


# print(metrix)
with open(f'{category}_nodes.csv', 'w', newline='', encoding='utf-8-sig') as file:
    writer = csv.writer(file)
    writer.writerows(metrix)
