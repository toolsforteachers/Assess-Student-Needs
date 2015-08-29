class Indicators::Pedagogy < Indicator
  has_many :topics, -> { order (:name) }, class_name: 'Indicators::Topic', foreign_key: :parent_id

  validates :name, uniqueness: { scope: :created_by_id }

  belongs_to :created_by, class_name: 'Teacher'
  validates :created_by_id, presence: :true

  def allowable_child_types
    [:topic]
  end
end
