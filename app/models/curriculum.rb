class Curriculum < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, uniqueness: true
  has_many :subjects, class_name: 'Indicators::Subject'
  has_many :levels, through: :subjects

  def to_s
    name
  end
end
