require 'spec_helper'

RSpec.describe Indicators::Topic do
  describe '#topics' do
    let(:topic) { Fabricate(:indicators_topic) }
    it { expect(topic.topics).to eql([topic])}
  end
end
