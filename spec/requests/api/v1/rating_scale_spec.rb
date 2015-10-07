require 'spec_helper'

describe 'Rating Scales API' do
  let!(:rating_scale) { Fabricate(:rating_scale) }

  it 'retrieves the rating scale' do
    get "/api/v1/rating_scales/#{ rating_scale.to_param }", as_json, api_auth_headers

    expect(response).to be_success
    expect(json['name']).to eql(rating_scale.name)
    expect(json['max_score']).to eql(rating_scale.max_score)
  end

  it 'retrieves a list of rating scales'

  it 'fails when there is no authentication' do
    get '/api/v1/rating_scales', as_json

    expect(response.status).to eql(401)
  end
end
