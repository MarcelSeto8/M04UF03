#!/usr/bin/python
import requests
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
		self.list_dogs_empty = Label("Empty Dogs", id = "empty_dogs")

		yield Label("Bienvenida a la tierna app de cachorritos", id="title")
		yield self.list_dogs
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
			self.list_dogs_empty.update("Lista de perros "+str(list_perritos))

if __name__ == "__main__":
	app = HelloWorld()
	app.run()
