Feature: Teacher does stuff with the curriculum

Background:
  Given I am the teacher

Scenario:
  When I visit the indicators page
  And I add a subject "Spanish"
  And I add a level "Year 1" to "Spanish"
  And I add topics "Oral,Verbs" to "Year 1"
  And I attach a note to "Oral"
