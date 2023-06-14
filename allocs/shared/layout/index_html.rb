module Shared
  module Layout
    class IndexHtml < Phlex::HTML
      attr_accessor :current_head

      class Empty < Phlex::HTML
        def template
          ""
        end
      end

      def initialize(component, title:)
        @title = title
        @current_head = []
        @component = component || Empty.new
      end

      def template
        html do
          head do
            meta(charset: "UTF-8")
            meta("http-equiv" => "UTF-8", :content => "IE=edge")
            meta(
              name: "viewport",
              content: "width=device-width, initial-scale=1.0"
            )
            render vite_javascript_tag("application")
            render vite_client_tag
            compose_head
            title { @title }
          end

          body { render @component }
        end
      end

      private

      def compose_head
        current_head.each { |el| render el } if !current_head.empty?
      end
    end
  end
end
