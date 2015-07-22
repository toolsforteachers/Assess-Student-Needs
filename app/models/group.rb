class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :teacher
  has_many :students
  has_many :assessments
  has_many :lessons
  has_many :teacher_judgements

  validates :name, presence: :true
  validates :teacher_id, presence: true
  validates :name, uniqueness: { scope: :teacher_id }
  default_scope { order('name') }

  accepts_nested_attributes_for :students,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['name'].blank? }
end
