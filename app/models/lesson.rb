class Lesson < ActiveRecord::Base
  belongs_to :group
  has_many :objectives

  validates :group_id, presence: :true
  validates :name, presence: :true
end
