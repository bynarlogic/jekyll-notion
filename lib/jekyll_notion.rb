# frozen_string_literal: true
require "jekyll/commands/notion_post"

# namespace for Jekyll
module Jekyll
  # The main entry point
  module Notion
    require "httparty"
    require "require_all"
    require "dotenv"

    require "jekyll/notion/blocks/block"
    require "jekyll/notion/blocks/heading1"
    require "jekyll/notion/blocks/heading2"
    require "jekyll/notion/blocks/heading3"
    require "jekyll/notion/blocks/image"
    require "jekyll/notion/blocks/code"
    require "jekyll/notion/blocks/bulleted_list_item"
    require "jekyll/notion/blocks/paragraph"
    require "jekyll/notion/blocks/divider"
    require "jekyll/notion/api"
    require "jekyll/notion/errors"
    require "jekyll/notion/page"
    require "jekyll/notion/version"

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