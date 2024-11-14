Feature: all job portal features
  Background: set url
    * url 'http://localhost:9897/'

    @getAll @job
  Scenario: to verify we retrieve all jobs by company
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
      And match response.[1].project[0].technology == '#[5]'
      And match response.[1].project == '#[3]'
      And match response.[1].project[0].technology[*] == ["React.js",  "Node.js",  "Express",   "MongoDB",    "AWS"]
      And match response.[1].project[0].technology[*] contains [ "MongoDB",  "React.js",   "AWS"]


  @create @job
  Scenario: to verify we retrieve all jobs by company
    Given path '/normal/webapi/add'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
  "experience": [
    "5+ years of experience in full-stack development, specializing in front-end and back-end development.",
    "Skilled in Agile methodologies and DevOps practices, working with cross-functional teams."
  ],
  "jobDescription": "We are looking for a skilled Full-Stack Developer to join our team to build scalable web applications and enhance user experience.",
  "jobId": 12345,
  "jobTitle": "Full-Stack Developer",
  "project": [
    {
      "projectName": "E-commerce Platform Development",
      "technology": [
        "React.js",
        "Node.js",
        "Express",
        "MongoDB",
        "AWS"
      ]
    },
    {
      "projectName": "Inventory Management System",
      "technology": [
        "Angular",
        "Java",
        "Spring Boot",
        "PostgreSQL",
        "Docker"
      ]
    },
    {
      "projectName": "Mobile App for Retail",
      "technology": [
        "React Native",
        "Firebase",
        "GraphQL",
        "Google Cloud"
      ]
    }
  ]
}

    """
    When method post
    Then status 201


  @create2 @job
  Scenario: to verify we retrieve all jobs by company
    Given path '/normal/webapi/add'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    * def myJson = read('./payload/createUserPayload.json')

    And request  myJson

    When method post
    Then status 201



    @multipleDataPrint1
    Scenario Outline: to create the job application
      Given print '<url>'
      When print '<path>'
      And print '<method>'
      Then print '<status>'
      Examples:
        | url                 | path         | method | status |
        | http://example1.com | /user/create | post   | 201    |
        | http://example2.com | /user/update | put    | 200    |
        | http://example3.com | /user/delete | delete | 202    |
        | http://example4.com | /user/get    | get    | 200    |




  @multipleDataPrint2
  Scenario Outline: to create the job application
 #  * def myData =  read("sampleData.csv")
    Given print '<url>'
    When print '<path>'
    And print '<method>'
    Then print '<status>'

    Examples:
     |  read('./payload/sampleData.csv') |


