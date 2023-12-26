require "rails/engine"

module AhoyEmail
  class Engine < ::Rails::Engine
    initializer "ahoy_email" do |app|
      AhoyEmail.secret_token ||= begin
        # Use a key generator for Rails 7.1 and above
        if Rails::VERSION::STRING.to_f >= 7.1
          app.key_generator.generate_key("ahoy_email")
        else
          # Fallback for older Rails versions
          # Use Rails.application.credentials.secret_key_base if available
          token = Rails.application.credentials.secret_key_base
          # Fallback to Rails.application.secret_key_base if credentials are not set
          token ||= Rails.application.secret_key_base
          token
        end
      end
    end
  end
end
