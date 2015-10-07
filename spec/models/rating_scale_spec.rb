require 'spec_helper'

RSpec.describe RatingScale, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:max_score) }
end
