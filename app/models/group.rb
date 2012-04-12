class Group < ActiveRecord::Base
  has_many :group_students
  has_many :students, through: :group_students
end
