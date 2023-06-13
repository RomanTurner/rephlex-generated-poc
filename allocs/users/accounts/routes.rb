module Users
  module Accounts
    class Routes < Stuff
      route do |r|
        r.root { "Accounts" }
        r.on "show" do
          "show"
        end
      end
    end
  end
end
