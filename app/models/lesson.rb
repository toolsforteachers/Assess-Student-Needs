class Lesson < ActiveRecord::Base
  belongs_to :group

  validates :group_id, presence: :true
  validates :name, presence: :true
end
