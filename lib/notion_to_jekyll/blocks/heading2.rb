# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Heading2 < Block
      def render
        "## #{data["heading_2"]["text"][0]["plain_text"]}"
      end
    end
  end
end
