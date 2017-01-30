import re

nodes = open('nodes.html', 'r').read()
matches = re.findall('addnode.*?:\d+', nodes, re.DOTALL)
for node in matches:
    print(node)
