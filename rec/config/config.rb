# frozen_string_literal: true

require "dry-configurable"

module Rec
  extend Dry::Configurable

  setting :postgres do
    setting :database
    setting :host
    setting :password
    setting :port
    setting :username
  end

  config.postgres.database = ENV.fetch("DATABASE_NAME") { "om-backend" }
  config.postgres.host = ENV.fetch("DATABASE_HOST")
  config.postgres.password = ENV.fetch("DATABASE_PASSWORD")
  config.postgres.port = ENV.fetch("DATABASE_PORT")
  config.postgres.username = ENV.fetch("DATABASE_USERNAME")
end
