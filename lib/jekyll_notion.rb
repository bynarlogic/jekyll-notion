# frozen_string_literal: true

# namespace for Jekyll
module Jekyll
  require "httparty"
  require "require_all"
  require "dotenv"

  require_relative "jekyll-notion/blocks/block"
  require_relative "jekyll-notion/blocks/heading1"
  require_relative "jekyll-notion/blocks/heading2"
  require_relative "jekyll-notion/blocks/heading3"
  require_relative "jekyll-notion/blocks/image"
  require_relative "jekyll-notion/blocks/code"
  require_relative "jekyll-notion/blocks/bulleted_list_item"
  require_relative "jekyll-notion/blocks/paragraph"
  require_relative "jekyll-notion/blocks/divider"
  require_relative "jekyll-notion/api"
  require_relative "jekyll-notion/errors"
  require_relative "jekyll-notion/page"
  require_relative "jekyll-notion/version"

  # The main entry point
  module Notion
    Dotenv.load("secret.env")

    def convert_url_to_post(url)
      page = Jekyll::Notion::Page.new url

      md = page.blocks.map do |block|
        "#{block.render}\n"
      end.join

      File.open("./spec/fixtures/posts/post.md", "w") { |file| file.write(md) }
    end
  end
end

require "jekyll"
require_all "lib/jekyll/commands"
