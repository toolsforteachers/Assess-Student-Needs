Fabricator(:teacher) do
  email { |person| "#{Faker::Name.name.parameterize}@example.com" }
  password 'password'
  password_confirmation 'password'
end