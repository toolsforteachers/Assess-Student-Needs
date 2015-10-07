require 'spec_helper'

RSpec.describe RatingScale, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:max_score) }

  let(:rating_scale) { Fabricate(:rating_scale) }

  describe '#key' do
    it { expect(rating_scale.key).to eql(rating_scale.to_param) }
  end
end
