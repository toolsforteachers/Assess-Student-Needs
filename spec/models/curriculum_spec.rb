require 'spec_helper'

RSpec.describe Curriculum, type: :model do
  it { should have_many(:subjects) }
  it { should validate_uniqueness_of(:name) }
end
