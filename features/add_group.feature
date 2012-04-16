Feature: Teach adds a group and some students

Scenario:
  Given I am the teacher
  And I am on the home page
  And I add a group named "Year 6A"
  And I add two students to the group "Year 6A"
  Then the "Year 6A" group should have 2 students
  And I should be on the students page for "Year 6A"
