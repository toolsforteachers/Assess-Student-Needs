class Assessment < ActiveRecord::Base
  belongs_to :group
  belongs_to :teacher
  belongs_to :indicator
  has_many :assessment_students, :dependent => :destroy
  delegate :students, to: :group

  validates_presence_of :group_id
  validates_presence_of :indicator_id

  after_create :add_students_from_the_group

  attr_accessor :level, :key

  default_scope { order('lesson_datetime is not null, lesson_datetime desc') }

  def add_students_from_the_group
    group.students.map{ |student| assessment_students.create(student: student) } if group
  end

  def simple_lesson_date
    lesson_datetime
  end

  def simple_lesson_date=the_date
    self.lesson_datetime = the_date
  end

  def type_helper=(value)
    self.type = value
  end

  def type_helper
    self.type
  end
end
