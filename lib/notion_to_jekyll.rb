# frozen_string_literal: true

require_relative "notion_to_jekyll/version"
require "httparty"
require "byebug"

module NotionToJekyll
  class InvalidURL < StandardError; end

  # The main API responsible for Notion to Jekyll article conversion
  class API
    attr_accessor :api_secret

    def initialize(api_secret)
      @api_secret = api_secret
    end

    def get_page(url)
      block_id = get_block_id(url)

      begin
        r = HTTParty.get("#{base_url}/blocks/#{block_id}/children", headers: headers)
      rescue URI::InvalidURIError
        raise InvalidURL
      end

      r.parsed_response
    end

    private

    def base_url
      "https://api.notion.com/v1"
    end

    def get_block_id(page_url)
      end_of_url = page_url.split(%r{\w/}).last
      end_of_url.split("-").last
    end

    def headers
      {
        'Authorization': "Bearer #{@api_secret}",
        'Notion-Version': "2021-08-16"
      }
    end
  end
end
