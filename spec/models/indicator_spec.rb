require 'spec_helper'

describe Indicator do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }

  it 'has notes attached (eg from GDS import'
  it 'fixes the imported fraction images'
end
