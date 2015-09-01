require 'spec_helper'

RSpec.describe Indicators::Subject do
  it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }

  context 'descendant attributes' do
    let(:i_subject) { Fabricate(:indicators_subject, name: 'Doing some maths') }
    let(:level_1) { Fabricate(:indicators_level, name: 'Year 1', parent: i_subject) }
    let(:level_2) { Fabricate(:indicators_level, name: 'Year 1', parent: i_subject) }

    it 'has 2 levels' do
      expect(i_subject.levels).to match([level_1, level_2])
    end
  end

   context '#friendly_type' do
    it do
      expect(Indicators::Subject.new.friendly_type).to eql('Subject')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Subject.new.allowable_child_types).to eql([:level])
    end
  end
end
