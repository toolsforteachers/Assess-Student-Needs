require 'spec_helper'

RSpec.describe Objective, type: :model do
  it { should belong_to(:indicator) }
  it { should belong_to(:lesson) }
  it { should validate_presence_of(:indicator_id) }
end
