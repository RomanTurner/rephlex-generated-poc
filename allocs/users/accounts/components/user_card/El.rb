module Users
  module Accounts
    module Components
      module UserCard
        class El < Phlex::HTML
          def template
            div(class: "target")
            button(class: "trigger") { "Toggle" }
          end
        end
      end
    end
  end
end
