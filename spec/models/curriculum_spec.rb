require 'spec_helper'

RSpec.describe Curriculum, type: :model do
  it { should have_many(:subjects) }
end
