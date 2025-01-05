class Invitation < ApplicationRecord
  belongs_to :workspace
  belongs_to :inviter, class_name: "User"

  generates_token_for :invitation, expires_in: 7.days do
    accepted_at
  end
end
