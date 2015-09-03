Feature: Discussing a pedagogy

Background:
  Given there is a pedagogy "PBL"

Scenario: Logged in as a teacher, choosing an objective to teach
  Given I am the teacher of "Year 6A" with students "Ann"
  When I visit the pedagogies page
  And I follow "Resilience"
  And I browse to "Keeps going" and click teach this
  Then I should pick a group and add a lesson with objective "Keeps going"
