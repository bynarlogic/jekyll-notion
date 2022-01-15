# frozen_string_literal: true

require "spec_helper"

RSpec.describe NotionToJekyll::Page do
  describe "initialize" do
    let(:url) { "https://www.notion.so/refactored-noise/Test-Page-77e5079b072246bba87b80ed15fcb7be" }
    let(:cassettes) do
      [
        { name: "page" },
        { name: "page_meta" }
      ]
    end
    let(:page) { VCR.use_cassettes(cassettes) { NotionToJekyll::Page.new(url) } }

    it "has a title attribute" do
      expect(page.title).to eq("Test Page")
    end

    it "has an author attribute", pending: true

    it "has an array of blocks" do
      expect(page.blocks).to be_a(Array)
    end
  end
end
