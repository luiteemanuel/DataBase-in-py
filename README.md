# DataBase-in-py
Criando banco de Dados com Python Usando API Requests. 

## Case de Dados! 
  O contexto do projeto foi Criar um Banco de Dados e popular o mesmo usando Python e SQL 
  Na Segunda parte foi proposto criar um código que irá consumir uma [API](https://rapidapi.com/theoddsapi/api/live-sports-odds/)  e armazenar os dados no mesmo banco de dados. 

## Vamos la!!! 
O banco de dados escolhido foi o PostgreSQL com o DBbeaver para realizar consultas. 
O banco está Rodando local para maior comodidade. 

## Criação do banco de dados
O banco de dados foi criado localmente usando o Terminal PSQL. 

Após isso foi feita a criação das Tabelas. o Arquivo "Create_tables.sql" possui as Querys 

  ![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/84e6115f-06a3-4a55-bed9-de9f8f1f2439)

## Inserido dados no banco! 
Foi feito um Script para Gerar dados aleatorios Usei a Biblioteca do Python [Faker](https://pypi.org/project/Faker/0.7.4/)
O código está no arquivo "Insert_dataBase.ipynb"

Primeiro passo foi Determinar algumas Variáveis, criar listas vazias para receber os dados e determinar Intervalos para gerar a data de nascimento
passei também um parâmetro para a biblioteca que Estarei gerando dados "PT-BR" isso evita que os dados gerados sejam em outro idioma, etc. 

![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/7dbc6026-4585-4fb8-9b93-49bacb4f4a7c)

Após gerar esses dados foi necessário setar eles nas listas que criei anteriormente.
Nota-se que já deixei as lista com os nomes da tabela no banco de dados, facilitando a inserção dos no banco de dados  
Foi utilizado o método oto Apend() para fazer isso.

![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/24f8d0c5-63ed-4e71-ac60-76bc54ebc11b)

Feito isso SO foi a inserção dos dados Usando a Biblioteca [Psycopg2](https://pypi.org/project/psycopg2/)  
  Primeira coisa a ser feita e fazer a conexão com o banco. 
  Eu fiz uma função que cria e conecta no banco de dados. 
  ![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/15aebf36-5cbd-45c8-b25a-f02e21b5d705)

Após conectado foi necessário somente inserir os dados no Banco. 
![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/516e8b42-0fc8-4cae-a52f-08b854ee22c6)

## API Buscar Dados do Campeonato Brasleiro. 

Foi Usada a Biblioteca [Requests](https://pypi.org/project/requests/) para Consumir a [API](https://rapidapi.com/theoddsapi/api/live-sports-odds/)
Após consumir a mesma peguei o Retorno que foi em Json e Setei em um DataFrame usando o [Pandas](https://pandas.pydata.org/). 

Usei também o Metodo "json_normalize()" para normalizar os dados e criar tabelas. 
![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/e0a30f88-fd9e-4a8b-b537-4b639b5a499e)

Após isso fiz um tratamento dos dados, normalizei as datas e horas🕐
exclui as tabelas desnecessárias. 
![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/8ec8e9e0-e5ad-431b-bc58-bfd6acf09e50)

![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/d3ff26f1-6017-44af-8ffb-b571fa125f72)

Apos isso foi so necessario normalziar a tabela, "scores" as mesma estava toda despadronizada, foi feito todo um tratamento. 
Essa etapa sempre e a mais complexa devido que nao e facil trabalhar com dados com o padrao Chave:valor 
![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/d4131aa4-5c5d-49a0-99c4-3ad3e76a70ae)

![image](https://github.com/luiteemanuel/DataBase-in-py/assets/60760100/e0c42b55-6320-4a1d-a67f-91154d029005)

Apos isso foi so necssario inserir os dados no Banco de dados! 
o processo foi o mesmo que fiz anteriormente. 
## FIM! 
