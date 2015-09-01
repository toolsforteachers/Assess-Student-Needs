require 'spec_helper'

describe Indicator do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }

  it 'has notes attached (eg from GDS import'
  it 'fixes the imported fraction images'

  context 'prevent changing parent' do
    let!(:orig_parent) { Fabricate(:indicators_subject) }
    let!(:new_parent) { Fabricate(:indicators_subject) }
    let!(:child) { Fabricate(:indicators_level, parent: orig_parent) }

    it 'prevents changing the parent' do
      child.update_attributes parent: new_parent
      expect(child.errors.messages.keys).to include(:parent)
    end
  end

  describe '#deletable?' do
    let(:indicator) { Fabricate(:indicators_subject) }

    context 'by default' do
      it 'can be deleted' do
        expect(indicator).to be_deletable
      end
    end

    context 'when it has children' do
      before do
        Fabricate(:indicators_level, parent: indicator)
        indicator.reload
      end

      it 'can not be deleted' do
        expect(indicator).not_to be_deletable
      end
    end

    context 'when it has been used as a lesson objective' do
      before do
        Fabricate(:objective, indicator: indicator)
      end

      it 'can not be deleted' do
        expect(indicator).not_to be_deletable
      end
    end

    context 'when it has been assessed' do
      before do
        Fabricate(:assessment, indicator: indicator)
      end

      it 'can not be deleted' do
        expect(indicator).not_to be_deletable
      end
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicator.new.allowable_child_types).to eql([])
    end
  end

  describe '#destroy' do
    let(:indicator) { Fabricate(:indicators_subject) }
    let(:indicator_id) { indicator.id }

    context 'when it is deletable' do
      it 'gets deleted' do
        indicator.destroy
        expect(Indicator.find_by(slug: indicator_id)).to be_nil
      end
    end

    context 'when it is not deletable' do
      before { allow(indicator).to receive(:deletable?) { false } }

      it 'is not deleted' do
        expect{ indicator.destroy }.to raise_error("Undeletable")
      end
    end
  end

  context 'ancestorial attributes' do
    context 'of a curriculum' do
      let(:curriculum) { Fabricate(:indicators_curriculum) }
      let(:i_subject) { Fabricate(:indicators_subject, name: 'Doing some maths', parent: curriculum) }
      let(:level) { Fabricate(:indicators_level, name: 'Year 1', parent: i_subject) }
      let(:topic) { Fabricate(:indicators_topic, name: 'Number', parent: level) }
      let(:i_objective) { Fabricate(:indicators_objective, name: 'solve small problems', parent: topic) }

      it 'has an objective' do
        expect(i_objective.objective.to_s).to eql('solve small problems')
      end

      it 'has a topic' do
        expect(i_objective.topic.to_s).to eql('Number')
      end

      it 'has a level' do
        expect(i_objective.level.to_s).to eql('Year 1')
      end

      it 'has a curriculum' do
        expect(i_objective.curriculum).to eql(curriculum)
      end
    end

    context 'of a pedagogy' do
      let(:pedagogy) { Fabricate(:indicators_pedagogy) }
      let(:learning_attribute) { Fabricate(:indicators_learning_attribute, name: 'Resilience', parent: pedagogy) }
      let(:learning_skill) { Fabricate(:indicators_learning_skill, name: 'I do stuff', parent: learning_attribute) }
      let(:i_objective) { Fabricate(:indicators_objective, name: 'learn to solve small problems', parent: learning_skill) }

      it 'has an objective' do
        expect(i_objective.objective.to_s).to eql('learn to solve small problems')
      end

      it 'has a learning attribute' do
        expect(i_objective.learning_attribute.to_s).to eql('Resilience')
      end

      it 'has a learning skill' do
        expect(i_objective.learning_skill.to_s).to eql('I do stuff')
      end

      it 'has a curriculum' do
        expect(i_objective.pedagogy).to eql(pedagogy)
      end
     end
  end
end
