class Teacher < ActiveRecord::Base
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :invitable

  has_many :groups
  has_many :lessons
  has_many :lesson_objectives, through: :lessons, source: :objectives

  has_many :curricula, class_name: 'Indicators::Curriculum', foreign_key: :created_by_id
  has_many :pedagogies, class_name: 'Indicators::Pedagogy', foreign_key: :created_by_id

  validates_presence_of :name

  def to_s
    name
  end
end
