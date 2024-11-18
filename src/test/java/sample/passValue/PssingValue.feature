Feature: all sample requests

  Scenario:  passing value to feature file
    * def namePV = 'Suresh'
    * def jobPV = 'cooking'
    * call read('SamplePassValue.feature') {_name:'#(namePV)',_job:#(jobPV)}