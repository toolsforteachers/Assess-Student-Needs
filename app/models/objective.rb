class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :lesson_id, presence: :true
  validates :indicator_id, presence: :true
end
