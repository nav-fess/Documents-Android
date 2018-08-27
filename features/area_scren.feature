#noinspection CucumberUndefinedStep
Feature:  User ia able to convert area units

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

     Examples: loginData
     |domen_portal|
     |info|
     |com|
     |sg|
     #|eu|

   @personal
   Scenario Outline: User enters a personal
      Given Tap on the tab Personal
      And Input login in pesonal portal <personal>
      And Input password in personal portal  <personal>
      And Tap on the button Sing In
      Then Tap on the button About

      Examples: dataPersonal
      |personal|
      |ab.info|


  @portalSocialNetwork
  Scenario: User enters through google
    Given Tap on the tab Portall
    When Cick on the google button
    And Tap on the button Sing In
    Then Tap on the button About

