class Indicators::Objective < Indicator
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

  def allowable_child_types
    []
  end
end
