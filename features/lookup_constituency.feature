Feature: Lookup constituency
  In order to see who I can vote for
  as a constituent
  I want to lookup my constituency

  Scenario: Enter postcode that has a constituency that isn't changing
    Given I am at the Front page
    When I search for "AB101AA"
    Then I should see "Aberdeen North"

  Scenario: Enter postcode that has a constituency is changing in 2010 election
    Given I am at the Front page
    When I search for "BA6 8NJ"
    Then I should see "Somerton and Frome"

  Scenario: Enter bogus postcode
    Given I am at the Front page
    When I search for "N1 XXX"
    Then I should see "Sorry: we couldn't find a constituency when we searched for N1 XXX."

  Scenario: Enter Guernsey postcode
    Given I am at the Front page
    When I search for "GY1 1AB"
    Then I should see "Sorry: we couldn't find a constituency when we searched for GY1 1AB."

