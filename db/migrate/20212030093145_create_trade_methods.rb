class CreateTradeMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_methods do |t|
      t.string :identifier
      t.string :name
      t.string :icon
      t.string :type_code

      t.timestamps
    end
  end
end
