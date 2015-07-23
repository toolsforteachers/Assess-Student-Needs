require 'spec_helper'

describe Lesson do
  it { should belong_to(:group) }
  it { should validate_presence_of(:lesson_date) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:group_id) }
  it { should have_many(:objectives) }
  it { should delegate_method(:students).to(:group) }
end
