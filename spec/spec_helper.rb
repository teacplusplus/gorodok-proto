# require 'rubygems'
require 'spork'
ENV["RAILS_ENV"] ||= "test"

Spork.prefork do  
  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'factory_girl_rails'
  `rake db:setup db:seed RAILS_ENV=test`
  RSpec.configure do |config|
    # config.mock_with :mocha
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
    # config.include KoalaHelpers
  end
  ActiveSupport::Dependencies.clear
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  # Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  FactoryGirl.reload
end
