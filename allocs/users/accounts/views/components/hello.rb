module Users
  module Accounts
    module Components
      class Hello < Phlex::HTML
        def initialize(name)
          @name = name
        end

        def template
          h1 { "Hello #{@name}" }
        end
      end
    end
  end
end
