class Lesson < ActiveRecord::Base
  belongs_to :group
  has_many :objectives
  has_many :assessments, as: :assessor

  validates :lesson_date, presence: :true
  validates :group_id, presence: :true
  validates :name, presence: :true

  delegate :students, to: :group

  accepts_nested_attributes_for :objectives,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['indicator_id'].blank? }

  default_scope { order('lesson_date desc') }
end
