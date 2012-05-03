require 'spec_helper'

describe GroupStudent do
  context 'validations' do
    let(:group) { Fabricate(:group) }
    let(:student) { Fabricate(:student) }
    subject { described_class.create(student: student, group: group) }

    context 'on create' do
      it { should be_valid }
    end

    context 'when it already exists' do
      before { described_class.create(student: student, group: group) }
      it { should_not be_valid }
    end
  end
end
