class Student < ActiveRecord::Base
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :group
  has_many :assessments, -> { order(updated_at: :desc) }
  validates :name, presence: :true, uniqueness: { scope: :group_id }

  default_scope { order('name asc') }

  def average_score_for(indicator)
    scores = scores_for(indicator)
    return 0 if scores.empty?
    scores.sum / scores.size.to_f
  end

  def scores_for(indicator)
    assessments.by_indicator(indicator).map(&:score)
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

  def to_s
    name
  end
end
