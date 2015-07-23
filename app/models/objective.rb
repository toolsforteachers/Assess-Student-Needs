class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :indicator_id, presence: :true
end
