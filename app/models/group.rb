class Group < ActiveRecord::Base
  has_many :group_students
  has_many :students, through: :group_students
  has_many :assessments
  has_many :lessons
  has_many :teacher_judgements
  validates_uniqueness_of :name
  default_scope { order('name') }
end
