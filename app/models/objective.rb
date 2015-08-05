class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :indicator_id, presence: :true
  validates :stream, length: { maximum: 15 }, presence: true
end
