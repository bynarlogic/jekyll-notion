# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Paragraph < Block
      def render
        (data["paragraph"]["text"][0]["plain_text"]).to_s
      end
    end
  end
end
