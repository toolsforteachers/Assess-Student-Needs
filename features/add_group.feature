Feature: Teacher adds a group and some students

@javascript
Scenario:
  Given I am the teacher
  And there is a maths curriculum "NC2014"
  And I am on the home page
  And I add a group named "Year 6A" with a student named "Ann"
  Then the "Year 6A" group should have 1 students
  And I should be the teacher of "Year 6A"

  When I change the group "Year 6A" to "Year 6B"
  Then I should be the teacher of "Year 6B"

  When I try to add a duplicate group "Year 6B"
  Then I should get a group validation error
