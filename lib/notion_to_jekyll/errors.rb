# frozen_string_literal: true

module NotionToJekyll
  # Namespace for errors
  module Errors
    # Error raised when the page URL is invalid
    class InvalidURL < StandardError; end

    # Error raised when the API is not authorized to access the requested page
    class Unauthorized < StandardError; end

    # Error raised when an unknown block type is given to a page to render
    class UnknownBlockType < StandardError; end
  end
end
