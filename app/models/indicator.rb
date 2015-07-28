class Indicator < ActiveRecord::Base
  has_closure_tree order: 'name'
  validates :name, presence: :true
  validates :type, presence: :true

  def to_s
    name.capitalize
  end
end
