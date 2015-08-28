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

    describe '.find_indicator' do
      it 'returns the indicator' do
        expect(CurriculumService.find_indicator(indicator.id)).to eql(indicator)
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

    describe '.can_edit_indicator?' do
      it 'returns true' do
        expect(CurriculumService.can_edit_indicator?(teacher, indicator)).to be_truthy
      end
    end
  end

  context 'for the given teacher' do
    let(:alt_teacher) { Fabricate(:teacher) }

    describe '.editable_by' do
      it 'returns all the curricula' do
        expect(CurriculumService.editable_by(alt_teacher)).to be_empty
      end
    end

    describe '.viewable_by' do
      it 'returns all the curricula' do
        expect(CurriculumService.viewable_by(alt_teacher)).to match([curriculum])
      end
    end

    describe '.can_edit_indicator?' do
      it 'returns true' do
        expect(CurriculumService.can_edit_indicator?(alt_teacher, indicator)).to be_falsey
      end
    end
  end
end
