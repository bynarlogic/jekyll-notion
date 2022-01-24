# frozen_string_literal: true

require "spec_helper"

RSpec.describe NotionToJekyll do
  it "has a version number" do
    expect(NotionToJekyll::VERSION).not_to be nil
  end

  describe "render_page" do
    let(:url) { "https://www.notion.so/refactored-noise/Test-Page-77e5079b072246bba87b80ed15fcb7be" }

    before :each do
      image_file = File.open("spec/fixtures/images/a_red_ruby.png", "r")
      allow_any_instance_of(URI::HTTPS).to receive(:open) { image_file }
    end

    it "returns a MD string of all blocks on the page" do
      VCR.use_cassette("render_page") do
        article = <<~MD
          ## I’m a Heading
          Here’s a list of things I like to do:
          - Foo
          - Bar
          - Baz

          Some Code:
          {% highlight ruby %}
          beans.each do |bean|
          \tbean.compute! if bean.computable?
          end
          {% endhighlight %}

          Here’s a screen shot:
          ![a red ruby](assets/images/a_red_ruby.png)
          ### In Conclusion
          I can’t think of anything else to say\n
        MD
        expect(render_page(url)).to eq(article)
      end
    end
  end
end
