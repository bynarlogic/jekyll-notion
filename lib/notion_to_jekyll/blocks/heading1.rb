# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Heading1 < Block
      def render
        "# #{data["heading_1"]["text"][0]["plain_text"]}"
      end
    end
  end
end
