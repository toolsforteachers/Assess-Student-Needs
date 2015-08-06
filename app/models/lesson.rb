class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :group
  has_many :objectives, dependent: :destroy
  has_many :indicators, through: :objectives
  has_many :assessments, as: :assessor

  validates :lesson_date, presence: :true
  validates :group_id, presence: :true
  validates :name, presence: :true

  delegate :students, to: :group

  accepts_nested_attributes_for :objectives,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['indicator_id'].blank? }

  default_scope { order('lesson_date desc') }


  def slug_candidates
    [
      :name,
      [:name, :group_name],
      [:name, :group_name, :lesson_date]
    ]
  end

  def group_name
    group.try(:name)
  end

  def multiple_objectives?
    objectives.length > 1
  end

  def indicator
    indicators.first unless multiple_objectives?
  end
end
