# Rephlex Todo: Add vite to CLI
# Rephlex is really just the easy path for vite, phlex and roda
Application.register_provider(:rephlex) do |_container|
  prepare do
    require "vite_ruby"
    require_relative "../vite/tag_helpers.rb"
    require "phlex"
  end

  start do
    # To configure vite_tag helpers with phlex components.
    Phlex::HTML.include(ViteRephlex)
  end
end
