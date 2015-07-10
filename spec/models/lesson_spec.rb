require 'spec_helper'

describe Lesson do
  it { should belong_to(:group) }
  it { should belong_to(:teacher) }
  it { should belong_to(:indicator) }
  it { should validate_presence_of(:teacher) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:group_id) }
  it { should validate_presence_of(:indicator_id) }
  it { should have_many(:assessment_students) }
  it { should respond_to(:level) }
  it { should respond_to(:key) }

  describe '#create' do
    subject { Fabricate(:lesson, group: group) }
    let(:group) { Fabricate(:group, students: [Fabricate(:student), Fabricate(:student)] ) }

    it 'when there is a group of students' do
      expect(subject.assessment_students.length).to eql(2)
    end
  end
end
