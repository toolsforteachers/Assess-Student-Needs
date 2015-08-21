class Indicator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_closure_tree order: 'name', dependent: :destroy
  has_many :self_and_descendants, through: :descendant_hierarchies, source: :descendant
  has_many :self_and_ancestors, through: :ancestor_hierarchies, source: :ancestor

  validates :name, presence: :true
  validates :type, presence: :true
  validate :prevent_parental_update

  before_destroy :check_deletable

  def to_s
    name.capitalize
  end

  def friendly_type
    self.class.to_s.gsub('Indicators::', '')
  end

  def allowable_child_types
    []
  end

  def deletable?
    return false unless leaf?
    return false if Objective.find_by(indicator: self)
    return false if Assessment.find_by(indicator: self)
    true
  end

  def objective
    ancestry.where(type: 'Indicators::Objective').first.try(:name)
  end

  def level
    ancestry.where(type: 'Indicators::Level').first.try(:name)
  end

  def topic
    s = ancestry.where(type: 'Indicators::Topic').first.try(:name)
    strand ? "#{ s } - #{ strand }" : s
  end

  def strand
    ancestry.where(type: 'Indicators::Strand').first.try(:name)
  end

  def ancestry
    @ancestry ||= self_and_ancestors.reverse_order
  end

  protected

  def slug_candidates
    self_and_ancestors.reverse_order.map(&:to_s).join('/')
  end

  def check_deletable
    raise "Undeletable" unless deletable?
  end

  def prevent_parental_update
    if parent_id_changed? && self.persisted?
      errors.add(:parent, "cannot be changed")
    end
  end
end
