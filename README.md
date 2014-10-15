# Omniauth::Stagebloc

OmniAuth strategy for Stagebloc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-stagebloc'
```

And then execute:

    $ bundle

## Usage

### Devise

```ruby
config.omniauth :stagebloc, Rails.application.secrets.stageblock_client_id, Rails.application.secrets.stageblock_secret,
                :parse => :stagebloc_parser
```

### OmniAuth (Rails)

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stagebloc, ENV['STAGEBLOC_CLIENT_ID'], ENV['STAGEBLOC_SECRET'],
           :parse => :stagebloc_parser
end
```

### OmniAuth (Rack)

```ruby
use OmniAuth::Builder do
  provider :stagebloc, ENV['STAGEBLOC_CLIENT_ID'], ENV['STAGEBLOC_SECRET'],
           :parse => :stagebloc_parser
end
```

## Contributing

1. Fork it ( https://github.com/TheCodeDeli/omniauth-stagebloc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
