require 'spec_helper'

describe Indicator do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }

  it 'has notes attached (eg from GDS import'
  it 'fixes the imported fraction images'

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
      expect(Indicators::Subject.new.allowable_child_types).to eql([:level, :topic, :prompt, :objective])
    end

    it 'is friendly for levels' do
      expect(Indicators::Level.new.allowable_child_types).to eql([:topic, :prompt, :objective])
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
