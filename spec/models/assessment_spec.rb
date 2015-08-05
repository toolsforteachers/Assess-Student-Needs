require 'spec_helper'

describe Assessment do
  it { should belong_to(:indicator) }
  it { should belong_to(:student) }
  it { should belong_to(:assessor) }

  describe '#previous_attempts_by' do
    let!(:student) { Fabricate(:student) }
    let!(:indicator) { Fabricate(:indicators_objective) }

    before do
      @assessment = Fabricate(:assessment,
        indicator: indicator,
        student: student)
    end

    subject { @assessment.previous_attempts_by(student, [indicator]) }

    context 'with an assessment' do
      it 'should be empty' do
        expect(subject).to be_empty
      end
    end

    context 'when we have 2 more previous assessments' do
      before do
        2.times do
          Fabricate(:assessment, indicator: indicator, student: student)
        end
      end

      it 'should return 2 assessments' do
        expect(subject.length).to eql(2)
      end
    end
  end
end
