require 'spec_helper'

RSpec.describe Indicators::Level do
   context '#friendly_type' do
    it do
      expect(Indicators::Level.new.friendly_type).to eql('Level')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Level.new.allowable_child_types).to eql([:topic])
    end
  end
end
