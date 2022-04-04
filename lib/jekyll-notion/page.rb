# frozen_string_literal: true

# Namespace for Page
module Jekyll
  # Namespace for Notion
  module Notion
    # Page object containing meta tags for page
    class Page
      include Jekyll::Notion::Blocks
      attr_accessor :page_meta, :page_contents
      attr_reader :api

      BLOCK_TYPE_MAPPING = {
        "heading_1" => Heading1,
        "heading_2" => Heading2,
        "heading_3" => Heading3,
        "paragraph" => Paragraph,
        "code" => Code,
        "image" => Image,
        "divider" => Divider,
        "bulleted_list_item" => BulletedListItem
      }.freeze

      def initialize(url)
        @api = API.new(ENV["NOTION_SECRET"])
        @page_meta = api.get_page_meta(url)
        @page_contents = api.get_page(url)
      end

      def title
        @page_meta["properties"]["title"]["title"][0]["plain_text"]
      end

      def blocks
        results.map do |result|
          klass = BLOCK_TYPE_MAPPING[result["type"]]
          begin
            klass.new result
          rescue NoMethodError
            raise Errors::UnknownBlockType
          end
        end
      end
    end

    private

    def results
      @page_contents["results"]
    end
  end
end
