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

        
def listRaces():
	api_url = "https://dog.ceo/api/breeds/list/all"
	list_perritos = []

	response = requests.get(api_url)
	info_perro =( response.json())
	
	perro = info_perro['message']

	for p in perro:
		list_perritos.append(p)

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
			time.sleep(8)



if __name__ == "__main__":
	os.system("clear")	
	print("--------------------------------------")
	print("¡Bienvenido al mundo de los PERRITOS!")
	print("--------------------------------------")
	time.sleep(4)
	os.system("clear")

	while True:
		print("--------------------------------------")
		print("OPCIONES: ")
		print("[1]. IMAGEN RANDOM DE UN PERRITO")
		print("[2]. LISTA TODAS LAS RAZAS DE PERRITOS")
		print("[3]. ESCRIBE LA RAZA QUE QUIERAS VER - 1 IMAGEN")
		print("[4]. ESCRIBE LA RAZA QUE QUIERAS VER - 3 IMAGENES")
		print("[5]. EXIT")
		print("--------------------------------------")
		optionMenu = input("Escriba la opción deseada: ")
		os.system("clear")

		if optionMenu == "1":
			randomPerrito()
			time.sleep(8)
			os.system("clear")
	
		elif optionMenu == "2":
			listRaces()
			os.system("clear")
		
		elif optionMenu == "3":
			elijaSuPerrito()
			time.sleep(8)
			os.system("clear")

		elif optionMenu == "4":
			elijaSuPerritoTresImagenes()
			os.system("clear")

		elif optionMenu == "5":
			print("---------------------------------------")
			print("¡Vuelve pronto los perritos te esperan!")
			print("---------------------------------------")
			time.sleep(4)
			os.system("clear")
			break

		else:
			print("--------------------------------------------------")
			print("El numero digitado no corresponde a ninguna opción")
			print("--------------------------------------------------")
			time.sleep(3)
			os.system("clear")
			continue
