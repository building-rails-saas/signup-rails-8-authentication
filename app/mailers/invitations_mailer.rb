class InvitationsMailer < ApplicationMailer
  def invite(invitation)
    @invitation = invitation

    mail subject: "You are invited!", to: invitation.email_address
  end
end
