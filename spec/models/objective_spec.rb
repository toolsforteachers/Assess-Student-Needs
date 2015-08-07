require 'spec_helper'

RSpec.describe Objective, type: :model do
  it { should belong_to(:indicator) }
  it { should belong_to(:lesson) }
  it { should validate_presence_of(:indicator_id) }
  it { should validate_presence_of(:stream) }
  it { should validate_length_of(:stream).is_at_most(15) }

  context 'indicator attributes' do
    let(:i_subject) { Fabricate(:indicators_subject, name: 'Maths') }
    let(:level) { Fabricate(:indicators_level, name: 'Year 1', parent: i_subject) }
    let(:topic) { Fabricate(:indicators_topic, name: 'Number', parent: level) }
    let(:strand) { Fabricate(:indicators_strand, name: 'addition and subtraction', parent: topic) }
    let(:i_objective) { Fabricate(:indicators_objective, name: 'solve small problems', parent: strand) }

    let(:objective) { Fabricate(:objective, indicator: i_objective) }

    it 'has an objective' do
      expect(objective.objective).to eql('solve small problems')
    end

    it 'has a topic' do
      expect(objective.topic).to eql('Number - addition and subtraction')
    end

    it 'has a level' do
      expect(objective.level).to eql('Year 1')
    end
  end
end
