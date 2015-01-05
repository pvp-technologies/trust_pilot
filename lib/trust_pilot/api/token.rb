require 'singleton'
require 'base64'


module TrustPilot
  class Token
    include Singleton
    include HTTParty

    base_uri "https://api.trustpilot.com/v1/oauth/oauth-business-users-for-applications"
    attr_reader :validity

    def initialize
      @validity = 1.second.ago
    end

    def self.get
      Token.instance.get
    end

    def get
      new_token unless validity >= Time.now
      @token 
    end

    private

    def new_token
      endpoint = '/accesstoken'
      params = {
        grant_type: 'password',
        username: TrustPilot.username,
        password: TrustPilot.password
      }
      headers = {
        'Authorization' => "Basic #{encoded_key}",
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
      response = self.class.post(endpoint, {headers: headers, body: params})
      @token = response.parsed_response["access_token"]
      @validity = 5.minutes.from_now
    end

    def encoded_key
      Base64.urlsafe_encode64("#{TrustPilot.key}:#{TrustPilot.secret}")
    end
  end
end
