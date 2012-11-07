class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: User::ROLES.first[0]
  end
end
