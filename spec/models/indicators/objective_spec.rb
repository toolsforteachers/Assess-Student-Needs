require 'spec_helper'

RSpec.describe Indicators::Objective do
  context 'ancestorial attributes' do
    let(:i_subject) { Fabricate(:indicators_subject, name: 'Doing some maths') }
    let(:level) { Fabricate(:indicators_level, name: 'Year 1', parent: i_subject) }
    let(:topic) { Fabricate(:indicators_topic, name: 'Number', parent: level) }
    let(:strand) { Fabricate(:indicators_strand, name: 'addition and subtraction', parent: topic) }
    let(:i_objective) { Fabricate(:indicators_objective, name: 'solve small problems', parent: strand) }

    it 'has an objective' do
      expect(i_objective.objective).to eql('solve small problems')
    end

    it 'has a topic' do
      expect(i_objective.topic).to eql('Number - addition and subtraction')
    end

    it 'has a level' do
      expect(i_objective.level).to eql('Year 1')
    end
  end
end
