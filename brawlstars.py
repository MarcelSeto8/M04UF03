#!/usr/bin/python3
import requests
from fabulous import utils, image
import random


class BrawlStars():

    def brawlerRandom(self):

        brawler_id = random.randint(16000000, 16000069)

        api_url = "https://api.brawlstars.com/v1/brawlers/"+str(pokemon_name)

        response = requests.get(api_url)
        
        info_brawl = (response.json())
        
        id = (info_brawl["id"])
        name = (info_brawl["name"])
        
        print("El id de este personaje es: " +str(id))
        print("El nombre del personaje es: "+ name)
       
       
if __name__ == "__main__":
	app = BrawlStars()
	app.brawlerRandom()
        
    