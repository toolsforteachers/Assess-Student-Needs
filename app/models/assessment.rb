class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true
  belongs_to :indicator
  belongs_to :student

  default_scope { includes(:student).order('students.name') }
end
