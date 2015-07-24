class Curriculum < ActiveRecord::Base
  validates :name, presence: :true
end
