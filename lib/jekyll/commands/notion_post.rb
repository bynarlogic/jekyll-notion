# frozen_string_literal: true
module Jekyll
  module Commands
    class NotionPost < Command
      class << self
        def init_with_program(prog)
          prog.command(:notion_post) do |c|
            c.syntax "notion_post <URL>"
            c.description "Creates a post from the given Notion URL"

            options.each { |opt| c.option(*opt) }

            c.action { |args, _options| Jekyll::Notion.convert_url_to_post(args[0]) }
          end
        end
      end
    end
  end
end
