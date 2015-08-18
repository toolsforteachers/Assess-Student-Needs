class Curriculum < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, uniqueness: true
  has_many :subjects, class_name: 'Indicators::Subject'

  def to_s
    name
  end
end
