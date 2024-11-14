Feature: all sample requests

  Background: set url
    * url 'https://reqres.in/'

    @getAll
  Scenario: to check the get all user request
    Given path '/api/users?page=2'
    When method get
    * def myResponse = response
    * print "myResponse=", myResponse
    Then status 200
      * def data =
          """
             {
                "id": "#number",
                "name": "#string",
                "year": "#number",
                "color": "#string",
                "pantone_value": "#string"
              }

          """
      * def support =

            """
            {
                "url": "#string",
                "text": "#string"
              }
            """

      And match response ==
      """
        {
          "page": "#number",
          "per_page": "#number",
          "total": "#number",
          "total_pages": "#number",
          "data": "#[] #(data)",
          "support": "#(support)"
        }
      """




    @create
    Scenario: to test the create user request
      Given path '/api/users'
      And header Content-Type = 'application/json'
      And request
      """
      {
            "name": "Amol",
            "job": "leader"
      }
      """
      When method post
      Then status 201
      #And match response.name == 'morpheus'
      And match response !=
      """
      {
        "name":"Amol",
        "job":"leader",
        "id":"266",
        "createdAt":"2024-11-06T02:00:59.143Z"
        }
      """

  @createUserSchema
  Scenario: to test the create user request
    Given path '/api/users'
    And header Content-Type = 'application/json'
    And request
      """
      {
            "name": "Amol",
            "job": "leader"
      }
      """
    When method post
    Then status 201
      #And match response.name == 'morpheus'
    And match response ==
      """
      {
        "name":"#string",
        "job":"#string",
        "id":"#number",
        "createdAt":"#string"
        }
      """


  @createParam
  Scenario Outline: to test the create user request
    Given path '/api/users'
    And header Content-Type = 'application/json'
    And request
      """
      {
            "name": "<name>",
            "job": "<job>"
      }
      """
    When method post
    Then status 201
    Examples:
      | name   | job    |
      | amol   | HR     |
      | pravin | dev    |
      | varun  | tester |


  @createParam2
  Scenario Outline: to test the create user request
    Given path '/api/users'
    And header Content-Type = 'application/json'
    * def job2 = "Business Analyst"
    * print "job2=", job2
    And request
      """
      {
            "name": "<name>",
            "job":  #(job2)
      }
      """
    When method post
    Then status 201
    Examples:
    | name |
    | amol |


    @javascriptDemo
    Scenario: test the java script
      * def  valueOfA = function()  { return 10 }
      * print 'valueOfA =' , valueOfA()
      * def randomNumber = function() { return Math.floor(100 * Math.random())}
      * print 'randomNumber =' , randomNumber()

