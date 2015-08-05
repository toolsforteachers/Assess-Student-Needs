require 'spec_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:group_id) }
  it { should have_many(:assessments) }
  it { should belong_to(:group) }

  describe '#average_score_for' do
    let(:student) { Fabricate(:student) }
    let(:indicator) { Fabricate(:indicators_objective) }

    subject { student.average_score_for(indicator) }

    context 'with no score' do
      it 'is 0' do
        expect(subject).to eql(0)
      end
    end

    context 'with one score of 2 and one score of 5' do
      before do
        Fabricate(:assessment, score: 2, indicator: indicator, student: student)
        Fabricate(:assessment, score: 5, indicator: indicator, student: student)
      end

      it 'is 3' do
        expect(subject).to eql(3)
      end
    end
  end
end
