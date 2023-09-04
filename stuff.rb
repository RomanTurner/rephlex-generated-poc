# frozen_string_literal: true

require "roda"
require "dry/inflector"
require "debug"
## Rack entry point, and main host for all
# and configuration point for Roda plugins.
class Stuff < Roda
  plugin :environments

  plugin :enhanced_logger

  # Allows modifying the default headers for responses.
  plugin :default_headers,
         "Content-Type" => "text/html",
         "Strict-Transport-Security" => "max-age=16070400;",
         "X-Frame-Options" => "deny",
         "X-Content-Type-Options" => "nosniff",
         "X-XSS-Protection" => "1; mode=block"

  plugin :all_verbs

  # Load Custom Plugins
  Dir["system/roda_plugins/*"].each { |route_file| require_relative route_file }

  plugin :rephlex, layout: Shared::Layout::IndexHtml

  route do |r|
    r.root do
      phlex_on(
        Shared::Pages::CtaHeroCopy.new(Struct.new(:first_name).new("Frob")),
        layout_options: {
          title: "Phlexy Test"
        }
      )
    end

    r.post "clicked" do
      Users::Components::Sidebar.new.call
    end

    inflector = Dry::Inflector.new
    Dir["allocs/*"].each do |file|
      route_name = File.basename(file)
      r.on(route_name) do
        klass = inflector.camelize(route_name)
        r.run inflector.constantize("#{klass}::Routes")
      end
    end
  end
end
