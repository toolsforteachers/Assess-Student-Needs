module AssessmentsHelper
  def attempts_text(attempts)
    return if attempts.empty?
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

  def previous_attempts(assessment,label=false)
    s = attempts_text(assessment.attempts_at(assessment))
    if label
        "#{ label }: #{ s }" unless s.blank?
    else
      s
    end
  end
end
