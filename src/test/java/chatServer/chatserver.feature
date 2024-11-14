Feature: all sample requests
 #   * def credentials = 'admin:admin123'
   # * def encodedCredentials = karate.encodeBase64(credentials)

  Background: set url
    * url 'http://localhost/chat/lhc_web/index.php/site_admin'
    * def username = 'admin'
    * def password = 'admin123'
    * def token = karate.encodeBase64(username + ':' + password)
    * print 'token =', token

  @GetAll1
  Scenario: to test the create user request
    Given path '/restapi/getusers'
    And header Authorization = 'Basic ' + token
    And header Content-Type = 'application/json'
    When method get
    Then status 200


  @GetAll2
  Scenario: to test the create user request
    Given path '/restapi/getusers'
    And header Authorization = 'Basic ',token()
    And header Content-Type = 'application/json'
    When method get
    Then status 200

