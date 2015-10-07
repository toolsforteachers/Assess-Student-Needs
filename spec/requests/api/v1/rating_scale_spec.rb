require 'spec_helper'

describe 'Rating Scales API' do
  let!(:rating_scale) { Fabricate(:rating_scale, name: 'Triangular', max_score: 3) }

  it 'retrieves a list of rating scales' do
    get "/api/v1/rating_scales/", as_json, api_auth_headers

    expect(response).to be_success

    result = json[0]['rating_scale']

    expect(result['name']).to eql('Triangular')
    expect(result['max_score']).to eql(3)
    expect(result['key']).to eql('triangular')

    expect(result['ordinals'][0]).to eql({ 'name' => 'N/A', 'value' => 0 })
    expect(result['ordinals'][3]).to eql({ 'name' => 'Expert', 'value' => 3 })
  end

  it 'fails when there is no authentication' do
    get '/api/v1/rating_scales', as_json

    expect(response.status).to eql(401)
  end
end
