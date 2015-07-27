class Indicators::Subject < Indicator
  validates :name, uniqueness: true
end
