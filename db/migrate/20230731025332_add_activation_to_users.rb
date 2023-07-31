class AddActivationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :string, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :string
    add_column :users, :datetime, :string
  end
end
