require 'singleton'
module TrustPilot
  class NewInvitation

    include HTTParty

    mattr_accessor :businessUserId, 
      :templateId,
      :locale,
      :senderEmail,
      :senderName,
      :replyTo,
      :redirectUri

    base_uri "https://api.trustpilot.com/v1/private/business-units/"

    def self.call(recipient_email: "", recipient_name: "", tags: [], reference_id: "", preferred_send_time: "")
      endpoint = "#{businessUserId}/invitations"
      query = {token: Token.get}
      body = {
        "businessUserId" => businessUserId,
        "recipientEmail" => recipient_email,
        "recipientName" => recipient_name,
        "referenceId" => reference_id,
        "templateId" => templateId,
        "locale" => locale,
        "senderEmail" => senderEmail,
        "senderName" => senderName,
        "replyTo" => replyTo,
        "preferredSendTime" => preferred_send_time,
        "tags" => tags,
        "redirectUri" => redirectUri
      }
      post endpoint, body: body, query: query
    end
  end
end
