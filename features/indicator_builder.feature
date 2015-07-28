Feature: Teacher does stuff with the curriculum

Background:
  Given I am the teacher

Scenario: Adding a subject and several children
  When I visit the indicators page
  And I add a subject "Spanish"

  And I visit the indicators page
  And I follow "Spanish"
  Then I should be on the indicator page for "Spanish"

  When I add a level "Year 1" to "Spanish"
  Then I should be on the indicator page for "Year 1"

  When I add a topic "Grammar" to "Year 1"
  Then I should be on the indicator page for "Grammar"

  When I add a strand "Past and present" to "Grammar"
  Then I should be on the indicator page for "Past and present"
