Feature: Discussing the curriculum

Background:
  Given there is a maths curriculum "NC2014"

Scenario: Logged in as a teacher
  Given I am the teacher
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields

Scenario: Not logged in
  When I am not logged in I still want to see the curriculum discussion
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields
