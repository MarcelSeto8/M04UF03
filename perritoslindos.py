#!/usr/bin/python3
import requests
from fabulous import utils,image
import time
import os

def randomPerrito():
	api_url = "https://dog.ceo/api/breeds/image/random"

	response = requests.get(api_url)
        
	info_perro = (response.json())
	perro = info_perro['message']
	
	images = requests.get(perro).content

	image_name = "perrito.png"

	with open(image_name, "wb") as handler:
		handler.write(images)
		img = image.Image(image_name)
		print(img)

	print(info_perro)  
        
def listRaces():
	api_url = "https://dog.ceo/api/breeds/list/all"
	list_perritos = []

	response = requests.get(api_url)
	info_perro =( response.json())
	
	perro = info_perro['message']

	for p in perro:
		list_perritos.append(p)
#		print(p)

	conocerPerritos = input ("¿Quieres conocer a los perritos lindos?[y/n]: ")
	count = 0
	if conocerPerritos.lower() == "y":
		for p in list_perritos:
			print(p)
			count += 1
			if count == 20:
				time.sleep(8)
				os.system("clear")
				count = 0
	else:
		print("Vuelva cuando quiera a visitar a los perritos")


def elijaSuPerrito():
	
	_perritoName = input("Escriba el nombre de la raza de su perrito: ")

	api_url = "https://dog.ceo/api/breed/" + str(_perritoName) + "/images/random"
	response = requests.get(api_url)
	info_perro = (response.json())
	
	perro = info_perro['message']

	images = requests.get(perro).content
	image_name = "perrito_elegido.png"

	with open(image_name, "wb") as handler:
		handler.write(images)
		img = image.Image(image_name)
		print(img)

	#print(info_perro)
		
def elijaSuPerritoTresImagenes():
	
	_perritoName = input("Escriba el nombre de la raza de su perrito lindo: ")
	api_url = "https://dog.ceo/api/breed/" + str(_perritoName) + "/images/random/3"
	response = requests.get(api_url)
	info_perro = (response.json())
	
	for i in range(3): 
		perro = info_perro['message'][i]
		images = requests.get(perro).content
		image_name = "perrito_lindero.png"

		with open(image_name, "wb") as handler:
			handler.write(images)
			img = image.Image(image_name)
			print(img)
			time.sleep(5)

listRaces()
	
        
    
