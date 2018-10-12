Feature: Registration in portal

  Background:
    Given click on Skip button

  @portalRegistration
  Scenario Outline: User registration a portal
    Given Tap on the tab Create Portall
    And Input address <portal>
    And Input email for <portal>
    And Input first name for <portal>
    And Input last name for <portal>
    And Tap on the button Next registration
    And Input password for registration <portal>
    And Repeat password for registration <portal>
    When Tap on the button Create
    Then Tap on the button About

    Examples:
      |portal|
      |potraldeletenow|



   # When Enter <domain_portal> portal
   # And Tap on the button Next
   # And Enter login in <domain_portal>
   # And Enter password <domain_portal>
   # And Tap on the  button Next
   # Then Tap on the button About

    #Examples: loginData
     # |domain_portal|
     # |info|
     # |eu|
     # |sg|
     #|com|

