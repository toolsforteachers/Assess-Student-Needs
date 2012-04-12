Feature: Teacher logs a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Scenario:
    Given I am the teacher of "Year 6A"
    When I add a lesson "Adding Up" for "Year 6A"
    And I change the lesson name to "Long Division"

    And I record a score of 4 for "Ann"
    And I record a score of 3 for "Bob"
    And I press "Save"
    Then I should see the APP GRID