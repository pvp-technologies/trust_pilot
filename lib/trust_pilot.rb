require 'singleton'
require 'active_support/all'
require 'httparty'

require_relative "trust_pilot/version"
require_relative "trust_pilot/api/token"
require_relative "trust_pilot/api/new_invitation"
require_relative "trust_pilot/api/new_product_invitation"

module TrustPilot
  class MissingDefault < StandardError; end
  mattr_accessor :username, :password, :key, :secret
end
