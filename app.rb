# frozen_string_literal: true

require_relative 'models'

require 'roda'

class StuddyBuddy < Roda
  plugin :common_logger, $stderr
  plugin :hash_branches
  plugin :json, classes: [Array, Hash, Sequel::Model], content_type: 'application/json'
  plugin :json_parser

  Unreloader.require('routes') {}

  route do |r|
    r.root do
      { success: true, message: 'StuddyBuddy server is up', env: ENV['RACK_ENV'] }
    end

    r.hash_branches
  end
end
