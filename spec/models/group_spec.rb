require 'spec_helper'

describe Group do
  it { should have_many(:students) }
  it { should have_many(:lessons) }
  it { should validate_presence_of(:teacher_id) }
  it { should validate_uniqueness_of(:name).scoped_to(:teacher_id) }

  it 'tests that friendly_id appends the teacher last name'

  describe '#to_s' do
    let(:group) { Fabricate(:group, name: 'Year 8') }
    it { expect(group.to_s).to eql('Year 8') }
  end
end
