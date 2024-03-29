# frozen_string_literal: true

module Users
  # persistance layer for users
  class DataModel < Sequel::Model(DB[:user])
    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
