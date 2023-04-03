module Users
  module Accounts
    class Routes < Roda
      route do |r|
        r.root do
          "User Accounts"
        end
      end
    end
  end
end
