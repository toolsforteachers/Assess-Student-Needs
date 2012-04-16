Fabricator(:teacher) do
  name Faker::Name.name
  email { |teacher| "#{ teacher.name.parameterize }@example.com" }
  password 'password'
  password_confirmation 'password'
end