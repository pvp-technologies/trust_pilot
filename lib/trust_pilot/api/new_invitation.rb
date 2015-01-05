require 'singleton'
module TrustPilot
  class NewInvitation

    extend SetterHelper
    include HTTParty

    class Default; end

    default_methods [:businessUserId, 
                     :templateId,
                     :locale,
                     :senderEmail,
                     :senderName,
                     :replyTo,
                     :redirectUri], Default

    base_uri "https://api.trustpilot.com/v1/private/business-units/"

    def self.call(recipient_email: recipient_email, recipient_name: recipient_name, tags: tags, reference_id: reference_id, preferred_send_time: preferred_send_time)
      p endpoint = "#{businessUserId}/invitations"
      p query = {token: Token.get}
      p body = {
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
