@javascript
Feature: Users can sign up for partner mailings on call action pages

  Background: Call actions should include an opt-in for mailings
    Given a call campaign exists
    And a partner named "Fight for the Future" with the code "ftf" exists
    And "Fight for the Future" is a partner on the action
    And I exist as a user
    And I am logged in
    And I browse to the action page

  Scenario: I can sign up for partner mailings
    When I fill in "subscription_email" with "user@test.com"
    And I click the element "label[for='ftf_subscribe_1']"
    And I fill in my phone number, address, and zip code and click call
    Then I should see "Calling you now"
    And there should be a persisted Subscription with:
        |email|user@test.com|
        |partner_id|1|
