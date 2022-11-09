# frozen_string_literal: true

begin
  require_relative '.env'
rescue LoadError
end

require 'sequel/core'
DB = Sequel.connect(ENV.delete('STUDDY_BUDDY_DATABASE_URL'))
