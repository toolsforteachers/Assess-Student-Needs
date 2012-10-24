class Group < ActiveRecord::Base
  has_many :group_students
  has_many :students, through: :group_students
  has_many :lessons

  default_scope order('name')
end
