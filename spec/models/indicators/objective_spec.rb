require 'spec_helper'

RSpec.describe Indicators::Subject do
  describe '#set_cached_ancestry_name' do

    before do
      maths = Fabricate(:indicators_subject, name: 'Maths')
      level = Fabricate(:indicators_level, name: 'Year 1', parent: maths)
      topic = Fabricate(:indicators_topic, name: 'Number', parent: level)
      strand = Fabricate(:indicators_strand, name: 'Adding and subtracting', parent: topic)
      prompt = Fabricate(:indicators_prompt, name: 'Pupils should', parent: strand)
      Fabricate(:indicators_objective, name: 'Count to 10', parent: prompt)
    end

    context 'by default' do
      it 'sets cached_ancestry_name for the objective' do
        expect(Indicators::Objective.last.cached_ancestry_name).to eql(
          "Maths :: Year 1 :: Number :: Adding and subtracting :: Count to 10")
      end

      context 'changing the name of a parent' do
        before { Indicators::Topic.last.update_attributes!(name: 'Geometry') }

        it 'updates cached_ancestry_name' do
          expect(Indicators::Objective.last.cached_ancestry_name).to eql(
            "Maths :: Year 1 :: Geometry :: Adding and subtracting :: Count to 10")
        end
      end
    end
  end
end
