class CreateAdvertisementPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisement_payment_methods do |t|
      t.bigint :advertisement_id
      t.bigint :payment_method_id

      t.timestamps
    end
  end
end
