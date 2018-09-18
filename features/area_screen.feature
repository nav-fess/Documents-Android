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

    Examples: loginData
      |domen_portal|
      |info|
      |eu|
      |sg|
      |com|