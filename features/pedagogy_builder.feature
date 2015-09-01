Feature: Teacher builds a pedagogy
Background:
  Given I am the teacher

@javascript
Scenario: Adding a three tier pedagogy
  When I add a pedadogy "Berger"
  And I add a learning attribute "Inquiry"
  And I add a learning skill "I can ask questions"
  And I add a pedagogy objective "I can use those skills"

  When I visit the pedagogies page
  And I follow "Inquiry"
  Then I should see "I can use those skills" as the objective

@javascript
Scenario: Adding a two tier pedagogy
  When I add a pedadogy "PBC"
  And I add a learning skill "Resilience"
  And I add a pedagogy objective "Managing distraction"

  When I visit the pedagogies page
  And I follow "Resilience"
  Then I should see "Managing distraction" as the objective

