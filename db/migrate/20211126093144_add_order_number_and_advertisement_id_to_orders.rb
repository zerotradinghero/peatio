class AddOrderNumberAndAdvertisementIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :p2p_orders, :order_number, :string, unique: true
    add_column :p2p_orders, :updated_at, :datetime
    add_column :p2p_orders, :created_at, :datetime
    add_column :p2p_orders, :advertisement_id, :integer
  end
end
