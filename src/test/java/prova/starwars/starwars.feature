Feature: Executar testes na API do Star Wars.

    Background: Executa antes de cada teste
        * def url_api = "https://swapi.dev/api/"

    Scenario: Verificar se api do star wars está de pé
        Given url 'https://swapi.dev/api/people/1/'
        When method get
        Then status 200

    Scenario: Verficar se pessoa 123 existe
        Given url 'https://swapi.dev/api/people/123/'
        When method get
        Then status 404
        And match response.detail == "Not found"

    Scenario: Verificar está retornando nome correto
        Given url url_api
        And path 'people/1/'
        When method get
        Then status 200
        And match response.name == "Luke Skywalker"
        And match response.gender == "male"

    Scenario: Verificar o retorno com sucesso da API com dados válidos da requisição
        Given url url_api + 'planets/5'
        When method get
        Then status 200
        And match response.name == "Dagobah"
        And match response.films[1] == "https://swapi.dev/api/films/3/"

    Scenario: Verificar o retorno com sucesso da API com dados válidos da requisição e verificar se o filme está apontando para o item correto
        Given url url_api + 'planets/5'
        When method get
        Then status 200
        And match response.name == "Dagobah"
        And match response.films[1] == "https://swapi.dev/api/films/3/"
        And def film = response.films[1]
        And print film
        And url film
        When method get
        Then status 200
        And match response.title == "Return of the Jedi"

#    POST
#    Scenario: Cadastrando usuário idrugs
#        Given url 'http://localhost:8102/ipa-campaign-engine/api/campaign/v1/campaigns'
#        And request
#        """{
#          "campaign_id": 0,
#          "client_id": 129390,
#          "name": "teste",
#          "description": "string",
#          "created_date": "2022-05-23",
#          "starting_date": "2022-05-23",
#          "expiration_date": "2022-05-23",
#          "author": "string",
#          "status": "ACTIVE"
#        }
#        """
#        When method POST
#        Then status 201

