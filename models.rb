# frozen_string_literal: true

require_relative 'db'
require 'sequel/model'

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :auto_validations
Sequel::Model.plugin :require_valid_schema

unless defined?(Unreloader)
  require 'rack/unreloader'
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require('models') { |f| Sequel::Model.send(:camelize, File.basename(f).sub(/\.rb\z/, '')) }
