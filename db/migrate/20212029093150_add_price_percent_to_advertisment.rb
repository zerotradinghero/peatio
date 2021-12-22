class AddPricePercentToAdvertisment < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :price_percent, :integer
  end
end
