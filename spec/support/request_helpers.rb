module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def as_json
      { format: :json }
    end
  end

  module AuthHelpers
    def api_auth_headers(teacher=nil)
      teacher ||= Fabricate(:teacher, name: 'api-user')
      {
        'X-Auth-Email' => teacher.email,
        'X-Auth-Token' => teacher.authentication_token
      }
    end
  end
end
