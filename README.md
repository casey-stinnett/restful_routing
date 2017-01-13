# RestfulRouting

While developing Rails apps, it is often difficult to remember which prefixes route to which controller#action. That is why it is useful to run `rails routes` and put that output in a file for later reference. This gem does that for you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'restful_routing', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install restful_routing
Then start your engines!

    $ rails s

## Usage

While developing Rails apps, it is often difficult to remember which prefixes route to which controller#action. That is why it is useful to run `rails routes` and put that output in a file for later reference. This gem does that for you.

After installing the gem in your Rails project and starting your server (`rails s`), it is listening for saved changes in your `config/routes.rb`. Every time you make a change to routes.rb and you save it, restful_routing will look for `restful_routing.rb` in your root directory. It will update it if there or make it if not.

`restful_routing.rb` will contain the output of `rails routes`.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/casey-stinnett/restful_routing.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

