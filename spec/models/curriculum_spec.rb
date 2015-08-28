require 'spec_helper'

RSpec.describe Indicators::Curriculum, type: :model do
  it { should have_many(:subjects) }
  it { should validate_uniqueness_of(:name).scoped_to(:created_by_id) }
end
