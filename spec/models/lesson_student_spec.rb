require 'spec_helper'

describe LessonStudent do
  it { should belong_to(:lesson) }
  it { should belong_to(:student) }

  describe '.ticks' do
    let(:lesson_student) { Fabricate(:lesson_student, score: score) }
    subject { lesson_student.ticks }

    context 'without a score' do
      let(:score) { nil }
      it { should eql(0) }
    end

    context 'with a score' do
      let(:score) { 3 }
      it { should eql(2) }
    end
  end
end
