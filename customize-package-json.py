import json

json_doc = None
file_name = 'package.json'

with open(file_name) as f:
    json_doc = json.load(f)
    json_doc['scripts']['djserver']  = "python manage.py runserver"




with open(file_name, 'w', encoding='utf8') as f:
    json_str = json.dumps(json_doc, indent=4 )
    f.write(json_str)