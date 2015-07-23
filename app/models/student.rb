class Student < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :group
  has_many :assessments
  validates :name, presence: :true, uniqueness: { scope: :group_id }
  validates :prior_knowledge_level, numericality: { less_than: 5 }, allow_nil: true

  default_scope { order('name asc') }

  def current_level
    cl = assessments.map(&:indicator).map(&:level).max || 1
    cl > (prior_knowledge_level.to_i + 1) ? cl : (prior_knowledge_level.to_i + 1)
  end

  def indicator_assessments(indicator)
    return [] unless indicator
     assessments
      .where(['assessments.indicator_id = ? and score > 0', indicator.id])
      .order('assessments.created_at desc')
  end

  def indicator_score(indicator)
    return [] unless indicator
    indicator_assessments(indicator).limit(2).average(:score).to_i
  end

  def indicator_lessons(indicator)
    return [] unless indicator
    indicator_assessments(indicator).where("assessments.type = 'Lesson'")
  end
end
