class InvitationsController < ApplicationController
  def index
    @invitations = Current.workspace.invitations
  end

  def new
    @invitation = Invitation.new
  end

  def create
    if invitation = Invitation.create(invitation_params)
      InvitationsMailer.invite(invitation).deliver_later
    end

    redirect_to invitations_path
  end

  private

  def invitation_params
    params
      .expect(invitation: [ :email_address ])
      .with_defaults(
        inviter_id: Current.user.id, workspace_id: Current.user.workspace_id
      )
  end
end
