class RemoveAvaiableCoin < ActiveRecord::Migration[5.2]
  def change
    remove_column :advertisements, :avaiable_coin
  end
end
