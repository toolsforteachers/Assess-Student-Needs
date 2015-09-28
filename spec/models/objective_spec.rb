require 'spec_helper'

RSpec.describe Objective, type: :model do
  it { should belong_to(:indicator) }
  it { should belong_to(:lesson).touch(true) }
  it { should validate_presence_of(:indicator_id) }
  it { should delegate_method(:level).to(:indicator) }
  it { should delegate_method(:topic).to(:indicator) }
  it { should delegate_method(:objective).to(:indicator) }
  it { should delegate_method(:pedagogy).to(:indicator) }
  it { should delegate_method(:learning_attribute).to(:indicator) }
  it { should delegate_method(:learning_skill).to(:indicator) }

  describe '#type_of' do
    let(:indicator) { Fabricate(:indicators_objective) }
    let(:objective) { Fabricate(:objective, indicator: indicator) }

    subject { objective.type_of }

    context 'with a pedagogical objective' do
      before do
        allow(indicator).to receive(:pedagogy).once.and_return('Foo bar pedagogy')
      end

      it { expect(subject).to eql('Pedagogy objective') }
    end

    context 'with a curriculum objective' do
      before do
        allow(indicator).to receive(:curriculum).once.and_return('NC 2015')
      end

      it { expect(subject).to eql('Curriculum objective') }
    end
  end

  describe '#heading' do
    let(:indicator) { Fabricate(:indicators_objective) }
    let(:objective) { Fabricate(:objective, indicator: indicator) }

    subject { objective.heading }

    context 'with a pedagogical objective' do
      before do
        allow(indicator).to receive(:pedagogy).once.and_return('Foo bar pedagogy')
        expect(indicator).to receive(:learning_skill).once
      end

      it { subject }
    end

    context 'with a curriculum objective' do
      before do
        allow(indicator).to receive(:curriculum).once.and_return('NC 2015')
        expect(indicator).to receive(:subject).once
      end

      it { subject }
    end
  end
end
