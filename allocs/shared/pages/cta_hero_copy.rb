class StyledComponent < Phlex::HTML
  STYLES = {
    container: {
      xs: "mx-auto max-w-7xl px-6 py-24",
      sm: "sm:py-32",
      lg: "lg:px-8"
    },
    get_started: {
      xs:
        "rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm",
      hover: "hover:bg-indigo-500",
      focus_visible:
        "focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
    }
  }

  def tw(klass)
    { class: STYLES[klass].values.join(" ") }
  end

  def template
    div(class: "bg-white") do
      div(**tw(:container)) do
        h2(
          class: "text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl"
        ) do
          plain "Boost your productivity"
          br
          plain "Start using our app today."
        end
        div(class: "mt-10 flex items-center gap-x-6") do
          a(href: "#", **tw(:get_started)) { "Get started" }
          a(
            href: "#",
            class: "text-sm font-semibold leading-6 text-gray-900"
          ) do
            plain "Learn more"
            span(aria_hidden: "true") { " →" }
          end
        end
        div(class: "element")
      end
    end
  end
end

module Shared
  module Pages
    class CtaHeroCopy < Phlex::HTML
      def initialize(user)
        @user = user
      end

      def template
        # render V1.new
        hr
        render StyledComponent.new
      end
    end
  end
end
