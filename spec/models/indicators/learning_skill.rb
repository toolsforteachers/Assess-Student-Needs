require 'spec_helper'

RSpec.describe Indicators::LearningSkill do
   context '#friendly_type' do
    it do
      expect(Indicators::LearningSkill.new.friendly_type).to eql('Learning skill')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::LearningSkill.new.allowable_child_types).to eql([:objective])
    end
  end
end
