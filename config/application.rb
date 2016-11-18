require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WritingApp
  class Application < Rails::Application
    ActsAsTaggableOn.force_lowercase = true
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.beginning_of_week = :sunday

    config.autoload_paths << File.join(Rails.root, 'lib')
    config.time_zone = 'Eastern Time (US & Canada)'

    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.fixture_replacement :factory_girl
    end
  end
end
Paperclip.options[:command_path] = "/usr/local/bin/identify" #/usr/local/bin/convert
