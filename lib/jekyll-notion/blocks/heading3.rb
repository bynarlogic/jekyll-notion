# frozen_string_literal: true

# Namespace for Block
module Jekyll
  module Notion
    module Blocks
      # Block primary class
      class Heading3 < Block
        def render
          "### #{data["heading_3"]["text"][0]["plain_text"]}"
        end
      end
    end
  end
end
