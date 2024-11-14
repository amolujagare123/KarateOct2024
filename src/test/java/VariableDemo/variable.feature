Feature:  variable demo

  Background: setting some variables
    * def app_name = 'google'
    * def page_load_time = 20

  Scenario: observe the variable demo
    Given  def int_var1 = 23
    And def string_var = 'Amol'
    When def int_var2 = int_var1 + 10
    * print 'int_var1 =' , int_var1
    * print 'int_var2 =' , int_var2
    * print 'string_var =' , string_var
    Then print 'app_name =' , app_name
    And print 'page_load_time =' , page_load_time

