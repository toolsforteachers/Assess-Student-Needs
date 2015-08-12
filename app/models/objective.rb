class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :indicator

  validates :indicator_id, presence: :true
  validates :stream, length: { maximum: 15 }, presence: true

  default_scope { order('stream') }

  def objective
    indicator.name
  end

  def level
    indicator_ancestry.where(type: 'Indicators::Level').first.try(:name)
  end

  def topic
    s = indicator_ancestry.where(type: 'Indicators::Topic').first.try(:name)
    strand ? "#{ s } - #{ strand }" : s
  end

  protected

  def indicator_ancestry
    @indicator_ancestry ||= indicator.ancestors
  end

  def strand
    indicator_ancestry.where(type: 'Indicators::Strand').first.try(:name)
  end
end
