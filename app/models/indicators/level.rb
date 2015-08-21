class Indicators::Level < Indicator
  validates :parent_id, presence: true

  def topics
    @topics ||= descendants.where(type: 'Indicators::Topic')
  end

  def allowable_child_types
    [:topic]
  end
end
