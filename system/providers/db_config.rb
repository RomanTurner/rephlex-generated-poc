# frozen_string_literal: true

# This file contain code to setup the database connection.
Application.register_provider(:db_config) do |_container|
  start do
    target.start :environment_variables

    # For additional <db adapter> configuration options, visit the documentation for Sequel
    # https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html#label-postgres
    base_config = { adapter: "postgres", user: "zee_two", password: "rjj66", database: "zee_two_development" }

    db_config =
      case Application.env
      when "production"
        base_config.merge(
          { host: "localhost"}
        )
      when "test"
        base_config.merge(
          { adapter: "sqlite"}
        )
      else
        base_config.merge(
          { host: "localhost"}
        )
      end

    # Register database configuration
    register(:db_config, db_config)
  end
end
