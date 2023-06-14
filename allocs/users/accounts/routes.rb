module Users
  module Accounts
    class Inline < Phlex::HTML
def template
  render Users::Accounts::Components::UserCard::El
  render Users::Accounts::Components::UserCardTwo::El
end
    end
    class Routes < Stuff
      route do |r|
        r.root { "Accounts" }
        r.on "show" do
          phlex_on(

            Inline.new,
            layout_options: {
              title: "Accounts"
            }
          )
        end
      end
    end
  end
end
