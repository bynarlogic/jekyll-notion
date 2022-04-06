# frozen_string_literal: true

# Namespace for Block
module Jekyll
  module Notion
    module Blocks
      # Block primary class
      class BulletedListItem < Block
        def render
          "- #{text}"
        end

        private

        def text
          data["bulleted_list_item"]["text"][0]["plain_text"]
        end
      end
    end
  end
end
