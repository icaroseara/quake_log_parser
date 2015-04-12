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
puts quake_log_parser.scoreboard
```

### Example
```ruby
quake_log_parser = QuakeLogParser::Parser.new("lib/quake_log_parser/support/games.log")
=> #<QuakeLogParser::Parser:0x007fe7ea81ef50 @file_path="lib/quake_log_parser/support/games.log", @games=[]>

quake_log_parser.parse
=> #<File:lib/quake_log_parser/support/games.log>

puts quake_log_parser.scoreboard
=> {
    "game_0": {
        "total_kills": 0,
        "players": [
            "Isgalamido"
        ],
        "kills": {
            "Isgalamido": {
                "kills": 0,
                "deaths": 0
            }
        },
        "kills_by_means": {}
    },
    "game_1": {
        "total_kills": 11,
        "players": [
            "Isgalamido",
            "Dono da Bola",
            "Mocinha"
        ],
        "kills": {
            "Isgalamido": {
                "kills": -5,
                "deaths": 2
            },
            "Dono da Bola": {
                "kills": 0,
                "deaths": 1
            },
            "Mocinha": {
                "kills": 0,
                "deaths": 0
            }
        },
        "kills_by_means": {
            "MOD_TRIGGER_HURT": 7,
            "MOD_ROCKET_SPLASH": 3,
            "MOD_FALLING": 1
        }
    }
}
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/quake_log_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
