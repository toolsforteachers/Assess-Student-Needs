class Indicators::Level < Indicator
  validates :parent_id, presence: true

  def allowable_child_types
    [:topic]
  end
end
