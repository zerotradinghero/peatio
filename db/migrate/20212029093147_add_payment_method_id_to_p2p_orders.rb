class AddPaymentMethodIdToP2pOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :p2p_orders, :payment_method_id, :integer
    remove_column :p2p_orders, :advertisement_payment_method_id
  end
end
