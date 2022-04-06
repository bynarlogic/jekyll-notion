# frozen_string_literal: true

# Namespace for Block
module Jekyll
  module Notion
    module Blocks
      # Block primary class
      class Image < Block
        require "open-uri"

        def initialize(data)
          super(data)

          write_file!
        end

        def render
          "![#{caption}](#{file_path}/#{file_name})"
        end

        private

        def write_file!
          uri = URI.parse(file_url)
          image_contents = uri.open.read

          File.open("#{file_path}/#{file_name}", "w") do |f|
            f.write image_contents
          end
        end

        def caption
          data["image"]["caption"][0]["text"]["content"]
        end

        def file_path
          "assets/images"
        end

        def file_name
          "#{caption.split(" ").join("_")}.png".downcase
        end

        def file_url
          data["image"]["file"]["url"]
        end
      end
    end
  end
end
