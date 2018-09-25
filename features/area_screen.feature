#noinspection CucumberUndefinedStep
Feature:  Login in portal

  Background:
    Given click on Skip button

  @portal
   Scenario Outline: User enters a portal
     Given Tap on the tab Portall
     When Enter <domen_portal> portal
     And Tap on the button Next
     And Enter login in <domen_portal>
     And Enter password <domen_portal>
     And Tap on the  button Next
     Then Tap on the button About

     Examples:
     |domen_portal|
     |info|
     |eu|
     |sg|
     |com|

   @personal
   Scenario Outline: User enters a personal
      Given Tap on the tab Personal
      And Input login in pesonal portal <personal>
      And Input password in personal portal  <personal>
      And Tap on the button Sing In
      Then Tap on the button About

      Examples: dataPersonal
      |personal|
      |personal.onlyoffice|


  @portalSocialNetwork
  Scenario Outline: User enters a potral
    Given Tap on the tab Portall
    When Enter <domen_portal> portal
    And Tap on the button Next
    And Tap on the google button
    And Tap on the account profile google
    Then Tap on the button About

    Examples: loginData
    |domen_portal|
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


  @portalSocialNetwork
  Scenario Outline: User enters through facebook
    Given Tap on the tab Portall
    When Enter <domen_portal> portal
    And Tap on the button Next
    And Tap on the facebook button
    And Input data facebook account
    And Tap on the account profile facebook
    Then Tap on the button About

    Examples: loginData
      |domen_portal|
      |info|
