Feature: Teacher logs a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Scenario:
    Given I am the teacher of "Year 6A"
    And I add a lesson "Adding Up" for "Year 6A"
    And I change the lesson name "Year 6A" to "Long Division"




    And I record 4 for Ann A.
    And I record 5 for Bob B.
    And I press "Save"
    Then I should see something useful