# frozen_string_literal: true

require "spec_helper"

RSpec.describe Page do
  describe "initialize" do
    let(:url) { "https://www.notion.so/refactored-noise/Test-Page-77e5079b072246bba87b80ed15fcb7be" }
    let(:cassettes) do
      [
        { name: "page" },
        { name: "page_meta" }
      ]
    end
    let(:page) { VCR.use_cassettes(cassettes) { Page.new(url) } }

    it "has a title attribute" do
      expect(page.title).to eq("Test Page")
    end

    it "has an author attribute", pending: true

    it "has an array of blocks" do
      image_file = File.open("spec/fixtures/images/a_red_ruby.png", "r")
      allow_any_instance_of(URI::HTTPS).to receive(:open) { image_file }

      expect(page.blocks).to be_a(Array)
      expect(page.blocks).to all(be_a(Blocks::Block))
    end
  end
end
