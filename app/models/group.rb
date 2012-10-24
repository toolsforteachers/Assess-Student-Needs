class Group < ActiveRecord::Base
  has_many :group_students
  has_many :students, through: :group_students
  has_many :lessons
  validates_uniqueness_of :name
  default_scope order('name')
end
