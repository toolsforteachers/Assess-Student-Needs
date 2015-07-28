class Indicators::Subject < Indicator
  validates :name, uniqueness: true

  default_scope { order('name') }
end
