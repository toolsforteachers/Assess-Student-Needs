class Assessment < ActiveRecord::Base
  belongs_to :assessor, polymorphic: true
  belongs_to :indicator
  belongs_to :student

  default_scope { order('lesson_datetime is not null, lesson_datetime desc') }
end
