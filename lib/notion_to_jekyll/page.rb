# frozen_string_literal: true

# Namespace for Page
module NotionToJekyll
  # Page object containing meta tags for page
  class Page
    include Blocks

    attr_accessor :page_meta, :page_contents
    attr_reader :api

    BLOCK_TYPE_MAPPING = {
      "heading_1" => Heading1,
      "heading_2" => Heading2,
      "heading_3" => Heading3,
      "paragraph" => Paragraph,
      "code" => Code,
      "image" => Image,
      "bulleted_list_item" => BulletedListItem
    }.freeze

    def initialize(url)
      @api = NotionToJekyll::API.new(ENV["NOTION_SECRET"])
      @page_meta = api.get_page_meta(url)
      @page_contents = api.get_page(url)
    end

    def title
      @page_meta["properties"]["title"]["title"][0]["plain_text"]
    end

    def blocks
      @page_contents["results"].map do |result|
        klass = BLOCK_TYPE_MAPPING[result["type"]]
        klass.new result
      end
    end
  end
end
