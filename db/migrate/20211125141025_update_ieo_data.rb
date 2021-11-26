class UpdateIeoData < ActiveRecord::Migration[5.2]
  def change
    remove_column :ieos, :bouns

    add_column :ieos, :data, :string, null: false, after: :end_time
  end
end
