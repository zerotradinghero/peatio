class AddMemberIdToAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :member_id, :integer
  end
end
