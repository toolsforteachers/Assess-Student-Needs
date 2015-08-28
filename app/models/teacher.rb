class Teacher < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :invitable

  has_many :groups
  has_many :lessons
  has_many :curricula, class_name: 'Indicators::Curriculum', foreign_key: :created_by_id

  validates_presence_of :name

  def to_s
    name
  end
end
