

Feature: all sample requests

  Background: set url
    * url 'https://reqres.in/'


@createUserSchema
Scenario: to test the create user request
Given path '/api/users'
And header Content-Type = 'application/json'

  * print 'name=' , _name
  * print 'job=' , _job

And request
"""
      {
            "name": "#(_name)",
            "job": "#(_job)"
      }
      """
When method post
Then status 201