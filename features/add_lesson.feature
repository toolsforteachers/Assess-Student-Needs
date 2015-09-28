Feature: Teacher adds a lesson

Background:
  Given I am the teacher of "Year 6A" with students "Ann"
  And there is a maths curriculum "NC2014"

@javascript
Scenario:
  Given I add a new "Maths" lesson for "Year 6A"
  And I add two objectives to that lesson
  Then the lesson should have streams titled "Curriculum,Curriculum"
  And the lesson notes should be "Do stuff"
  And the lesson teacher should be "Toby P."
  And the lesson evidenced mode should be "Teacher judgement"

  When I remove the first objective
  Then the lesson should have 1 streams
