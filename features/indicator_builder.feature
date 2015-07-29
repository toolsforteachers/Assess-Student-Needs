Feature: Teacher does stuff with the curriculum

Background:
  Given I am the teacher

Scenario: Adding a subject and several children
  When I visit the indicators page
  And I add a subject "Spanish"
  And I visit the indicators page
  And I follow "Spanish"
  And I add a level "Year 1" to "Spanish"
  And I add a topic "Grammar" to "Year 1"
  And I add a strand "Past and present" to "Grammar"
  And I add a prompt "Students should" to "Past and present"
  And I add an objective "order a beer" to "Students should"

