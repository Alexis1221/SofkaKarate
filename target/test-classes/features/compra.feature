@karate
Feature: Login API Demo

  Background:
    Given url base_Url
    And header Content-Type = "application/json"

  Scenario Outline: Validar registro de usuario en signup
    Given path "/signup"
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method POST
    Then status 200
    * def cleanResponse = response.trim()
    Then match cleanResponse == '""'

    Examples:
      | karate.read('classpath:data/crearUsuario.csv') |

  @Regresion
  Scenario Outline: Validar registro de usuario existente en signup
    Given path "/signup"
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method POST
    Then status 200
    Then match response.errorMessage == 'This user already exist.'

    Examples:
      | karate.read('classpath:data/crearUsuario.csv') |

  @Regresion
  Scenario Outline: Validar login
    Given path "/login"
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method POST
    Then status 200
    And print response
    Then karate.match(response.Auth_token, '#string')

    Examples:
      | karate.read('classpath:data/crearUsuario.csv') |

  @Regresion
  Scenario Outline: Validar login con credenciales incorrectas
    Given path "/login"
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method POST
    Then status 200
    Then match response.errorMessage == 'User does not exist.'
    # Captura de salida
    And print response

    Examples:
      | karate.read('classpath:data/usuarioIncorrecto.csv') |

