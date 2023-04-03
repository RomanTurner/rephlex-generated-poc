# frozen_string_literal: true
module Users
  # routes for '/users'
  class Routes < Roda
    route do |r|
      r.root do
        'Users Index'
      end

      r.on "accounts" do
        r.run Accounts::Routes
      end

      r.on Integer do |i|
        @user = Users::DataModel[i]
        r.on 'comments' do
          # REPHLEX-NOTE: I tried to use opts but it didn't work. It said that it would be availible to subclasses, but
          opts[:user] = @user
          r.run Comments::Routes
        end

        r.is do
          "Show User1: #{@user.full_name}s"
        end
      end
    end
  end
end
