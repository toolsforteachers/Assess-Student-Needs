Feature: Teacher adds a group and some students

@javascript
Scenario:
  Given I am the teacher
  And I am on the home page
  And I add a group named "Year 6A" with a student named "Ann"
  Then the "Year 6A" group should have 1 students
  And I should be the teacher of "Year 6A"

  When I edit the group "Year 6A"
  And I remove the student
  Then the "Year 6A" group should have 0 students
