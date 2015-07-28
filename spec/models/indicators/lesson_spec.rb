require 'spec_helper'

RSpec.describe Indicators::Level do
  it { should validate_presence_of(:parent_id) }
end
