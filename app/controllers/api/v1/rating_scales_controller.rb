class Api::V1::RatingScalesController < Api::V1::BaseController
  def index
    render json: { name: 'Likert' }.to_json
  end
end
