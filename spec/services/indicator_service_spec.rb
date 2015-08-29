require 'spec_helper'

describe IndicatorService do
  let!(:teacher) { Fabricate(:teacher) }
  let!(:indicator) { Fabricate(:indicators_subject, parent: curriculum) }

  context 'for the given teacher' do
    describe '.can_edit_indicator?' do
      it 'is true' do
        expect(IndicatorService.can_edit_indicator?(teacher, indicator)).to be_truthy
      end
    end
  end

  context 'for the given teacher' do
    let(:alt_teacher) { Fabricate(:teacher) }
    describe '.can_edit_indicator?' do
      it 'is false' do
        expect(IndicatorService.can_edit_indicator?(alt_teacher, indicator)).to be_falsey
      end
    end
  end
end
