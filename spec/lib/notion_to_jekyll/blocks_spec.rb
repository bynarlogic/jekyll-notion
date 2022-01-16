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
    describe "render" do
      it "returns image link in md format"
    end
  end

  describe Blocks::Code do
    describe "render" do
      it "returns code snippet in md format"
    end
  end

  describe Blocks::BulletedListItem do
    describe "render" do
      it "returns bulleted list in md format"
    end
  end
end
