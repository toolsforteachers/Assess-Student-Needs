class RatingScale < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :max_score, presence: true
end
