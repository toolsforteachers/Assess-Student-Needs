require 'spec_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:group_id) }
  it { should have_many(:assessments) }
  it { should belong_to(:group) }

  it 'should test the indicator_* methods'
end
