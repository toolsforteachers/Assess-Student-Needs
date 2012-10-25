Feature: Teach adds a group and some students

Scenario:
  Given I am the teacher
  And I am on the home page
  And I add a group named "Year 6A" with two students
  Then the "Year 6A" group should have 2 students

  # temporarily here while I brainstom APP Grid implementation
  When I follow "Ann"
  And I follow "Level 3"
  Then I should see an APP grid for "Ann"