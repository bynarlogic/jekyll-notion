# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Block
      attr_accessor :data

      def initialize(data)
        @data = data
      end

      def id
        data["id"]
      end

      def type
        data["type"]
      end
    end
  end
end
