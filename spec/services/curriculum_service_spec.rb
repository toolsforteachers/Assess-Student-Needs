require 'spec_helper'

describe CurriculumService do
  let!(:teacher) { Fabricate(:teacher) }
  let!(:curriculum) { Fabricate(:indicators_curriculum, created_by: teacher) }
  let!(:indicator) { Fabricate(:indicators_subject, parent: curriculum) }

  context 'in general' do
    describe '.primary' do
      it 'returns the primary curriculum' do
        expect(CurriculumService.primary).to eql(curriculum)
      end
    end
  end

  context 'for the given teacher' do
    describe '.editable_by' do
      it 'returns all the curricula' do
        expect(CurriculumService.editable_by(teacher)).to match([curriculum])
      end
    end

    describe '.viewable_by' do
      it 'returns all the curricula' do
        expect(CurriculumService.viewable_by(teacher)).to match([curriculum])
      end
    end
  end

  context 'for a different teacher' do
    let(:alt_teacher) { Fabricate(:teacher) }

    describe '.editable_by' do
      it 'returns no curricula' do
        expect(CurriculumService.editable_by(alt_teacher)).to be_empty
      end
    end

    describe '.viewable_by' do
      it 'returns the primary curriculum' do
        expect(CurriculumService.viewable_by(alt_teacher)).to match([curriculum])
      end
    end
  end

  context 'without a teacher' do
    describe '.viewable_by' do
      it 'returns the primary curriculum' do
        expect(CurriculumService.viewable_by(nil)).to match([curriculum])
      end
    end
  end

  context 'with no curricula' do
    before { Indicator.delete_all }
    describe '.viewable_by' do
      it 'returns an empty array when there is no curricula' do
        expect(CurriculumService.viewable_by(teacher)).to eql([])
      end
    end
  end
end
