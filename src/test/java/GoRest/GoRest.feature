Feature: all sample requests

  Background: set url
    * url 'https://gorest.co.in/'
    * def myFile1 = call read('GoRestHelper.feature')
    * def myFile2 = call read('GoRestHelper2.feature')



  @create1
    Scenario: to test the create user request
      Given path '/public/v2/users'
      And header Content-Type = 'application/json'
      And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'

      And request
      """
          {
            "name": "Msgr. Aditi Roy",
            "email": "roy_msgr_aditi@skiles.example",
            "gender": "female",
            "status": "active"
          }
      """
      When method post
      Then status 201

  @createHelper
  Scenario: to test the create user request
    Given path '/public/v2/users'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'

    And request
      """
          {
            "name": "#(myFile1.name)",
            "email": "#(myFile1.email)",
            "gender": "#(myFile2.gender)",
            "status": "#(myFile2.status)"
          }
      """
    When method post
    Then status 201





  @create2
  Scenario: to test the create user request
    Given path '/public/v2/users'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    * def name = "amol ujagare"
    * def email = "amol@gmail.com"
    * def gender = "male"
    * def status = "active"

    And request
      """
          {
            "name": "#(name)",
            "email": "#(email)",
            "gender": "#(gender)",
            "status": "#(status)"
          }
      """
    When method post
    Then status 201



  @create3
  Scenario Outline: to test the create user request
    Given path '/public/v2/users'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'

    And request
      """
          {
            "name": "#(name)",
            "email": "#(email)",
            "gender": "#(gender)",
            "status": "#(status)"
          }
      """
    When method post
    Then status 201
    Examples:
      | read('GoRest.csv') |


  @GetAll
  Scenario: to test the create user request
    Given path '/public/v2/users'
    And header Content-Type = 'application/json'
    When method get
    Then status 200

