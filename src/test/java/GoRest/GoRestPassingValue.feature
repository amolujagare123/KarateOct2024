Feature: passing value to file demo



  @createPassingValue
  Scenario: to test the create user request
    * def namePV = 'Amar Upasane'
    * def emailPV = 'amar.up@gmail.com'
    * def genderPV = 'male'
    * def statusPV = 'active'
    * call read('GoRestPassValue.feature') {_name :'#(namePV)', _email:'#(emailPV)',_gender:'#(genderPV)',_status:'#(statusPV)'}

