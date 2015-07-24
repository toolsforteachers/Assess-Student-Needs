class Indicator < ActiveRecord::Base
  validates :name, presence: :true
end
