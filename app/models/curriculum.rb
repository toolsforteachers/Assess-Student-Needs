class Curriculum < ActiveRecord::Base
  has_many :subjects, class_name: 'Indicators::Subject'
end
