# frozen_string_literal: true

require "httparty"
require "require_all"
require "dotenv"

require_relative "notion_to_jekyll/api"
require_relative "notion_to_jekyll/errors"
require_relative "notion_to_jekyll/page"
require_relative "notion_to_jekyll/version"

require_all "lib/notion_to_jekyll/blocks"

# The main entry point for NotionToJekyll
module NotionToJekyll
  Dotenv.load("secret.env")

  def render_page(url)
    page = Page.new url

    page.blocks.map do |block|
      "#{block.render}\n"
    end.join
  end
end
