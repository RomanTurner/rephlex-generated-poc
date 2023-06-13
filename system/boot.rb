# frozen_string_literal: true

# This file is responsible for loading all configuration files.
Dir["providers/*"].each { |file| require_relative file }

require_relative "application"
require_relative "import"

require "securerandom"
require "dry-validation"

Application.start(:environment_variables)
Application.start(:rephlex)
Application.start(:logger)
Application.start(:database)
Application.start(:models)

# Register automatically application classess and the external dependencies from the /system/boot folder.
Application.finalize!

# Add exsiting Logger instance to DB.loggers collection.
if Application[:database].loggers.empty?
  Application[:database].loggers << Application[:logger]
end

# Freeze internal data structures for the Database instance.
require "pry" if Application.env == "development"
Application[:database].freeze unless Application.env == "development"
