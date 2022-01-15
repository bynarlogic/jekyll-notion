# frozen_string_literal: true

# Namespace for Page
module NotionToJekyll
  # Page object containing meta tags for page
  class Page
    attr_accessor :page_meta, :page_contents
    attr_reader :api

    def initialize(url)
      @api = NotionToJekyll::API.new(ENV["NOTION_SECRET"])
      @page_meta = api.get_page_meta(url)
      @page_contents = api.get_page(url)
    end

    def title
      @page_meta["properties"]["title"]["title"][0]["plain_text"]
    end

    def blocks
      @page_contents["results"]
    end
  end
end
