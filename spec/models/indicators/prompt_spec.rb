require 'spec_helper'

RSpec.describe Indicators::Prompt do
   context '#friendly_type' do
    it do
      expect(Indicators::Prompt.new.friendly_type).to eql('Prompt')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Prompt.new.allowable_child_types).to eql([:prompt, :objective])
    end
  end
end
