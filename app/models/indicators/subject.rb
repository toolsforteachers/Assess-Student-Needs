class Indicators::Subject < Indicator
  belongs_to :curriculum

  validates :name, uniqueness: { scope: :curriculum_id }
  validates :curriculum_id, presence: true

  default_scope { order('name') }

  has_many :levels, -> { order (:name) }, class_name: 'Indicators::Level', foreign_key: :parent_id

  def allowable_child_types
    [:level, :topic]
  end
end
