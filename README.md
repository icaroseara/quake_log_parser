# QuakeLogParser

A quake log parser.

[![Build Status](https://travis-ci.org/icaroseara/quake_log_parser.svg)](https://travis-ci.org/icaroseara/quake_log_parser) [![Code Climate](https://codeclimate.com/github/icaroseara/quake_log_parser/badges/gpa.svg)](https://codeclimate.com/github/icaroseara/quake_log_parser) [![Test Coverage](https://codeclimate.com/github/icaroseara/quake_log_parser/badges/coverage.svg)](https://codeclimate.com/github/icaroseara/quake_log_parser)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quake_log_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quake_log_parser

## Usage

Load the log file:
```ruby
quake_log_parser = QuakeLogParser::Parser.new(FILE_PATH)
```

Parse a quake log, execute:
```ruby
quake_log_parser.parse
```

Displays information of all games:
```ruby
quake_log_parser.scoreboard
```

### Example
```ruby
quake_log_parser = QuakeLogParser::Parser.new("lib/quake_log_parser/support/games.log")

quake_log_parser.parse

quake_log_parser.scoreboard
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/quake_log_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
