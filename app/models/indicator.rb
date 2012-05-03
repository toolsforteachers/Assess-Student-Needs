class Indicator < ActiveRecord::Base
  validates_numericality_of :level, allow_nil: false, greater_than_or_equal_to: 1, less_than_or_equal_to: 7
  validates_presence_of :name

  def self.grouped_options
    ret = []
    1.upto(7) do |i|
      ret << ["Level #{ i }", Indicator.where(level: i).all.map{ |indicator| [indicator.name, indicator.id]}]
    end
    ret
  end
end
