require 'pry'

STYLES = {
        hero_container: {
          xs:
            "relative isolate overflow-hidden bg-gray-900 px-6 pt-16 shadow-2xl",
          sm: "sm:rounded-3xl sm:px-16",
          md: "md:pt-24",
          lg: "lg:flex lg:gap-x-20 lg:px-24 lg:pt-0"
        },
        header_container: {
          xs: "mx-auto max-w-md text-center",
          lg: "lg:mx-0 lg:flex-auto lg:py-32 lg:text-left"
        },
        header: {
          xs: "text-3xl font-bold tracking-tight text-white",
          sm: "sm:text-4xl"
        },
        cta_container: {
          xs: "mt-10 flex items-center justify-center gap-x-6",
          lg: "lg:justify-start"
        },
        get_started: {
          xs:
            "rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm",
          hover: "hover:bg-gray-100",
          focus_visible: "focus_visible:outline focus_visible:outline-2 focus_visible:outline-offset-2 focus_visible:outline-white"
        },
        page_container: {
          xs: "mx-auto max-w-7xl py-24",
          sm: "sm:px-6 sm:py-32",
          lg: "lg:px-8"
        }
      }

def tw_classes(klass)
  {
    class:
      STYLES[klass].inject(&:join)
  }
end

binding.pry
