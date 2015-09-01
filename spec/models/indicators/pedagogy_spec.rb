require 'spec_helper'

RSpec.describe Indicators::Pedagogy, type: :model do
  it { should have_many(:learning_attributes) }
  it { should validate_uniqueness_of(:name).scoped_to(:created_by_id) }
  it { should belong_to(:created_by) }
  it { should validate_presence_of(:created_by_id) }


  context '#friendly_type' do
    it do
      expect(Indicators::Pedagogy.new.friendly_type).to eql('Pedagogy')
    end
  end

  context '#allowable_child_types' do
    it do
      expect(Indicators::Pedagogy.new.allowable_child_types).to eql([:learning_attribute, :learning_skill])
    end
  end
end
