require 'spec_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:group_id) }
  it { should validate_numericality_of(:prior_knowledge_level) }
  it { should have_many(:assessments) }
  it { should belong_to(:group) }

  it 'should test the indicator_* methods'

  context '.current_level' do
    before do
      @student = Fabricate(:student)
      @group = Fabricate(:group)
      @group.students << @student
    end

    context 'without assessments' do
      it { expect(@student.current_level).to eql(1) }
    end

    context 'with a prior_knowledge_level of 3 and a level one assessment' do
      before do
        Fabricate(:level_1_assessment, group: @group)
        @student.update_attribute(:prior_knowledge_level, 3)
      end

      it { expect(@student.current_level).to eql(4) }
    end

    context 'with a prior_knowledge_level of 1 and a level three assessment' do
      before do
        Fabricate(:level_3_assessment, group: @group)
        @student.update_attribute(:prior_knowledge_level, 1)
      end

      it { expect(@student.current_level).to eql(3) }
    end

    context 'with a level one assessment' do
      before { Fabricate(:level_1_assessment, group: @group) }
      it { expect(@student.current_level).to eql(1) }
    end

    context 'with a level three assessment' do
      before { Fabricate(:level_3_assessment, group: @group) }
      it { expect(@student.current_level).to eql(3) }
    end

    context 'with a level one and a level three assessment' do
      before do
        Fabricate(:level_1_assessment, group: @group)
        Fabricate(:level_3_assessment, group: @group)
      end
      it { expect(@student.current_level).to eql(3) }
    end
  end
end
