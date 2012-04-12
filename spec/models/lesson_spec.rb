require 'spec_helper'

describe Lesson do
  it { should belong_to(:group) }
  it { should belong_to(:teacher) }
  it { should validate_presence_of(:teacher) }
end
