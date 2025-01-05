class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.integer :workspace_id
      t.integer :inviter_id
      t.string :email_address
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
