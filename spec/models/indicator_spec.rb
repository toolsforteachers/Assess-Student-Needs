require 'spec_helper'

describe Indicator do
  it { should validate_presence_of(:name) }
end
