# frozen_string_literal: true

require "spec_helper"

RSpec.describe Blocks do
  describe Blocks::Heading1 do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/heading_1.yml"))
      Blocks::Heading1.new data
    end

    describe "render" do
      it "returns a text in header1 md format" do
        expect(block.render).to eq("# I’m a Heading")
      end
    end
  end

  describe Blocks::Heading2 do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/heading_2.yml"))
      Blocks::Heading2.new data
    end

    describe "render" do
      it "returns a text in header2 md format" do
        expect(block.render).to eq("## I’m a Heading")
      end
    end
  end

  describe Blocks::Heading3 do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/heading_3.yml"))
      Blocks::Heading3.new data
    end

    describe "render" do
      it "returns a text in header3 md format" do
        expect(block.render).to eq("### I’m a Heading")
      end
    end
  end

  describe Blocks::Paragraph do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/paragraph.yml"))
      Blocks::Paragraph.new data
    end

    describe "render" do
      it "returns a text in paragraph md format" do
        expect(block.render).to eq("I can’t think of anything else to say")
      end
    end
  end

  describe Blocks::Image do
    let(:api) { API.new(ENV["NOTION_SECRET"]) }
    let(:data) { YAML.safe_load(File.read("spec/fixtures/blocks/image.yml")) }
    let(:image_file) { File.open("spec/fixtures/images/a_red_ruby.png", "r") }
    let(:file_path) { "assets/images/a_red_ruby.png" }

    before(:each) do
      allow_any_instance_of(URI::HTTPS).to receive(:open) { image_file }
      File.delete(file_path) if File.exist?(file_path)
    end

    describe "initalize" do
      it "saves the file to the local assets/images dir" do
        expect(File.exist?(file_path)).to be_falsey

        VCR.use_cassette("image_block") do
          response = api.get_block data["id"]
          Blocks::Image.new response
        end

        expect(File.exist?(file_path)).to be_truthy
      end
    end

    describe "render" do
      let(:block) do
        VCR.use_cassette("image_block") do
          response = api.get_block data["id"]
          Blocks::Image.new response
        end
      end

      it "returns image link in md format" do
        expected_image_tag = "![a red ruby](assets/images/a_red_ruby.png)"

        expect(block.render).to eq(expected_image_tag)
      end

      context "caption has capital letters" do
        let(:block) do
          VCR.use_cassette("image_block") do
            response = api.get_block data["id"]
            Blocks::Image.new response
          end
        end

        it "downcases file name" do
          allow(block).to receive(:caption) { "A Large Red Ruby" }

          expected_image_tag = "![A Large Red Ruby](assets/images/a_large_red_ruby.png)"
          expect(block.render).to eq(expected_image_tag)
        end
      end
    end
  end

  describe Blocks::Code do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/code.yml"))
      Blocks::Code.new data
    end

    describe "render" do
      it "returns code snippet in md format" do
        expected_code = <<~MD
          {% highlight ruby %}
          beans.each do |bean|
          \tbean.compute! if bean.computable?
          end
          {% endhighlight %}
        MD

        expect(block.render).to eq(expected_code)
      end
    end
  end

  describe Blocks::BulletedListItem do
    let(:block) do
      data = YAML.safe_load(File.read("spec/fixtures/blocks/bullet_list.yml"))
      Blocks::BulletedListItem.new data
    end

    describe "render" do
      it "returns bulleted list in md format" do
        expected_list = <<~MD
          - Baz
        MD

        expect(block.render).to eq(expected_list)
      end
    end
  end
end
