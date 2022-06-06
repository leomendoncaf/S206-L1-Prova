Feature: Executar testes na API do Pokemon.

    Background: Executa antes de cada teste
        * def url_api = "https://pokeapi.co/"

     Scenario: Verficar se o pokemon 1323 existe
        Given url 'https://pokeapi.co/pokemon/1323'
        When method get
        Then status 200
        And match response.detail == "Not found" 

    Scenario: Verificar se o pokemon numero 20 é o Raticate
        Given url 'https://pokeapi.co/pokemon/20'
        When method get
        Then status 200
        And match response.name == "raticate"

    Scenario: Verificar se a habilidade de numero 44 do Wartotle é o rain-dish
        Given url 'https://pokeapi.co/api/v2/ability/44/'
        When method get
        Then status 200
        And match response.name == "rain-dish"

    Scenario: Verificar está retornando nome correto
        Given url 'https://pokeapi.co/api/v2/pokemon/150'
        When method get
        Then status 200
        And match response.name == "Mewtwo"

    Scenario: Verificar se o Raticate possui peso igual a 200
        Given url 'https://pokeapi.co/api/v2/pokemon/raticate'
        When method get
        Then status 404
        And match response.weight = 200