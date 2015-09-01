require 'spec_helper'

RSpec.describe Indicators::LearningAttribute do
   context '#friendly_type' do
    it do
      expect(Indicators::LearningAttribute.new.friendly_type).to eql('Learning attribute')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::LearningAttribute.new.allowable_child_types).to eql([:learning_skill])
    end
  end
end
