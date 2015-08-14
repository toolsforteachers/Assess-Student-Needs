class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :teacher
  belongs_to :subject, class_name: 'Indicators::Subject'

  has_many :students
  has_many :lessons

  validates :name, presence: :true
  validates :teacher_id, presence: true

  validates :name, uniqueness: { scope: :teacher_id }
  default_scope { order('name') }

  accepts_nested_attributes_for :students,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['name'].blank? }

  def to_s
    name
  end
end
