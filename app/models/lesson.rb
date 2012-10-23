class Lesson < ActiveRecord::Base
  belongs_to :group
  belongs_to :teacher
  belongs_to :indicator
  has_many :lesson_students, :dependent => :destroy
  has_many :students, through: :lesson_students
  validates_presence_of :teacher
  validates_presence_of :name
  validates_presence_of :group_id
  validates_presence_of :indicator_id

  after_create :add_students_from_the_group

  attr_accessor :level, :key

  def add_students_from_the_group
    group.students.map{ |student| lesson_students.create(student: student) } if group
  end

  def simple_lesson_date
    lesson_datetime
  end

  def simple_lesson_date=the_date
    lesson_datetime = the_date
  end
end