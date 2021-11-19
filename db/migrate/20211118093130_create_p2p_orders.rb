class CreateP2pOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :p2p_orders do |t|
      t.bigint :member_id
      t.integer :status, default: 0
      t.integer :p2p_orders_type
      t.decimal :price
      t.decimal :ammount
      t.bigint :advertis_payment_method_id
    end
  end
end
