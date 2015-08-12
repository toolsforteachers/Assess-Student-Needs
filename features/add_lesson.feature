Feature: Teacher adds a lesson

Background:
  Given I am the teacher of "Year 6A" with students "Ann"
  And there is a subject "Maths"

@javascript
Scenario: when the group has a subject
  Given "Year 6A" is studying "Maths"
  And I add a new "Maths" lesson for "Year 6A"
  And I add two objectives to that lesson
  Then the lesson should have 2 objectives
  And the lesson notes should be "Do stuff"
  And the lesson teacher should be "Toby P."

  When I edit the lesson
  Then the lesson should have 1 objectives
  And the lesson notes should be "new goal"
