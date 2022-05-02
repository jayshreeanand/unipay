class AddXrpAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :xrp_address, :string
    add_column :users, :xrp_balance, :string
    add_column :users, :xrp_secret, :string
  end
end
