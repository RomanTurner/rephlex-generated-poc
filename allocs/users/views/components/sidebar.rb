module Users
  module Components
    class Sidebar < Phlex::HTML
      def template
        div(style: "background: red; width: 50px; height: 50px")
      end
    end
  end
end
