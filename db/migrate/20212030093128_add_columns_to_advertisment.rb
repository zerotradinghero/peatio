class AddColumnsToAdvertisment < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :member_registration_day, :string
    add_column :advertisements, :member_coin_number, :decimal
  end
end
