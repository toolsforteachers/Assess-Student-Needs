require 'spec_helper'

describe Group do
  it { should have_many(:students) }
  it { should have_many(:group_students) }
  it { should have_many(:assessments) }
  it { should have_many(:lessons) }
  it { should have_many(:teacher_judgements) }
  it { should validate_presence_of(:teacher_id) }
  it { should validate_uniqueness_of(:name).scoped_to(:teacher_id) }

  it 'tests that friendly_id appends the teacher last name'
end
