class Student < ActiveRecord::Base
  has_many :group_students
  has_many :groups, through: :group_students
  attr_accessor :lesson_id
end
