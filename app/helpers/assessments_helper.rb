module AssessmentsHelper
  def attempts_text(attempts)
    return if attempts.empty?
    attempts.map do |attempt|
      link_to attempt_text(attempt), [@group, attempt.assessor]
    end.join('; ')
  end

  def attempt_text(attempt)
    "L #{ attempt.score }"
  end

  def score_text(assessment)
    assessment.score.to_i == 0 ? 'n/a' : assessment.score
  end

  def stream_picker_label(assessment, objective)
    attempts = assessment.attempts_at(objective.indicator)
    s = attempts_text(attempts)
    return objective.stream if s.blank?
    "#{ objective.stream } (#{ s })"
  end

  def previous_attempts_label(assessment)
    attempts = assessment.attempts_at(assessment.indicator)
    s = attempts_text(attempts)
    "Previous attempts: #{ s }" unless s.blank?
  end
end
