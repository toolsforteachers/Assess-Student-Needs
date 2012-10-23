Feature: Teacher logs a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Background:
    Given I am the teacher of "Year 6A" with students "Ann,Bob,Clare"
    And the following indicators:
      | level | name            | key           | description         |
      | 2     | Adding up       | MA2_NUMBERS   | about the indicator |
      | 4     | Measuring stuff | MA3A_MEASURES |                     |
    And I add a lesson "Adding Up" for "Year 6A" with indicator "Adding up"

  Scenario: editing the lesson objective and checking the strand is rendered from 'MA2_NUMBERS'
    When I edit the lesson objective to "Long Division"
    Then I should be on the lesson page for "Long Division"
    And I should see "Adding up" for ".indicator_name"
    And I should see "2" for ".level"
    And I should see "Numbers > Numbers and the number system" for ".strand"
    And I should see "about the indicator" for ".description"

  Scenario: adding students to the lesson also adds to the group
    Given the lesson "Adding Up" should have 3 students
    When I add "Diane" to the lesson "Adding Up"
    Then I should be on the lesson page for "Adding Up"
    And the lesson "Adding Up" should have 4 students
    And the "Year 6A" group should have 4 students

  Scenario: recording student scores
    When I record a score of 5 for "Ann"
    Then I should see "Ann" has 4 ticks for "Adding up"

    When I record a score of 3 for "Bob"
    Then I should see "Bob" has 2 ticks for "Adding up"

    When I record a score of 1 for "Clare"
    Then I should see "Clare" has 0 ticks for "Adding up"

  @javascript
  Scenario: recording student scores
    When I record a score of 5 for "Ann"
    And I wait 1 second
    Then I should see "Ann" has 4 ticks for "Adding up"

  @javascript
  Scenario: updating the indicator select menu and seeing values preset on the page
    When I follow "Edit Lesson"
    And I choose "Level 4" and "Measures" and press the update button
    And I choose "Measuring stuff" from the indicator list
    And I press "Update Lesson"
    Then I should see "Measuring stuff" for ".indicator_name"

    When I follow "Edit Lesson"
    Then I should see "Level 1" for "#lesson_level"
    And I should see "Measures" for "#lesson_key"
    And I should see "Measuring stuff" for "#lesson_indicator_id"