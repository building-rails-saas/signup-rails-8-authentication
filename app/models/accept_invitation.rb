class AcceptInvitation
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email_address, :string
  attribute :password, :string
  attribute :token, :string

  validates :email_address, presence: true
  validates :password, length: 8..128

  def save
    if valid?
      User.create!(email_address: email_address, password: password).tap do |user|
        update_invitation
        add_new user, to: invitation.workspace

        # add other actions, eg
        # - welcome email
        # - workspace event (new_user)
        # - etc.
      end
    end
  end

  def model_name
    ActiveModel::Name.new(self, nil, self.class.name)
  end

  private

  def update_invitation
    invitation.update(accepted_at: Time.current)
  end

  def add_new(user, to:)
    to.users << user
  end

  def invitation = Invitation.find_by_token_for(:invitation, token)
end
