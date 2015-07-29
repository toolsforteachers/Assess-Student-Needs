Feature: Teacher assesses a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Background:
    Given I am the teacher of "Year 6A" with students "Ann,Bob,Clare"
    And the following indicators_objectives:
      | name            |
      | Adding up       |
      | Measuring stuff |
    And I add a lesson "Adding Up" for "Year 6A" with indicators "Adding up,Measuring stuff"
    And "Ann" already has a score of 4 for "Measuring stuff"

  @javascript
  Scenario: recording student scores
    When I record a score of 5 for "Ann" for "Measuring stuff"
    And I wait 1 second
    Then I should see "Ann" has 5 ticks for "Measuring stuff"
    Then I should see 4 for the last attempt by "Ann"

    When I record a score of 3 for "Bob" for "Adding up"
    And I wait 1 second
    Then I should see "Bob" has 3 ticks for "Adding up"

    When I follow "Report view"
    And I should see "Bob" in the "Adding up" section
    Then I should see "Ann" in the "Measuring stuff" section
