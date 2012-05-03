class LessonStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :lesson

  def ticks
    return unless score
    score - 1
  end
end
