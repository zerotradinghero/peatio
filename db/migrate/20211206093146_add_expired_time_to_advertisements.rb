class AddExpiredTimeToAdvertisements < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :expired_time, :integer
  end
end
