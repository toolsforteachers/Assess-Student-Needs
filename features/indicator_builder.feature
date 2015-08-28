Feature: Admin does stuff with the curriculum

Background:
  Given I am the teacher

@javascript
Scenario: Adding a curriculum and several children
  When I add a curriculum "National Curriculum"
  And I add a subject "Spanish"
  And I add a level "Year 1" to "Spanish"
  And I add a topic "Grammar" to "Year 1"
  And I add a prompt "Students should" to "Grammar"
  And I add an objective "Order a beer" to "Students should"
  And I change the name of topic "Grammar" to "Grammatica"
  And I can not delete "Year 1"
  And I delete "Order a beer"

  When I visit the curricula page
  Then I should see 1 curricula

Scenario: Add my own curriculum but can't fiddle with someone else's
  Given there is a maths curriculum "NC2014"
  When I add a curriculum "Fiddler"
  And I visit the curricula page
  Then I should see 2 curricula

  When I go to the add a subject page for "NC2014"
  Then I should not be allowed

  When I try to edit the subject "Maths"
  Then I should not be allowed
