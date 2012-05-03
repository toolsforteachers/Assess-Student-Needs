Feature: Teacher logs a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Background:
    Given I am the teacher of "Year 6A" with students "Ann,Bob"
    And the following indicators:
      | level | name      |
      | 3     | Adding up |
    And I add a lesson "Adding Up" for "Year 6A" with indicator "Adding up"

  Scenario: editing the lesson objective
    When I edit the lesson objective to "Long Division"
    Then I should be on the lesson page for "Long Division"

  Scenario: adding students to the lesson also adds to the group
    Given the lesson "Adding Up" should have 2 students
    When I add "Chris" to the lesson "Adding Up"
    Then I should be on the lesson page for "Adding Up"
    And the lesson "Adding Up" should have 3 students
    And the "Year 6A" group should have 3 students

  Scenario: recording student scores
    Given I record a score of 5 for "Ann"
    And I record a score of 2 for "Bob"

