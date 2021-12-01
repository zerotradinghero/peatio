class AddNumberOfCoinToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :p2p_orders, :number_of_coin, :decimal
  end
end
