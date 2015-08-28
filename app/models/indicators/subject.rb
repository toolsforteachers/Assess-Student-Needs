class Indicators::Subject < Indicator
  validates :parent_id, presence: true
  validates :name, uniqueness: { scope: :parent_id }

  default_scope { order('name') }

  has_many :levels, -> { order (:name) }, class_name: 'Indicators::Level', foreign_key: :parent_id

  def allowable_child_types
    [:level]
  end
end
