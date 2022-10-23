# frozen_string_literal: true

class User < Sequel::Model
  plugin :json_serializer
end
