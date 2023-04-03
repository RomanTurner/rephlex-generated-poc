require "thor"
require "sequel"
require "pry"
require "logger"

module StuffCLI
  class Database < Thor
    include Thor::Actions

    desc "seed", "Run db/seeds/seed.rb"
    def seed
      puts run("ruby db/seeds/seed.rb")
    end

    desc "create", "Create database named after application name"
    option :env
    def create(name)
      db_name = options[:env] ? options[:env] + name : name
      Sequel.connect(adapter: "postgres") do |db|
        db.loggers << Logger.new($stdout)
        db.execute "DROP DATABASE IF EXISTS #{db_name}"
        db.execute "CREATE DATABASE #{db_name}"
      end
    rescue LoadError
      puts set_color "You are not in a project directory", :magenta, :bold
    end

    desc "test_up", "Migrate test database to latest version"
    def test_up
      migrate("test", nil)
    end

    desc "test_down", "Migrate test database all the way down"
    def test_down
      migrate("test", 0)
    end

    desc "test_bounce",
         "Migrate test database all the way down and then back up"
    def test_bounce
      migrate("test", 0)
      Sequel::Migrator.apply(DB, "migrate")
    end

    desc "dev_up", "Migrate development database to latest version"
    def dev_up
      migrate("development", nil)
    end

    desc "dev_down", "Migrate development database to all the way down"
    def dev_down
      migrate("development", 0)
    end

    desc "test_task", "test task"
    def test_task
      binding.pry
    end

    desc "dev_bounce",
         "Migrate development database all the way down and then back up"
    def dev_bounce
      migrate("development", 0)
      Sequel::Migrator.apply(DB, "./db/migrate")
    end

    desc "prod_up", "Migrate production database to latest version"
    def prod_up
      migrate("production", nil)
    end

    no_tasks do
      def migrate(env, version)
        ENV["RACK_ENV"] = env
        require_relative "../../config/db"
        require "logger"
        Sequel.extension :migration
        DB.loggers << Logger.new($stdout) if DB.loggers.empty?
        Sequel::Migrator.apply(DB, "db/migrate", version)
      end
    end
  end
end
