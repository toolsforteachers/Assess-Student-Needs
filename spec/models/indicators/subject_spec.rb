require 'spec_helper'

RSpec.describe Indicators::Subject do
  it { should validate_uniqueness_of(:name) }
end
