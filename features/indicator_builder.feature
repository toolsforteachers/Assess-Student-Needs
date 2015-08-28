Feature: Admin does stuff with the curriculum

Background:
  Given I am the teacher

@javascript
Scenario: Adding a curriculum and several children
  Given I am an admin
  And I visit the indicators page
  And I add a curriculum "National Curriculum"
  And I add a subject "Spanish"
  And I visit the indicators page
  And I follow "View"
  And I add a level "Year 1" to "Spanish"
  And I add a topic "Grammar" to "Year 1"
  And I add a prompt "Students should" to "Grammar"
  And I add an objective "Order a beer" to "Students should"
  And I change the name of topic "Grammar" to "Grammatica"
  And I can not delete "Year 1"
  And I delete "Order a beer"

Scenario: Not allowed!
  When I visit the indicators page
  Then I should not be allowed
