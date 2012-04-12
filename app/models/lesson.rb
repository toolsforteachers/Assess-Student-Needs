class Lesson < ActiveRecord::Base
  belongs_to :group
  belongs_to :teacher
  validates_presence_of :teacher
end