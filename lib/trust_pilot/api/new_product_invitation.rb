require 'singleton'
require 'recursive-open-struct'

module TrustPilot
  class NewProductInvitation

    include HTTParty

    mattr_accessor :business_user_id, 
      :locale,
      :redirect_uri,
      :consumer,
      :products

    base_uri "https://api.trustpilot.com/v1/private/product-reviews/business-units/"

    def self.call(consumer: {}, products: "", reference_id: "")
      check_default
      parse_response do_call(consumer, reference_id, business_user_id,  locale, redirect_uri, products)
    end

    private

    def self.parse_response(response)
      RecursiveOpenStruct.new(response)
    end

    def self.do_call(consumer, reference_id, business_user_id, locale, redirect_uri, products)
      endpoint = "/#{business_user_id}/invitation-links"
      query = {token: Token.get}
      body = {
       "consumer" => consumer,
       "referenceId" => reference_id,
       "locale" => locale,
       "redirectUri" => redirect_uri,
       "products" => products
      }.to_json
      post endpoint, body: body, query: query, :headers => { 'Content-Type' => 'application/json' } 
    end

    def self.check_default
      unless business_user_id && locale && redirect_uri
        raise MissingDefault
      end
    end
  end
end

