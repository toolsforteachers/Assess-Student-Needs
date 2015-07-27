class Indicator < ActiveRecord::Base
  has_closure_tree
  validates :name, presence: :true
  validates :type, presence: :true
end
