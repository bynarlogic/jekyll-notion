# frozen_string_literal: true

# Namespace for Block
module Jekyll
  module Notion
    module Blocks
      # Block primary class
      class Paragraph < Block
        def render
          return text if text?

          ""
        end

        private

        def text
          (data["paragraph"]["text"][0]["plain_text"]).to_s
        end

        def text?
          data["paragraph"]["text"].any?
        end
      end
    end
  end
end
