Fabricator(:teacher) do
  email { |teacher| "#{ Faker::Name.name.parameterize }@example.com" }
  name { Faker::Name.name }
  password 'password'
  password_confirmation 'password'
end