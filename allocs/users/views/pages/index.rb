module Users
  module Pages
    class Index < Phlex::HTML
      def initialize(users:)
        @users = users
      end

      def template
        div(class: "grid-container") do
          @users.each do |user|
            div(class: "grid-item") do
              render Users::Components::Card.new(
                id: user.id,
                name: user.full_name,
                title: 'title'
              )
            end
          end
        end
      end
    end
  end
end
