module Users
  module Pages
    class Show < Phlex::HTML
      def initialize(user:)
        @user = user
      end

      def template
        render Users::Components::Card.new(name: @user.full_name, title: "title")
      end
    end
  end
end
