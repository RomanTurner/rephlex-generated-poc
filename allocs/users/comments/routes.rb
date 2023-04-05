# frozen_string_literal: true

module Users
  module Comments
    # routes for users/:id/comments
    class Routes < Users::Routes
      route do |r|
        @user = opts[:user]

        # users/:id/comments
        r.is do
          phlex_on(Users::Pages::Show.new(user: @user)) 
        end

        # users/:id/comments/
        r.root { "Hello from #{@user.full_name}s comments" }

        # users/:id/comments/blog
        r.on 'blog' do
          'hellow'
        end
      end
    end
  end
end
