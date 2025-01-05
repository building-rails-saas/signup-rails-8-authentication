class Workspace < ApplicationRecord
  # If you want users to be able to many Workspace
  # add another join-model, eg. Member (belongs_to :user; belongs_to :workspace)
  has_many :users, dependent: :destroy

  has_many :invitations, dependent: :destroy
end
