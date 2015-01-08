# TrustPilot

A gem to access Trust Pilot API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trust_pilot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trust_pilot

## Usage

You must set the credentials once:
```ruby
TrustPilot.username = 'test@email.com'
TrustPilot.password = 'qwerty'
TrustPilot.key = 'ghfastnsdhvtyew'
TrustPilot.secret = 'qwertyui'
```

### New invitation

You must set default options once:
```ruby
TrustPilot::NewInvitation.business_user_id = 'sdjkjkdfhguygasdy'
TrustPilot::NewInvitation.template_id = 'sddsnfsdoub'
TrustPilot::NewInvitation.locale = 'en-US'
TrustPilot::NewInvitation.sender_email = 'blu@yopmail.com'
TrustPilot::NewInvitation.sender_name = 'blu@yopmail.com'
TrustPilot::NewInvitation.redirect_uri = 'http://trustpilot.com'
TrustPilot::NewInvitation.reply_to = 'blu@yopmail.com'
```

Then call TrustPilot this way:
```ruby
TrustPilot::NewInvitation.call(
  recipient_email: 'blu2@yopmail.com', 
  recipient_name: 'charles', 
  tags: ['owner'], 
  reference_id: 'dfhsgefhjgfeykefwgs', 
  preferred_send_time: '2015-01-07T11:00:00'
)
```

## Contributing

1. Fork it ( https://github.com/Skizzk/trust_pilot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
