class Student < ActiveRecord::Base
  has_many :group_students
  has_many :groups, through: :group_students
  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope order('name asc')
end
