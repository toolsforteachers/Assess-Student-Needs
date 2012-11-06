require 'spec_helper'

describe Group do
  it { should have_many(:students) }
  it { should have_many(:group_students) }
  it { should have_many(:assessments) }
  it { should have_many(:lessons) }
  it { should have_many(:teacher_judgements) }
end