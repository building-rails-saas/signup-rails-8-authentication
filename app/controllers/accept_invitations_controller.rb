class AcceptInvitationsController < ApplicationController
  def new
    @invitation = Invitation.find_by_token_for(:invitation, params[:token])
  end

  def create
    AcceptInvitation.create(invitations_params)

     redirect_to root_path
  end

  private

  def invitation_params
    params.expect(accept_invitation: [ :email_address, :password, :token ])
  end
end
