require 'rspec'
require 'capybara/rspec'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../../config/environment', __FILE__)
require 'capybara/rails'
