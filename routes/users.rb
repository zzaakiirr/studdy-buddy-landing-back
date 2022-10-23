# frozen_string_literal: true

class StuddyBuddy
  hash_branch('users') do |r|
    r.post do
      begin
        User.create(user_create_params(r.params))

        { success: true }
      rescue Sequel::ValidationFailed => e
        response.status = 400
        { success: false, error: e.message }
      end
    end
  end

  private

  def user_create_params(params)
    params.slice(*%w[name email subscribed])
  end
end
