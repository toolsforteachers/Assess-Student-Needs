Feature: Teacher edits their profile

Scenario:
  Given I am the teacher
  When I edit my profile
  Then my name should display as "Jim Bobb"
  And my email should be "jimbobb@example.com"
