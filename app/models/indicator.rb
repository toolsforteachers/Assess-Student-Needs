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

  after_save :touch_root
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

  def pedagogy
    ancestry.where(type: 'Indicators::Pedagogy').first
  end

  def learning_attribute
    ancestry.where(type: 'Indicators::LearningAttribute').first
  end

  def learning_skill
    ancestry.where(type: 'Indicators::LearningSkill').first
  end

  def ancestry
    @ancestry ||= self_and_ancestors.reverse_order
  end

  protected

  def touch_root
    root.touch
  end

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
