# frozen_string_literal: true

require "rake/testtask"
$LOAD_PATH.unshift File.expand_path("allocs", __dir__)

Rake::TestTask.new(:test) do |t|
  t.libs << "allocs"
  t.test_files = FileList["allocs/**/test_*.rb"]
end

task default: :test
