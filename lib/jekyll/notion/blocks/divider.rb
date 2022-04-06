# frozen_string_literal: true

# Namespace for Block
module Jekyll
  module Notion
    module Blocks
      # Block primary class
      class Divider < Block
        def render
          "---"
        end
      end
    end
  end
end
