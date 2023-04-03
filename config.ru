# frozen_string_literal: true

require 'listen'
require_relative 'system/boot'

use(ViteRuby::DevServerProxy, ssl_verify_none: true) if ViteRuby.run_proxy?

loader = Application.resolve(:loader)
env = Application.resolve(:env)


if env == 'development'
  Listen.to(__dir__, only: /\.rb$/, force_polling: true) do |modified, added, removed|
    puts(modified: modified, added: added, removed: removed)
    load 'stuff.rb'
    loader.reload
  end.start

  run lambda { |env|
    loader.reload
    load 'stuff.rb'
    Stuff.call(env)
  }
else
  run Stuff.freeze.app
end
