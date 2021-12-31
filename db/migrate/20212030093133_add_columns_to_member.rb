class AddColumnsToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :is_kyc, :boolean, default: false
  end
end
