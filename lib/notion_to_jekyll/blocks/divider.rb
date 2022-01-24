# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Divider < Block
      def render
        "---"
      end
    end
  end
end
