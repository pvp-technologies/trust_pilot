require 'singleton'
require 'base64'


module TrustPilot
  class Token
    include Singleton
    include HTTParty

    class NoTokenException < StandardError; end

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
      @token || raise(NoTokenException)
    end

    private

    def check_default
      unless TrustPilot.username && TrustPilot.password && TrustPilot.key && TrustPilot.secret
        raise MissingDefault
      end
    end

    def new_token
      check_default
      response = do_call
      @token = response.parsed_response["access_token"]
      @validity = 5.minutes.from_now
    end

    def do_call
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
      self.class.post(endpoint, {headers: headers, body: params})
    end

    def encoded_key
      Base64.urlsafe_encode64("#{TrustPilot.key}:#{TrustPilot.secret}")
    end
  end
end
