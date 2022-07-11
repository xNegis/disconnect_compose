from dataclasses import dataclass
import json
import yaml


#pasamos el yaml a un json
with open('docker-compose.override.yml', 'r') as file:
    yaml_data = yaml.safe_load(file)


configuration = open("disconnecter.config", "r").read()

microservices_to_activate = []

for val in configuration.split(";"):    
    #para que la string no sea empty ni null
    if val:
        if val.split("=")[1] == "true" or val.split("=")[1] == "1":
            microservices_to_activate.append(val.split("=")[0].strip())



#tratamos el json para añadir nuevos microservicios
values = [v for value in yaml_data["services"]["ApiGateWay"].values() if value for v in value] 
values=microservices_to_activate
yaml_data["services"]["ApiGateWay"]["depends_on"]=values


#escribimos en el yaml los datos
ff = open('docker-compose.override.yml', 'w+')
yaml.dump(yaml_data, ff, allow_unicode=True)



