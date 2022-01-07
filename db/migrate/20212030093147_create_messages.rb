class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :member_id
      t.text :content
      t.integer :p2p_order_id

      t.timestamps
    end
  end
end
