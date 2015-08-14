require 'spec_helper'

describe Assessment do
  it { should belong_to(:indicator) }
  it { should belong_to(:student) }
  it { should belong_to(:assessor) }
  it { should delegate_method(:level).to(:indicator) }
  it { should delegate_method(:topic).to(:indicator) }
  it { should delegate_method(:objective).to(:indicator) }
  it { should delegate_method(:assessed_at).to(:assessor) }
  it { should delegate_method(:assessed_by).to(:assessor) }

  describe '#attempts_at' do
    let!(:student) { Fabricate(:student) }
    let!(:indicator) { Fabricate(:indicators_objective) }

    before do
      @assessment = Fabricate(:assessment,
        indicator: indicator,
        student: student)
    end

    subject { @assessment.attempts_at(indicator) }

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

  context '#score' do
    let(:assessment) { Fabricate(:assessment, mark: mark, out_of: out_of)}
    subject { assessment.score }

    context 'with 7 out of 8' do
      let(:mark) { 7 }
      let(:out_of) { 8 }

      it { expect(subject).to eq(0.875) }
    end

    context 'with 0 out of 5' do
      let(:mark) { 0 }
      let(:out_of) { 5 }

      it { expect(subject).to eq(0) }
    end

    context 'with 6 out of 6' do
      let(:mark) { 6 }
      let(:out_of) { 6 }

      it { expect(subject).to eq(1) }
    end
  end
end
