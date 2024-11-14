Feature: all deck of cards requests

  Background: set url
    * url 'https://deckofcardsapi.com/'

  @shuffleCards
  Scenario: to check the shuffle card request
    Given path '/api/deck/new/shuffle/'
    And param count = 1
    When method get
    * def myResponse = response
    * print "myResponse=", myResponse
    #Then status 200
    And match response ==
    """
    {
      "success": "#boolean",
      "deck_id": "#string",
      "shuffled": "#boolean",
      "remaining": "#number"
    }
    """

  @DrawCards
  Scenario: to check the shuffle card request
    Given path '/api/deck/hetn5g4t4txa/draw/'
    And param count = 2
    When method get
    * def myResponse = response
    Then status 200
    * def images =
    """
    {
        "svg": "#string",
        "png": "#string"
      }
    """
    * def cards =
    """

  {
  "code": "#string",
  "image": "#string",
  "images": "#(images)",
  "value": "#string",
  "suit": "#string"
  }

  """
    And match response ==
    """
    {
      "success": "#boolean",
      "deck_id": "#string",
      "cards": "#[] #(cards)",
      "remaining": "#number"
    }
    """