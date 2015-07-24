Feature: APP grid

@javascript
Scenario: display student's default level
  Given I am the teacher
  And I am on the home page
  And I add a group named "Year 6A" with a student named "Ann"
  And I follow "Students"
  And I follow "Ann"
  Then I should see an APP grid for "Ann" displaying level 1

  When I follow "Level 5"
  Then I should see an APP grid for "Ann" displaying level 5
