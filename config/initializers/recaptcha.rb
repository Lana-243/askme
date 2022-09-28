Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials[:recaptcha_askme_public_key]
  config.secret_key = Rails.application.credentials[:recaptcha_askme_private_key]
end
