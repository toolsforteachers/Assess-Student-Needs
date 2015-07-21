Feature: APP grid

Scenario: display student's default level
  Given a student "Bob" with current level 2
  And I am the teacher
  And I follow "All students"
  And I follow "Bob"
  Then I should see an APP grid for "Bob" displaying level 2

  When I follow "Level 5"
  Then I should see an APP grid for "Bob" displaying level 5
