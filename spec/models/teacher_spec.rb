require 'spec_helper'

describe Teacher do
  it { should validate_presence_of(:name) }
  it { should have_many(:groups) }
  it { should have_many(:lessons) }
end
