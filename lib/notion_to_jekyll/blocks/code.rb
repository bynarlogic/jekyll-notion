# frozen_string_literal: true

# Namespace for Block
module NotionToJekyll
  module Blocks
    # Block primary class
    class Code < Block
      def render
        "#{start_highlight}\n#{text}\n#{end_highlight}"
      end

      private

      def start_highlight
        "{% highlight #{language} %}"
      end

      def end_highlight
        "{% endhighlight %}"
      end

      def language
        data["code"]["language"]
      end

      def text
        data["code"]["text"][0]["plain_text"]
      end
    end
  end
end
