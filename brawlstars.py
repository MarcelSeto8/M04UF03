#!/usr/bin/python3
import requests
from fabulous import utils,image

def randomPerrito():
	api_url = "https://dog.ceo/api/breeds/image/random"

	response = requests.get(api_url)
        
	info_brawl = (response.json())
	perro = info_brawl['message']
	
	images = requests.get(perro).content

	image_name = "perrito.png"

	with open(image_name, "wb") as handler:
		handler.write(images)
		img = image.Image(image_name)
		print(img)

	print(info_brawl)  
        

randomPerrito()      
        
    
