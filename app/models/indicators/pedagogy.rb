class Indicators::Pedagogy < Indicator
  has_many :learning_attributes, -> { order (:name) }, class_name: 'Indicators::LearningAttribute', foreign_key: :parent_id
  has_many :learning_skills, -> { order (:name) }, class_name: 'Indicators::LearningSkill', foreign_key: :parent_id

  validates :name, uniqueness: { scope: :created_by_id }

  belongs_to :created_by, class_name: 'Teacher'
  validates :created_by_id, presence: :true

  def allowable_child_types
    [:learning_attribute, :learning_skill]
  end
end
