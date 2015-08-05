class Student < ActiveRecord::Base
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :group
  has_many :assessments
  validates :name, presence: :true, uniqueness: { scope: :group_id }

  default_scope { order('name asc') }

  def average_score_for(indicator)
    assessments.by_indicator(indicator).average(:score).to_i
  end

  def slug_candidates
    [
      :name,
      [:name, :group_name]
    ]
  end

  def group_name
    group.try(:name)
  end
end
