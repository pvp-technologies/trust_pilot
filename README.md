# TrustPilot

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Skizzk/trust_pilot?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

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

### Set Invite Credentials

You must set default options once:
```ruby
TrustPilot::NewInvitation.business_user_id = 'sdjkjkdfhguygasdy'
TrustPilot::NewInvitation.locale = 'en-US'
TrustPilot::NewInvitation.redirect_uri = 'http://trustpilot.com'
TrustPilot::NewInvitation.template_id = 'sddsnfsdoub'
TrustPilot::NewInvitation.sender_email = 'blu@yopmail.com'
TrustPilot::NewInvitation.sender_name = 'blu@yopmail.com'
TrustPilot::NewInvitation.reply_to = 'blu@yopmail.com'
```

### Send Invitation

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
### Set Product Review Invitation Credentials

You must set default options once:
```ruby
TrustPilot::NewProductInvitation.business_user_id = 'sdjkjkdfhguygasdy'
TrustPilot::NewProductInvitation.locale = 'en-US'
TrustPilot::NewProductInvitation.redirect_uri = 'http://trustpilot.com'
```

### Get Product Review Invitation Link

```ruby
TrustPilot::NewProductInvitation.call(
    consumer: { name: "Jonny Utah", email: utah@fbi.gov.us },
    reference_id: 'abc123',
    products: [
    { productUrl: 'http://www.amazon.com/Point-Break-Patrick-Swayze/dp/B00AOQ8MOQ',
        imageUrl: 'http://ecx.images-amazon.com/images/I/51geK1idtuL._SX200_QL80_.jpg'
        name: 'Point Break DVD',
        sku: 'SKU-123', 
        gtin: 'GTIN', ## Optional - Must be valid ( https://en.wikipedia.org/wiki/Global_Trade_Item_Number )
        mpn: 'MPN-456',
        brand: 'Some Brand Name'
      }
    ]
  )

 ## Returns a link that sets up a Product Review.
```


## Contributing

1. Fork it ( https://github.com/Skizzk/trust_pilot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
