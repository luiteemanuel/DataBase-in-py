import requests
import pandas as pd

url = "https://odds.p.rapidapi.com/v4/sports/soccer_brazil_campeonato/scores"

querystring = {"daysFrom":"3"}

headers = {
	"X-RapidAPI-Key": "56ef5d7821mshb3a5e1905772197p1f12d6jsn880239b1ac0a",
	"X-RapidAPI-Host": "odds.p.rapidapi.com"
}

response = requests.get(url, headers=headers, params=querystring)

dados = response.json()

cria_df = pd.json_normalize(dados)

print(cria_df)