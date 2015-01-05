require 'singleton'
require 'active_support/all'
require 'httparty'

require_relative "trust_pilot/version"
require_relative "trust_pilot/setter_helper"
require_relative "trust_pilot/api/token"
require_relative "trust_pilot/api/new_invitation"

module TrustPilot
   mattr_accessor :username, :password, :key, :secret
end
