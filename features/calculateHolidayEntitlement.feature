Feature: Calculate holiday entitlement

Scenario: Homepage is visible
    Given I navigate to the homepage
    And I should see the homepage

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours 210

Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option yes for working irregular hours
    And I enter when the leave year starts
    And I select the option days worked per week
    And I select for someone leaving part way through a leave year
    And I enter employment end date
    And I input 3 days worked per week
    Then I should see the total entitlement hours irregular 10.2
    And I should see the correct submitted answers irregular

Scenario: Displays the values that were inputted by the user on the summary page





Scenario: Updates calculation when value is edited
Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 35.5 hours worked per week
    And I input 5 days worked per week
    And I should see the total entitlement hours 198.8
    When I select option for change hours worked per week 
    And I input 40 hours worked per week
    And I input 5 days worked per week
    Then I should see the total entitlement hours 224.0
    
 
