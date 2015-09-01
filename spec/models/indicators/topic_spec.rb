require 'spec_helper'

RSpec.describe Indicators::Topic do
   context '#friendly_type' do
    it do
      expect(Indicators::Topic.new.friendly_type).to eql('Topic')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Topic.new.allowable_child_types).to eql([:prompt, :objective])
    end
  end
end
