require 'spec_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it { should have_many(:assessments) }
end
