class Teacher < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :invitable

  has_many :groups
  has_many :lessons
  validates_presence_of :name

  def to_s
    name
  end
end
