#noinspection CucumberUndefinedStep
Feature:  Login in portal

  Background:
    Given click on Skip button

  @portal
   Scenario Outline: User enters a portal
     Given Tap on the tab Portall
     When Enter <domain_portal> portal
     And Tap on the button Next
     And Enter login in <domain_portal>
     And Enter password <domain_portal>
     And Tap on the  button Next
     Then Tap on the button About

     Examples:
     |domain_portal|
     |info|
     |com |
     |eu  |
     |sg  |
     |personal.com |
     |personal.info|

   @personal
   Scenario Outline: User enters a personal
      Given Tap on the tab Personal
      And Input login in pesonal portal <personal>
      And Input password in personal portal  <personal>
      And Tap on the button Sing In
      Then Tap on the button About

      Examples:
      |personal|
      |personal.info|
      |personal.com|


  @portalSocialNetwork
  Scenario Outline: User enters a potral
    Given Tap on the tab Portall
    When Enter <domain_portal> portal
    And Tap on the button Next
    And Tap on the google button
    And Tap on the account profile google
    Then Tap on the button About

    Examples: 
    |domain_portal|
    |eu|
    |sg|
    |com|
    |info|

  @personalSocialNetwork
  Scenario: User enters a personal through google
    Given Tap on the tab Personal
    And Tap on the google button
    And Tap on the account profile google
    Then Tap on the button About


  #@portalSocialNetwork
  #Scenario Outline: User enters through facebook
  #  Given Tap on the tab Portall
  #  When Enter <domen_portal> portal
  #  And Tap on the button Next
  #  And Tap on the facebook button
  #  And Input data facebook account
  #  And Tap on the account profile facebook
  #  Then Tap on the button About
  #
  #  Examples: loginData
  #    |domen_portal|
  #    |info|

