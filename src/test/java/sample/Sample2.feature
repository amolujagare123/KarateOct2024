Feature: all sample requests

  Background: set url
    * url 'https://reqres.in/'
    *  def myFeature = call read('helper.feature')



    @createUserExternalFile
    Scenario: to test the create user request
      Given path '/api/users'
      And header Content-Type = 'application/json'
      * print "name="  , myFeature.name
      * print "job="  , myFeature.job

      And request
      """
      {
            "name": "#(myFeature.name)",
            "job": "#(myFeature.job)"
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


    @javascriptDemo
    Scenario: test the java script
      * def  valueOfA = function()  { return 10 }
      * print 'valueOfA =' , valueOfA()
      * def randomNumber = function() { return Math.floor(100 * Math.random())}
      * print 'randomNumber =' , randomNumber()

