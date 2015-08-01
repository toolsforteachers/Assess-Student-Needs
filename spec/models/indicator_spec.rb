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
    let(:indicator) { Fabricate(:indicator, type: 'Indicators::Subject') }

    context 'by default' do
      it 'can be deleted' do
        expect(indicator).to be_deletable
      end
    end

    context 'when it has children' do
      before do
        Fabricate(:indicator, type: 'Indicators::Level', parent: indicator)
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

  describe '#destroy' do
    let(:indicator) { Fabricate(:indicator, type: 'Indicators::Subject') }
    let(:indicator_id) { indicator.id }

    context 'when it is deletable' do
      it 'gets deleted' do
        indicator.destroy
        expect(Indicator.find_by(id: indicator_id)).to be_nil
      end
    end

    context 'when it is not deletable' do
      before { allow(indicator).to receive(:deletable?) { false } }

      it 'is not deleted' do
        expect{ indicator.destroy }.to raise_error
      end
    end
  end

  context '#friendly_type' do
    it 'is friendly for indicators' do
      expect(Indicator.new.friendly_type).to eql('Indicator')
    end

    it 'is friendly for subjects' do
      expect(Indicators::Subject.new.friendly_type).to eql('Subject')
    end

    it 'is friendly for levels' do
      expect(Indicators::Level.new.friendly_type).to eql('Level')
    end

    it 'is friendly for topics' do
      expect(Indicators::Topic.new.friendly_type).to eql('Topic')
    end

    it 'is friendly for strands' do
      expect(Indicators::Strand.new.friendly_type).to eql('Strand')
    end

    it 'is friendly for prompts' do
      expect(Indicators::Prompt.new.friendly_type).to eql('Prompt')
    end

    it 'is friendly for objectives' do
      expect(Indicators::Objective.new.friendly_type).to eql('Objective')
    end
  end

  context '#allowable_child_types' do
    it 'for indicators' do
      expect(Indicator.new.allowable_child_types).to eql([])
    end

    it 'is friendly for subjects' do
      expect(Indicators::Subject.new.allowable_child_types).to eql([:level, :topic])
    end

    it 'is friendly for levels' do
      expect(Indicators::Level.new.allowable_child_types).to eql([:topic])
    end

    it 'is friendly for topics' do
      expect(Indicators::Topic.new.allowable_child_types).to eql([:strand, :prompt, :objective])
    end

    it 'is friendly for strands' do
      expect(Indicators::Strand.new.allowable_child_types).to eql([:prompt, :objective])
    end

    it 'is friendly for prompts' do
      expect(Indicators::Prompt.new.allowable_child_types).to eql([:prompt, :objective])
    end

    it 'is friendly for objectives' do
      expect(Indicators::Objective.new.allowable_child_types).to eql([])
    end
  end
end
