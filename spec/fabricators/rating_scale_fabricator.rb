Fabricator(:rating_scale) do
  name Faker::Lorem.word
  max_score 3
  ordinals [
    { name: 'N/A', value: 0 },
    { name: 'Beginning', value: 1 },
    { name: 'Middling', value: 2 },
    { name: 'Expert', value: 3 }
    ]
end
