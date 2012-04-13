class Lesson < ActiveRecord::Base
  belongs_to :group
  belongs_to :teacher
  has_many :lesson_students
  has_many :students, through: :lesson_students
  validates_presence_of :teacher
  validates_presence_of :name
  accepts_nested_attributes_for :lesson_students

  after_create :add_students_from_the_group

  def add_students_from_the_group
    group.students.map{ |student| lesson_students.create(student: student) } if group
  end
end