require "rails/engine"

module AhoyEmail
  class Engine < ::Rails::Engine
    initializer "ahoy_email" do |app|
      AhoyEmail.secret_token ||= begin
        if app.respond_to?(:credentials) && app.credentials.secret_key_base
          app.credentials.secret_key_base
        else
          raise "Rails credentials not set"
        end
      end
    end
  end
end
