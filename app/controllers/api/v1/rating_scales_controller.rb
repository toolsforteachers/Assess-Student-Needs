class Api::V1::RatingScalesController < Api::V1::BaseController
  def index
    render json: { name: 'Likert' }.to_json
  end

  def show
    rating_scale = RatingScale.find(params[:id])
    render json: rating_scale.to_json
  end
end
