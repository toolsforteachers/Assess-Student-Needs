require 'spec_helper'

RSpec.describe Indicators::Curriculum, type: :model do
  it { should have_many(:subjects) }
  it { should validate_uniqueness_of(:name).scoped_to(:created_by_id) }
  it { should belong_to(:created_by) }
  it { should validate_presence_of(:created_by_id) }

  context '#friendly_type' do
    it do
      expect(Indicators::Curriculum.new.friendly_type).to eql('Curriculum')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Curriculum.new.allowable_child_types).to eql([:subject])
    end
  end
end
