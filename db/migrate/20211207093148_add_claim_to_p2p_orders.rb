class AddClaimToP2pOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :p2p_orders, :claim_title, :string
    add_column :p2p_orders, :claim_status, :integer
    add_column :p2p_orders, :claim_description, :string
  end
end
