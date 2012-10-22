require 'spec_helper'

describe Indicator do
  it { should validate_numericality_of(:level) }
  it { should validate_presence_of(:name) }

  context '.strand_name' do
    let(:indicator) { Fabricate(:indicator, :key => key) }
    subject { indicator.strand_name }

    context 'MA2_NUMBERS' do
      let(:key) { 'MA2_NUMBERS' }
      it { should eql("Numbers > Numbers and the number system")}
    end

    context 'MA2A_MENTAL_METHODS' do
      let(:key) { 'MA2A_MENTAL_METHODS' }
      it { should eql("Calculating - Knowing and using number facts > Mental methods")}
    end
  end
end
