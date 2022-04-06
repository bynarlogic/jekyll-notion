# Jekyll-Notion

[![Ruby](https://github.com/bynarlogic/notion_to_jekyll/actions/workflows/main.yml/badge.svg)](https://github.com/bynarlogic/notion_to_jekyll/actions/workflows/main.yml)

This is a WIP Plugin for Jekyll which can be used to convert notion pages into Jekyll Articles. I love using Notion and I wanted an easy and low friction way to convert my notion pages into articles for my blog.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-notion'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll-notion

## Usage

Running this command copies your notion page to the `_posts` directory of your project. Be sure to enable sharing for your Notion page before running the command. 

```
jekyll create_post_from_notion <url>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/notion_to_jekyll.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
