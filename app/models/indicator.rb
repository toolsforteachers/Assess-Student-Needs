class Indicator < ActiveRecord::Base
  has_closure_tree order: 'name'
  validates :name, presence: :true
  validates :type, presence: :true

  def to_s
    name.capitalize
  end

  def friendly_type
    self.class.to_s.gsub('Indicators::', '')
  end

  def allowable_child_types
    []
  end
end
