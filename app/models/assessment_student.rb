class AssessmentStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :assessment

  def ticks
    return 0 unless score
    score - 1
  end
end
