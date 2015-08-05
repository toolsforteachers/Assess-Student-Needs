class Student < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :group
  has_many :assessments
  validates :name, presence: :true, uniqueness: { scope: :group_id }

  default_scope { order('name asc') }

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
