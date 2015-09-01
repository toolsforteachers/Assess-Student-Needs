require 'spec_helper'

describe PedagogyService do
  let!(:teacher) { Fabricate(:teacher) }
  let!(:pedagogy) { Fabricate(:indicators_pedagogy, created_by: teacher) }
  let!(:indicator) { Fabricate(:indicators_topic, parent: pedagogy) }

  context 'for the given teacher' do
    describe '.editable_by' do
      it 'returns all the pedagogies' do
        expect(PedagogyService.editable_by(teacher)).to match([pedagogy])
      end
    end

    describe '.viewable_by' do
      it 'returns all the curricula' do
        expect(PedagogyService.viewable_by(teacher)).to match([pedagogy])
      end
    end
  end

  context 'for a different teacher' do
    let(:alt_teacher) { Fabricate(:teacher) }

    describe '.editable_by' do
      it 'returns no pedagogies' do
        expect(PedagogyService.editable_by(alt_teacher)).to be_empty
      end
    end

    describe '.viewable_by' do
      it 'returns all the pedagogies' do
        expect(PedagogyService.viewable_by(alt_teacher)).to match([pedagogy])
      end
    end
  end
end
