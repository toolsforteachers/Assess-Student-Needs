class Student < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :group
  has_many :assessments
  validates :name, presence: :true, uniqueness: { scope: :group_id }

  default_scope { order('name asc') }

  def average_score_for(indicator)
    assessments.by_indicator(indicator).average(:score).to_i
  end
end
