# omniauth-medium
[![Gem Version](https://badge.fury.io/rb/omniauth-medium.svg)](https://badge.fury.io/rb/omniauth-medium) [![Build Status](https://travis-ci.org/adamkirkwood/omniauth-medium.svg)](https://travis-ci.org/adamkirkwood/omniauth-medium) [![Dependency Status](https://gemnasium.com/adamkirkwood/omniauth-medium.svg)](https://gemnasium.com/adamkirkwood/omniauth-medium)

This is an unofficial OmniAuth strategy for authenticating through Medium.

To use it, you'll need to [register a new OAuth application](https://medium.com/me/applications/new) with Medium.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-medium'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-medium

## Basic Usage

For Rack-based applications
```ruby
use OmniAuth::Builder do
  provider :medium, ENV['MEDIUM_CLIENT_ID'], ENV['MEDIUM_CLIENT_SECRET'], scope: 'basicProfile,listPublications'
end
```

In Rails, you'll want to add to the middleware stack:
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider : medium, ENV['MEDIUM_CLIENT_ID'], ENV['MEDIUM_CLIENT_SECRET'], scope: 'basicProfile,listPublications'
end
```

Or with Devise to your `config/initializers/devise.rb`

```ruby
config.omniauth :medium, ENV['MEDIUM_CLIENT_ID'], ENV['MEDIUM_CLIENT_SECRET'], scope: 'basicProfile,listPublications', callback_url: 'http://example.com/users/auth/medium/callback'
```
**Starting from version 1.4 in omniauth-oauth2 you must provide same callback url you have provided on API dashboard otherwise authentication won't work.**

See the [example Sinatra app](https://github.com/adamkirkwood/omniauth-medium/tree/master/examples/sinatra) for a full example.

For more information on interfacing with Medium's API, head over to their [documentation](https://github.com/Medium/medium-api-docs).


## Auth Hash Schema
OmniAuth will return an authentication hash similar to the example below. Learn more about the [Auth Hash Schema](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema).

```
{
  "provider"=>"medium",
  "uid"=>"1ec92d6f7dc96f3c95dfa0100d0bf03f36d2fe6b27a15b5c3061609866650d484",
  "info"=>{
    "id"=>"1ec92d6f7dc96f3c95dfa0100d0bf03f36d2fe6b27a15b5c3061609866650d484",
    "username"=>"adamkirkwood",
    "name"=>"Adam Kirkwood",
    "url"=>"https://medium.com/@adamkirkwood",
    "imageUrl"=>"https://cdn-images-1.medium.com/fit/c/200/200/0*lBXH3ieYv40OwIlo.jpeg"
  },
  "credentials"=>{
    "token"=>"...",
    "refresh_token"=>"...",
    "expires_at"=>...,
    "expires"=>true
  },
  "extra"=>{

  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/adamkirkwood/omniauth-medium/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
