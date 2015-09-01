require 'spec_helper'

RSpec.describe Indicators::Objective do
  context '#friendly_type' do
    it do
      expect(Indicators::Objective.new.friendly_type).to eql('Objective')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Objective.new.allowable_child_types).to eql([])
    end
  end
end
