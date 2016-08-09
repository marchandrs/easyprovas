OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
  ENV["fb_app_id"],
  ENV["fb_app_secret"],
  scope: 'email',
  display: 'page',#change to popup when possible, it also requires js code
  image_size: 'normal',
  info_fields: 'name,first_name,last_name,email,gender,picture',
  client_options: {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}
end
