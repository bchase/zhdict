# Zhdict

A gem for persisting and querying Chinese-English dictionary entries (CC-CEDict) via ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'zhdict'

And then execute:

    $ bundle

## Usage

```bash
$ rails generate zhdict Word
$ rake db:migrate
$ thor zhdict:seed Word # NOTE: will take a while
```

```ruby
words = Word.search_by_hanzi '好棒'
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/zhdict/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
