require 'spec_helper'

describe Assessment do
  it { should belong_to(:indicator) }
  it { should belong_to(:student) }
  it { should belong_to(:assessor) }

  describe '#alt_streams?' do
    let(:lesson) { Fabricate(:lesson) }
    let(:assessment) { Fabricate(:assessment, assessor: lesson) }

    before do
      allow(lesson).to receive(:multiple_objectives?) { has_multiple }
    end

    subject { assessment.alt_streams? }

    context 'when the assessor has multiple objectives' do
      let(:has_multiple) { true }

      it 'should be true' do
        expect(subject).to be_truthy
      end
    end

    context 'when the assessor does not have multiple objectives' do
      let(:has_multiple) { false }

      it 'should be false' do
        expect(subject).to be_falsy
      end
    end
  end

  describe '#stream' do
    let(:indicator) { Fabricate(:indicators_objective)  }
    let(:lesson) do
      Fabricate(:lesson, objectives:
          [
            Fabricate(:objective, stream: 'Stream 1', indicator: indicator),
            Fabricate(:objective, stream: 'Stream 2')]
        )
    end

    let(:assessment) do
      Fabricate(:assessment, assessor: lesson, indicator: indicator)
    end

    subject { assessment.stream }

    context 'when there is a lesson with an objective' do
      it do
        expect(subject).to eql('Stream 1')
      end
    end
    context 'when the assessment has not been saved' do
      before { expect(assessment).to receive(:persisted?) { false } }

      it 'is null' do
        expect(subject).to be_nil
      end
    end

    context 'when there are no alt_streams' do
      before { expect(assessment).to receive(:alt_streams?) { false } }
    end
  end

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
end
