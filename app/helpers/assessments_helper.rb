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

  def stream_picker_label(assessment, objective)
    attempts = assessment.attempts_at(objective.indicator)
    s = attempts_text(attempts)
    return objective.stream if s.blank?
    "#{ objective.stream } (Previous attempts: #{ s })"
  end

  def previous_attempts(assessment,label=false)
    attempts = []
    assessment.assessor.indicators.each do |indicator|
      attempts << assessment.attempts_at(indicator)
    end
    s = attempts_text(attempts.flatten)
    if label
        "#{ label }: #{ s }" unless s.blank?
    else
      s
    end
  end
end
