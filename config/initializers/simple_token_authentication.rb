SimpleTokenAuthentication.configure do |config|
  config.sign_in_token = false
  config.header_names = { teacher: { authentication_token: 'X-Auth-Token', email: 'X-Auth-Email' } }
  config.skip_devise_trackable = true
end
