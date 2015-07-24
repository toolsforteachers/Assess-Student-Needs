Feature: Teacher adds a lesson

@javascript
Scenario:
  Given I am the teacher of "Year 6A" with students "Ann"

  When I add a new lesson for "Year 6A"
  Then the lesson should have 2 objectives
  And the lesson name should be "Do stuff"

  When I edit the lesson
  Then the lesson should have 1 objectives
  And the lesson name should be "new goal"

