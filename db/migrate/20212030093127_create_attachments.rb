class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :image
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
