require 'spec_helper'

describe Lesson do
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:group_id) }
  it { should have_many(:objectives) }
end
