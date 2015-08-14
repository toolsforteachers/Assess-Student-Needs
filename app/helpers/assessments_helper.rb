module AssessmentsHelper
  def attempts_text(attempts)
    attempts.map do |attempt|
      link_to attempt_text(attempt), [@group, attempt.assessor]
    end.join('; ')
  end

  def attempt_text(attempt)
    "L #{ attempt.mark }"
  end

  def score_text(assessment)
    assessment.mark.to_i == 0 ? 'n/a' : assessment.mark
  end

  def previous_attempts(assessment)
    attempts_text(assessment.previous_attempts_at_indicator)
  end
end
