# frozen_string_literal: true
module Users
  # routes for '/users'
  # REPHLEX-TODO: The generator has to make sure the nested classes inheret from their parent
  # The plugins require it to work. Otherwise each is just inhereting from Roda Core
  class Routes < Stuff
    route do |r|
      r.root do
        @users = Users::DataModel.all
        phlex_on(Users::Pages::Index.new(users: @users))
      end

      r.on "accounts" do
        r.run Accounts::Routes
      end

      r.on Integer do |i|
        @user = Users::DataModel[i]
        r.on "comments" do
          opts[:user] = @user
          r.run Comments::Routes
        end

        #"/users/:id"
        r.is { phlex_on(Users::Pages::Show.new(user: @user)) }
      end
    end
  end
end
