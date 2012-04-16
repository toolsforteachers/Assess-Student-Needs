require 'spec_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it 'validates unikeness of student in group'
end
