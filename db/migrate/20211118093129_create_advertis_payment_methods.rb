class CreateAdvertisPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :advertis_payment_methods do |t|
      t.bigint :advertis_id
      t.bigint :payment_method_id
    end
  end
end
