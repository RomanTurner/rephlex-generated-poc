class Rephlexy < Phlex::HTML
  def grender(&)
    div(data_component: "#{self.descendants}") { yield }
  end
  def tw(klass)
    styles =
      self.class::STYLES[klass]
        .map do |(k, v)|
          k == :xs ? v : v.split(" ").map { |el| "#{k}:#{el}" }.join(" ")
        end
        .join(" ")
    { class: styles, data_class_name: klass }
  end
end

class V1 < Phlex::HTML
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

  def tw_classes(klass)
    { class: STYLES[klass].values.join(" ") }
  end

  def template
    div(class: "bg-white") do
      div(**tw_classes(:container)) do
        h2(
          class: "text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl"
        ) do
          plain "Boost your productivity"
          br
          plain "Start using our app today."
        end
        div(class: "mt-10 flex items-center gap-x-6") do
          a(href: "#", **tw_classes(:get_started)) { "Get started" }
          a(
            href: "#",
            class: "text-sm font-semibold leading-6 text-gray-900"
          ) do
            plain "Learn more"
            span(aria_hidden: "true") { " →" }
          end
        end
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
        render V1.new
      end
    end
  end
end
