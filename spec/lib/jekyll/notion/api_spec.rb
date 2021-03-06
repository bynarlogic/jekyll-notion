# frozen_string_literal: true

require "spec_helper"

RSpec.describe API do
  let(:secret) { ENV["NOTION_SECRET"] }
  let(:url) { "https://www.notion.so/refactored-noise/Test-Page-77e5079b072246bba87b80ed15fcb7be" }

  describe "get_notion_page" do
    it "returns a notion page as a serialized hash object" do
      VCR.use_cassette("page") do
        notion = API.new(secret)
        data = notion.get_page(url)

        expect(data).to be_a(Hash)
        expect(data.keys).to eq(%w[object results next_cursor has_more])
      end
    end

    context "invalid URL" do
      it "raises a NotionToJekyll::Errors::InvalidURL exception" do
        VCR.use_cassette("invalid_page") do
          bad_url = "https://www.notion.so/bad-url"
          notion = API.new(secret)

          expected_error = Errors::InvalidURL
          expect { notion.get_page(bad_url) }.to raise_error(expected_error)
        end
      end
    end

    context "unauthroized request" do
      it "raises a NotionToJekyll::Errors::Unauthorized exception" do
        VCR.use_cassette("unauthorized_page") do
          notion = API.new("bad_secret")

          expected_error = Errors::Unauthorized
          expect { notion.get_page(url) }.to raise_error(expected_error)
        end
      end
    end
  end

  describe "get_page_meta" do
    it "returns the meta data for a notion page in a serialized hash" do
      VCR.use_cassette("meta_page") do
        notion = API.new(secret)
        data = notion.get_page_meta(url)

        expect(data).to be_a(Hash)

        expected_keys = %w[object id created_time last_edited_time cover icon parent archived
                           properties url]
        expect(data.keys).to eq(expected_keys)
      end
    end
  end
end
