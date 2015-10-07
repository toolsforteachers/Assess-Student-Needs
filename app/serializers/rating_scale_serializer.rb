class RatingScaleSerializer < ActiveModel::Serializer
  attributes :name, :max_score, :key, :ordinals

  def ordinals
    arr = []
    object.ordinals.each do |k,v|
      arr << { name: k, value: v }
    end
    arr.sort_by{ |h| h[:value] }
  end
end
