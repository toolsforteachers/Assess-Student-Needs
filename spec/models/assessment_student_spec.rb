require 'spec_helper'

describe AssessmentStudent do
  it { should belong_to(:assessment) }
  it { should belong_to(:student) }

  describe '.lesson?' do
    let(:assessment_student) { Fabricate(:assessment_student, assessment: assessment) }
    subject { assessment_student.lesson? }

    context 'true' do
      let(:assessment) { Fabricate(:lesson) }
      it { should be true }
    end

    context 'false' do
      let(:assessment) { Fabricate(:teacher_judgement) }
      it { should be false }
    end
  end
end
