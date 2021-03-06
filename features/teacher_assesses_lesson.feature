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
    And "Ann" already has a mark of 4 out of 5 for "Adding up"

  @javascript
  Scenario: recording student scores
    When I record a score of 5 for "Ann" for "Adding up"
    Then I should see "Ann" has 5 ticks for "Adding up"

    Then I force a page reload
    And I should see 4 for the last attempt by "Ann"

    When I record a score of 3 for "Bob" for "Adding up"
    Then I should see "Bob" has 3 ticks for "Adding up"

    And I force a page reload
    When I follow "Report view"
    And I should see "Bob" in the "Adding up" section
    Then I should see "Ann" in the "Adding up" section
    But I should not see "Clare" in the "Adding up" section


  @javascript
  Scenario: printing notes labels
    When I record a notes of "well done" for "Ann" for "Adding up"
    And I follow "Student notes"
    Then I should get a pdf

  @javascript
  Scenario: generating the report pdf
    When I record a score of 5 for "Ann" for "Adding up"
    And I request a PDF on the report view
    Then I should get a pdf
