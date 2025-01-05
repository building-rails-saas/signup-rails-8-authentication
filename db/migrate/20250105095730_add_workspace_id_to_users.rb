class AddWorkspaceIdToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :workspace_id, :integer
  end
end
