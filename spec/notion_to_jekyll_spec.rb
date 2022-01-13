# frozen_string_literal: true

RSpec.describe NotionToJekyll do
  it "has a version number" do
    expect(NotionToJekyll::VERSION).not_to be nil
  end

  describe NotionToJekyll::API do
    let(:secret) { ENV["NOTION_SECRET"] }
    let(:url) { ENV["PAGE_URL"] }

    describe "get_notion_page" do
      it "returns a notion page as a serialized hash object" do
        VCR.use_cassette("page") do
          notion = NotionToJekyll::API.new(secret)
          data = notion.get_page(url)

          expect(data).to be_a(Hash)
          expect(data.keys).to eq(%w[object results next_cursor has_more])
        end
      end

      context "invalid URL" do
        it "raises a NotionToJekyll::API::InvalidURL exception" do
          VCR.use_cassette("invalid_page") do
            bad_url = "https://www.notion.so/bad-url"
            notion = NotionToJekyll::API.new(secret)

            expected_error = NotionToJekyll::InvalidURL
            expect { notion.get_page(bad_url) }.to raise_error(expected_error)
          end
        end
      end

      context "unauthroized request" do
        it "raises a NotionToJekyll::API::Unauthorized exception"
      end
    end
  end
end
