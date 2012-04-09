Feature: Teach adds a group and some students

Scenario:
  Given I am the teacher
  And I am on the home page
  And I add a group named "Year 6A"
  And I add 3 students to the group "Year 6A"
  When the "Year 6A" group should have 3 students


