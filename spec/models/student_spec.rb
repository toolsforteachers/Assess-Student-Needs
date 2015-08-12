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

    context 'with one score of 2/5 and one score of 4/4' do
      before do
        Fabricate(:assessment,
          mark: 2, out_of: 5, indicator: indicator, student: student)
        Fabricate(:assessment,
          mark: 4, out_of: 4, indicator: indicator, student: student)
      end

      it 'is 0.7' do
        expect(subject).to eq(0.7)
      end
    end
  end
end
