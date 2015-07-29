class Indicator < ActiveRecord::Base
  has_closure_tree order: 'name', dependent: :destroy
  validates :name, presence: :true
  validates :type, presence: :true

  before_destroy :check_deletable

  def to_s
    name.capitalize
  end

  def friendly_type
    self.class.to_s.gsub('Indicators::', '')
  end

  def allowable_child_types
    []
  end

  def deletable?
    return false unless leaf?
    return false if Objective.find_by(indicator: self)
    return false if Assessment.find_by(indicator: self)
    true
  end

  def check_deletable
    raise "Undeletable" unless deletable?
  end
end
