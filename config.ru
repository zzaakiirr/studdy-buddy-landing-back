# frozen_string_literal: true

require 'rack/unreloader'
require_relative 'models'

dev_env = ENV['RACK_ENV'] == 'development'

if dev_env
  require 'logger'
  logger = Logger.new($stdout)
end

Unreloader = Rack::Unreloader.new(subclasses: %w[Roda Sequel::Model], logger: logger, reload: dev_env) { StuddyBuddy }

Unreloader.require('app.rb') { 'StuddyBuddy' }

run(dev_env ? Unreloader : StuddyBuddy.freeze.app)
