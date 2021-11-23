class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.decimal :price, precision: 32, scale: 16
      t.bigint :creator_id, null: false
      t.integer :advertis_type
      t.decimal :avaiable_coin
      t.decimal :upper_limit
      t.decimal :lower_limit
      t.string :description
      t.integer :visible

      t.timestamps
    end
  end
end
