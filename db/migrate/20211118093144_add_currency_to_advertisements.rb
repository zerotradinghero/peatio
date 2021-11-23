class AddCurrencyToAdvertisements < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :currency_id, :string
  end
end
