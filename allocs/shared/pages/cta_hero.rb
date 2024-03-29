class TestSVG < Phlex::SVG
  def template
    svg(
      viewBox: "0 0 1024 1024",
      class:
        "absolute left-1/2 top-1/2 -z-10 h-[64rem] w-[64rem] -translate-y-1/2 [mask-image:radial-gradient(closest-side,white,transparent)] sm:left-full sm:-ml-80 lg:left-1/2 lg:ml-0 lg:-translate-x-1/2 lg:translate-y-0",
      aria_hidden: "true"
    ) do
      circle(
        cx: "512",
        cy: "512",
        r: "512",
        fill: "url(#759c1415-0410-454c-8f7c-9a820de03641)",
        fill_opacity: "0.7"
      )
      defs do
        radialGradient(id: "759c1415-0410-454c-8f7c-9a820de03641") do
          stop(stop_color: "#7775D6")
          stop(offset: "1", stop_color: "#E935C1")
        end
      end
    end
  end
end

module Shared
  module Pages
    class CtaHero < Phlex::HTML
      STYLES = {
        hero_container: {
          xs:
            "relative isolate overflow-hidden bg-gray-900 px-6 pt-16 shadow-2xl",
          sm: "rounded-3xl px-16",
          md: "pt-24",
          lg: "flex gap-x-20 px-24 pt-0"
        },
        header_container: {
          xs: "mx-auto max-w-md text-center",
          lg: "mx-0 flex-auto py-32 text-left"
        },
        header: {
          xs: "text-3xl font-bold tracking-tight text-white",
          sm: "text-4xl"
        },
        cta_container: {
          xs: "mt-10 flex items-center justify-center gap-x-6",
          lg: "justify-start"
        },
        get_started: {
          xs:
            "rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm",
          hover: "bg-gray-100",
          focus_visible: "outline outline-2 outline-offset-2 outline-white"
        },
        page_container: {
          xs: "mx-auto max-w-7xl py-24",
          sm: "px-6 py-32",
          lg: "px-8"
        }
      }

      def initialize(user)
        @user = user
      end

      def template
        div(class: "bg-white") do
          div(**tw_classes(:page_container)) { hero_body }
        end
      end

      def tw_classes(klass)
        {
          class:
            STYLES[klass]
              .map do |(k, v)|
                k == :xs ? v : v.split(" ").map { |el| "#{k}:#{el}" }.join(" ")
              end
              .join(" ")
        }
      end

      def hero_body
        div(**tw_classes(:hero_container)) do
          render TestSVG.new
          div(**tw_classes(:header_container)) do
            h2(**tw_classes(:header)) do
              plain "Boost your productivity."
              br
              plain "Start using our app today."
            end
            p(class: "mt-6 text-lg leading-8 text-gray-300") do
              "Ac euismod vel sit maecenas id pellentesque eu sed consectetur. Malesuada adipiscing sagittis vel nulla."
            end
            div(**tw_classes(:cta_container)) do
              a(href: "#", **tw_classes(:get_started)) { "Get started" }
              a(
                href: "#",
                class: "text-sm font-semibold leading-6 text-white"
              ) do
                "Learn more"
                span(aria_hidden: "true") { "→" }
              end
            end
            div(class: "relative mt-16 h-80 lg:mt-8") do
              img(
                class:
                  "absolute left-0 top-0 w-[57rem] max-w-none rounded-md bg-white/5 ring-1 ring-white/10",
                src:
                  "https://tailwindui.com/img/component-images/dark-project-app-screenshot.png",
                alt: "App screenshot",
                width: "1824",
                height: "1080"
              )
            end
          end
        end
      end
    end
  end
end
