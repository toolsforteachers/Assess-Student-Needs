Feature: Invite colleagues

Scenario:
  Given I am the teacher
  When I invite "mark@example.com"
  And I sign out
  Then "mark@example.com" should accept the invitation
