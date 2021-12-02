class AddColumsToAdvertisements < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :currency_payment_id, :string
    add_column :advertisements, :price_type, :integer
    add_column :advertisements, :total_amount, :decimal
  end
end
