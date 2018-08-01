

Feature: User is able to convert area units


  Background:
    Given click on Skip button

  Scenario: User is able to dismiss help
    Given I land on help popup
    When I click on Got it button
    Then I land on Area screen


    Scenario: User is able to swap values
    Given  I click on Got it button
    And I see "Sq Kilometre" in From header
    And I  see "Sq Metre" in To header
    When I click on Swap button
    Then I see "Sq Metre" in From header
    And I see "Sq Kilometre" in To header

  @wip
  Scenario Outline: User еnters a portal
    Given Tap on the tab Portall
    When Enter <name_portal> portal
    And Tap on the button Next
    And Enter login <login>
    And Enter password <password>
    And Tap on the  button Sing In
    Then Tap on the button About
    Examples:
    |name_portal|login|password|
    |testinfo.teamlab.info|nct.devices@gmail.com|xxxxxxxxx|


