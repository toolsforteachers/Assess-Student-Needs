class Curriculum < ActiveRecord::Base
  validates :name, presence: :true
  has_many :indicators
end
