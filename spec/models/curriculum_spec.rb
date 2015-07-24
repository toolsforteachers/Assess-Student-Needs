require 'spec_helper'

RSpec.describe Curriculum, type: :model do
  it { should validate_presence_of(:name) }
end
