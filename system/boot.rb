# frozen_string_literal: true

require_relative "application"
require_relative "import"

require "securerandom"
require "dry-validation"

# Register automatically application classess and the external dependencies from the /system/boot folder.
Application.finalize!


# Freeze internal data structures for the Database instance.
require "pry" if Application.env == "development"
Application[:database].freeze unless Application.env == "development"
