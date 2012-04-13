Feature: Teacher logs a lesson
  As a Teacher
  In order to assess my students
  I want to log a lesson

  Scenario:
    Given I am the teacher of "Year 6A" with students "Ann,Bob"
    When I add a lesson "Adding Up" for "Year 6A"
    Then the lesson "Adding Up" should have 2 students
    And I edit the lesson name to "Long Division"