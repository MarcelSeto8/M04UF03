#!/usr/bin/python
import requests
import time
from textual.app import App, ComposeResult
from textual.widgets import Label, Button
from textual import events
global list_perritos
list_perritos = []

class HelloWorld(App):
	
	
	def compose(self) -> ComposeResult:
		self.close_button = Button("Exit", id = "close")
		self.list_dogs = Button("List Dogs", id = "list_dogs")
		self.next_dog = Button("Next Dog", id = "next_dog")
		self.list_dogs_empty = Label("", id = "empty_dogs")
		self.vaciar_list_dogs = Button("Vacia Lista", id = "vaciar_list")

		yield Label("Bienvenida a la tierna app de cachorritos", id="title")
		yield self.list_dogs
		yield self.vaciar_list_dogs
		yield self.list_dogs_empty
		yield self.next_dog
		yield self.close_button
		

	def listRaces(self):
		api_url = "https://dog.ceo/api/breeds/list/all"

		response = requests.get(api_url)
		info_perro = (response.json())

		perro = info_perro['message']
		for p in perro:
			list_perritos.append(p)

		
		#game_dogs_list = ", ".join(list_perritos)

	
	def on_button_pressed(self, event: Button.Pressed) -> None:
		if event.button.id == "list_dogs":
			self.listRaces()
			#game_dogs_list = ", ".join(list_perritos)
			num_dogs = len(list_perritos)
			dog_chunks = [list_perritos[i:i+5] for i in range(0, num_dogs, 5)]
			formatted_dogs = "\n".join(", ".join(chunk) for chunk in dog_chunks)

			self.list_dogs_empty.update("Lista de perros:\n "+str(formatted_dogs))
		
		if event.button.id == "vaciar_list":
			self.list_dogs_empty.update("")
		
		if event.button.id == "close":
			self.exit(event.button.id)

if __name__ == "__main__":
	app = HelloWorld()
	app.run()
