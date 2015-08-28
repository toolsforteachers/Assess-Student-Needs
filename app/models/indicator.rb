class Indicator < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_closure_tree order: 'name', dependent: :destroy
  has_many :self_and_descendants, through: :descendant_hierarchies, source: :descendant
  has_many :self_and_ancestors, through: :ancestor_hierarchies, source: :ancestor

  belongs_to :created_by, class_name: 'Teacher'

  validates :created_by_id, presence: :true
  validates :name, presence: :true
  validates :type, presence: :true
  validate :prevent_parental_update

  before_destroy :check_deletable

  def to_s
    name
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
    ancestry.where(type: 'Indicators::Objective').first
  end

  def subject
    ancestry.where(type: 'Indicators::Subject').first
  end

  def curriculum
    ancestry.where(type: 'Indicators::Curriculum').first
  end

  def level
    ancestry.where(type: 'Indicators::Level').first
  end

  def topic
    ancestry.where(type: 'Indicators::Topic').first
  end

  def ancestry
    @ancestry ||= self_and_ancestors.reverse_order
  end

  protected

  def slug_candidates
    if self.parent
      "#{ self.parent.slug } #{ self.name }"
    else
      name
    end
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
