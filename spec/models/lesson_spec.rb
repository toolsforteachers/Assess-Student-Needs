require 'spec_helper'

describe Lesson do
  it { should belong_to(:group) }
  it { should belong_to(:teacher) }
  it { should validate_presence_of(:lesson_date) }
  it { should validate_presence_of(:group_id) }
  it { should have_many(:objectives) }
  it { should have_many(:indicators) }
  it { should delegate_method(:students).to(:group) }
  it { should respond_to(:subject_id) }
end
