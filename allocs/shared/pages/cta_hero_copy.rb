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

class CardTitle < Phlex::HTML
  def template(&)
    div(class: "title", &)
  end
end
class CardBody < Phlex::HTML
  def template(&)
    div(class: "body", &)
  end
end
class CardActions < Phlex::HTML
  def template(&)
    div(class: "actions", &)
  end
end
class Card < Phlex::HTML
  def template(&)
    article(class: "card", &)
  end

  def title(&)
    render CardTitle.new(&)
  end

  def body(&)
    render CardBody.new(&)
  end

  def actions(&)
    render CardActions.new(&)
  end
end

class Button < Phlex::HTML
  STYLES = {
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

  def initialize(action: "GET", body: "Click")
    @action, @body = action, body
  end

  def template
    button(**tw(:get_started), action: @action) { @body }
  end
end

class Dropdown < Phlex::HTML
  register_element :path

  def template
    div(class: "relative h-full max-w-5xl mx-auto px-4") do
      whitespace
      section(class: "mt-16 text-center") do
        div(
          data_controller: "dropdown",
          class: "relative inline-block text-left"
        ) do
          div do
            whitespace
            button(
              type: "button",
              data_action: " dropdown# toggle click@ window->dropdown#hide",
              class:
                "inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
            ) do
              text " Options "
              svg(
                class: "-mr-1 ml-2 h-5 w-5",
                xmlns: "http://www.w3.org/2000/svg",
                viewbox: "0 0 20 20",
                fill: "currentColor",
                aria_hidden: "true"
              ) do
                whitespace
                path(
                  fill_rule: "evenodd",
                  d:
                    "M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z",
                  clip_rule: "evenodd"
                )
                whitespace
              end
              whitespace
            end
          end
          div(
            data_dropdown_target: "menu",
            class:
              "hidden transition transform origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none",
            data_transition_enter_from: "opacity-0 scale-95",
            data_transition_enter_to: "opacity-100 scale-100",
            data_transition_leave_from: "opacity-100 scale-100",
            data_transition_leave_to: "opacity-0 scale-95"
          ) do
            div(class: "py-1") do
              whitespace
              a(
                href: "#",
                data_action: "dropdown#toggle",
                class: "bg-gray-100 text-gray-900 block px-4 py-2 text-sm"
              ) { "Account settings" }
              whitespace
              a(
                href: "#",
                data_action: "dropdown#toggle",
                class:
                  "text-gray-700 hover:bg-gray-100 hover:text-gray-900 block px-4 py-2 text-sm"
              ) { "Support" }
              whitespace
              a(
                href: "#",
                data_action: "dropdown#toggle",
                class:
                  "text-gray-700 hover:bg-gray-100 hover:text-gray-900 block px-4 py-2 text-sm"
              ) { "License" }
            end
          end
        end
        whitespace
      end
    end
  end
end

class Example < Phlex::HTML
  def template
    render Card.new do |card|
      card.title { h1 { "Title" } }

      card.body { p { "Body" } }

      card.actions do
        div(class: "mt-10 flex items-center gap-x-6") do
          render Button.new(body: "Away")
          render Button.new(action: "POST")
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
        # render StyledComponent.new
        # hr
        # render Example.new
        # hr
        div(class: "relative h-full max-w-5xl mx-auto px-4") do
          section(class: "mt-16 text-center") { render Dropdown.new }
        end
      end
    end
  end
end
