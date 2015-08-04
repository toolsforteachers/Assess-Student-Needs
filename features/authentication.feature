Feature: Authenticating

Scenario: Signing in as a teacher
  Given I am the teacher of "Year 6A" with students "Ann,Bob,Clare"
  Then I should be on the after sign_in page
