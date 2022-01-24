# frozen_string_literal: true

require "httparty"
require "require_all"

require_relative "notion_to_jekyll/api"
require_all "lib/notion_to_jekyll/blocks"
require_relative "notion_to_jekyll/errors"
require_relative "notion_to_jekyll/page"
require_relative "notion_to_jekyll/version"

# The main entry point for NotionToJekyll
module NotionToJekyll
  def render_page(url)
    page = Page.new url

    page.blocks.map do |block|
      "#{block.render}\n"
    end.join
  end
end
