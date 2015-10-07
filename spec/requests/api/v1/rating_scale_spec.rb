require 'spec_helper'

describe 'Rating Scales API' do
  it 'retrieves a list of rating scales' do
    get '/api/v1/rating_scales', as_json, api_auth_headers

    expect(response).to be_success
    expect(json['name']).to eql('Likert')
  end

  it 'fails when there is no authentication' do
    get '/api/v1/rating_scales', as_json

    expect(response.status).to eql(401)
  end
end
