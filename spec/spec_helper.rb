# frozen_string_literal: true

require "notion_to_jekyll"
require "vcr"
require "webmock/rspec"
require "byebug"
require "dotenv"

Dotenv.load("secret.env")

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock

  config.filter_sensitive_data("<NOTHING_TO_SEE_HERE>") { |i| i.request.headers["Authorization"].first }

  %w[Set-Cookie Set-Cookie Set-Cookie].each_with_index do |header, i|
    config.filter_sensitive_data("<#{header.upcase}>") do |interaction|
      next unless interaction.response.headers[header]

      interaction.response.headers[header]&.dig(i)
    end
  end
end

RSpec.configure do |config|
  include NotionToJekyll
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
