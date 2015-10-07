Fabricator(:rating_scale) do
  name Faker::Lorem.word
  max_score 3
  ordinals do
    { 'N/A' => 0, 'Beginning' => 1, 'Middling' => 2, 'Expert' => 3 }
  end
end
