# frozen_string_literal: true

# namespace for Jekyll
module Jekyll
  # namespace for commands
  module Commands
    # NotionPost class for converting notion posts to Jekyll Files
    class NotionPost < Command
      def self.init_with_program(prog)
        prog.command(:notion_to_jekyll) do |c|
          c.syntax "notion_post URL"
          c.description "Creates a post for the given Notion URL"

          options.each { |opt| c.option(*opt) }

          c.action { |args, _options| NotionToJekyll.convert_url_to_post(args[0]) }
        end
      end
    end
  end
end
