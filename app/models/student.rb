class Student < ActiveRecord::Base
  has_many :group_students
  has_many :groups, through: :group_students
  has_many :assessment_students
  has_many :assessments, through: :assessment_students
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :prior_knowledge_level, numericality: { less_than: 5 }, allow_nil: true

  default_scope { order('name asc') }

  def current_level
    cl = assessments.map(&:indicator).map(&:level).max || 1
    cl > (prior_knowledge_level.to_i + 1) ? cl : (prior_knowledge_level.to_i + 1)
  end

  def indicator_assessments(indicator)
    assessment_students.includes(:assessment)
      .where(['assessments.indicator_id = ? and score > 0', indicator.id])
      .order('assessment_students.created_at desc')
  end

  def indicator_score(indicator)
    indicator_assessments(indicator).limit(2).average(:score).to_i
  end

  def indicator_lessons(indicator)
    indicator_assessments(indicator).where("assessments.type = 'Lesson'")
  end
end
