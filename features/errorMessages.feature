Feature: error messages

Scenario: Displays error when the user does not select a mandatory field
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select nothing and click continue I get error
    And I select the option no for working irregular hours
    And I select nothing and click continue I get error
    And I select the option hours worked per week
    And I select nothing and click continue I get error
    And I select the option for a full leave year
    And I select nothing and click continue I get error
    And I input 37.5 hours worked per week
    And I select nothing and click continue I get error
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours 210

Scenario: Displays error when the user enters wrong number of hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 10000 hours worked per week
    And I expect error
    And I input 37.5 hours worked per week
    And I select nothing and click continue I get error
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours 210

Scenario: Displays error when enddate earlier than startdate
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option yes for working irregular hours
    And I enter when the leave year starts
    And I select the option days worked per week
    And I select for someone leaving part way through a leave year
    And I enter employment enddate earlier than startdate
    And I expect error


Scenario: Displays error when entering negative number in year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option yes for working irregular hours
    And I enter when the leave year starts with year negative
    And I expect error

Scenario: Displays error when entering large number in year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option yes for working irregular hours
    And I enter when the leave year starts with year large
    And I expect error

Scenario: Displays error when entering negative number in month
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option yes for working irregular hours
    And I enter when the leave year starts with month negative
    And I expect error