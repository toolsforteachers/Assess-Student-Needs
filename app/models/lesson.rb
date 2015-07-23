class Lesson < ActiveRecord::Base
  belongs_to :group
  has_many :objectives

  validates :lesson_date, presence: :true
  validates :group_id, presence: :true
  validates :name, presence: :true

  accepts_nested_attributes_for :objectives,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['indicator_id'].blank? }
end
