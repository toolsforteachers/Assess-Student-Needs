class Indicators::Curriculum < Indicator
  has_many :subjects, -> { order (:name) }, class_name: 'Indicators::Subject', foreign_key: :parent_id

  validates :name, uniqueness: { scope: :created_by_id }

  belongs_to :created_by, class_name: 'Teacher'
  validates :created_by_id, presence: :true

  def allowable_child_types
    [:subject]
  end
end
