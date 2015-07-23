class Assessment < ActiveRecord::Base
  belongs_to :marker, polymorphic: true
  belongs_to :indicator
  delegate :students, to: :group

  validates_presence_of :group_id
  validates_presence_of :indicator_id

  default_scope { order('lesson_datetime is not null, lesson_datetime desc') }
end
