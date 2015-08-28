class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :group
  belongs_to :teacher

  has_many :objectives, dependent: :destroy
  has_many :indicators, through: :objectives
  has_many :assessments, as: :assessor
  has_many :teaching_materials, as: :attachable

  validates :lesson_date, presence: :true
  validates :group_id, presence: :true

  delegate :students, to: :group

  accepts_nested_attributes_for :objectives, allow_destroy: true

  default_scope { order('lesson_date desc') }

  def slug_candidates
    [
      :lesson_date,
      [:lesson_date, :group_name],
      [:lesson_date, :group_name, 'teacher']
    ]
  end

  def group_name
    group.try(:name)
  end

  def multiple_objectives?
    objectives.length > 1
  end

  def assessed_at
    lesson_date
  end

  def assessed_by
    teacher
  end
end
