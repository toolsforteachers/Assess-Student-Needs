Feature: Discussing the curriculum

Background:
  Given there is a maths curriculum "NC2014"

Scenario: Logged in as a teacher
  Given I am the teacher
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields

  When I browse to "Addition and subtraction" and add it to a new lesson
  Then I should be on the lesson page

Scenario: Not logged in
  When I visit the curricula page
  And I follow "Year 1"
  Then I should see the discussion fields

  When I browse to "Addition and subtraction" and add it to a new lesson
  Then I should be on the lesson page
