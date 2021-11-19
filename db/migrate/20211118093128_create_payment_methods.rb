class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :account_number
      t.string :bank_name
      t.integer :payment_type, default: 0
      t.string :account_name
      t.bigint :member_id
    end
  end
end
