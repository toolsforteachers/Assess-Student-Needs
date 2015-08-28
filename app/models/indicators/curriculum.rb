class Indicators::Curriculum < Indicator
  has_many :subjects, -> { order (:name) }, class_name: 'Indicators::Subject', foreign_key: :parent_id

  validates :name, uniqueness: { scope: :created_by_id }

  def allowable_child_types
    [:subject]
  end
end
