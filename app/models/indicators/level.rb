class Indicators::Level < Indicator
  validates :parent_id, presence: true
  has_many :topics, class_name: 'Indicators::Topic', foreign_key: :parent_id

  def allowable_child_types
    [:topic]
  end
end
