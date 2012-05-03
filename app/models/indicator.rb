class Indicator < ActiveRecord::Base
  validates_numericality_of :level, allow_nil: false, greater_than_or_equal_to: 1, less_than_or_equal_to: 7
  validates_presence_of :name
end
