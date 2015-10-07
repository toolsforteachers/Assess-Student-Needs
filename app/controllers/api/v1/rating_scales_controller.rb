class Api::V1::RatingScalesController < Api::V1::BaseController
  def index
    rating_scales = RatingScale.all.map{ |rs| RatingScaleSerializer.new(rs) }
    render json: rating_scales.to_json
  end
end
