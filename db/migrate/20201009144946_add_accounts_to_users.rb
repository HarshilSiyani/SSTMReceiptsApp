class AddAccountsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :accounts, :boolean
  end
end
