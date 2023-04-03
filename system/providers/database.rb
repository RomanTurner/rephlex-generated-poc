# frozen_string_literal: true

# This file contain code to setup the database connection.
Application.register_provider(:database) do |_container|
  prepare { require "sequel/core" }

  start do
    target.start :db_config

    # You can connect to a database with a URL like so:
    # Delete DATABASE_URL from the environment, so it isn't accidently passed to subprocesses.
    # DB = Sequel.connect(ENV.delete('DATABASE_URL'))
    DB = Sequel.connect(Application[:db_config])

    # Register database component.
    register(:database, DB)
  end
end
