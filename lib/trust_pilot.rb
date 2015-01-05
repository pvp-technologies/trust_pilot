require 'singleton'
require 'httparty'

require_relative "trust_pilot/version"
require_relative "trust_pilot/setter_helper"
require_relative "trust_pilot/api/token"
require_relative "trust_pilot/api/new_invitation"


module TrustPilot
  extend SetterHelper
  class Credentials; end

  default_methods [:username, :password, :key, :secret], Credentials
end
