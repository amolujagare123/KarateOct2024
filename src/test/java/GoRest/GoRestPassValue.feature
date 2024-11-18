Feature: passing value to file demo

  Background: set url
    * url 'https://gorest.co.in/'

  @createPassValue
  Scenario: to test the create user request
    Given path '/public/v2/users'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'


    * print 'name=' , _name
    * print 'email=' , _email
    * print 'gender=' , _gender
    * print 'status=' , _status

    And request
      """
          {
            "name": "#(_name)",
            "email": "#(_email)",
            "gender": "#(_gender)",
            "status": "#(_status)"
          }
      """
    When method post
    Then status 201