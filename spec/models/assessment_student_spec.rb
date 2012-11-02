require 'spec_helper'

describe AssessmentStudent do
  it { should belong_to(:assessment) }
  it { should belong_to(:student) }

  describe '.ticks' do
    let(:assessment_student) { Fabricate(:assessment_student, score: score) }
    subject { assessment_student.ticks }

    context 'without a score' do
      let(:score) { nil }
      it { should eql(0) }
    end

    context 'with a score' do
      let(:score) { 3 }
      it { should eql(2) }
    end
  end
end
