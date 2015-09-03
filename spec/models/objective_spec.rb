require 'spec_helper'

RSpec.describe Objective, type: :model do
  it { should belong_to(:indicator) }
  it { should belong_to(:lesson).touch(true) }
  it { should validate_presence_of(:indicator_id) }
  it { should validate_presence_of(:stream) }
  it { should validate_length_of(:stream).is_at_most(15) }
  it { should delegate_method(:level).to(:indicator) }
  it { should delegate_method(:topic).to(:indicator) }
  it { should delegate_method(:objective).to(:indicator) }
  it { should delegate_method(:pedagogy).to(:indicator) }
  it { should delegate_method(:learning_attribute).to(:indicator) }
  it { should delegate_method(:learning_skill).to(:indicator) }
end
