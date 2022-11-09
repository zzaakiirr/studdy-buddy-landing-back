# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id

      String :name, null: false
      String :email, unique: true, null: false

      FalseClass :subscribed, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: true
    end
  end
end
