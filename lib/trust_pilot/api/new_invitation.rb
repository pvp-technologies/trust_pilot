require 'singleton'
require 'recursive-open-struct'

module TrustPilot
  class NewInvitation

    include HTTParty

    mattr_accessor :business_user_id, 
      :template_id,
      :locale,
      :sender_email,
      :sender_name,
      :reply_to,
      :redirect_uri

    base_uri "https://invitations-api.trustpilot.com/v1/private/business-units/"

    def self.call(recipient_email: "", recipient_name: "", tags: [], reference_id: "", preferred_send_time: "")
      check_default
      parse_response do_call(recipient_email, recipient_name, tags, reference_id, preferred_send_time)
    end

    private

    def self.parse_response(response)
      RecursiveOpenStruct.new(response)
    end

    def self.do_call(recipient_email, recipient_name, tags, reference_id, preferred_send_time)
      endpoint = "/#{business_user_id}/invitations"
      query = {token: Token.get}
      body = {
        "businessUserId" => business_user_id,
        "recipientEmail" => recipient_email,
        "recipientName" => recipient_name,
        "referenceId" => reference_id,
        "templateId" => template_id,
        "locale" => locale,
        "senderEmail" => sender_email,
        "senderName" => sender_name,
        "replyTo" => reply_to,
        "preferredSendTime" => preferred_send_time,
        "tags" => tags,
        "redirectUri" => redirect_uri
      }
      post endpoint, body: body, query: query
    end

    def self.check_default
      unless business_user_id && template_id && locale && sender_name && sender_email && reply_to && redirect_uri
        raise MissingDefault
      end
    end
  end
end
