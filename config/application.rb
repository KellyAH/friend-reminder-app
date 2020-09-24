require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FriendReminderApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :authentication => :plain,
        :address => ENV["MAILGUN_SMTP_SERVER"],
        :port => ENV["MAILGUN_SMTP_PORT"],
        :domain => ENV["MAILGUN_DOMAIN"],
        :user_name => ENV["MAILGUN_SMTP_LOGIN"],
        :password => ENV["MAILGUN_SMTP_PASSWORD"]
    }
  end
end
