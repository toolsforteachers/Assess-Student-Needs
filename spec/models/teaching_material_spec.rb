require 'spec_helper'

RSpec.describe TeachingMaterial, type: :model do
  it { should belong_to(:assessor) }
end
