Feature: Teacher manages students

Background:
  Given I am the teacher of "Year 6A" with students "Ann"

@javascript
Scenario:
  When I add the students "Bob,Carol" to "Year 6A"
  Then the "Year 6A" group should have 3 students

  And I remove the student named "Ann"
  Then the "Year 6A" group should have 2 students
