class AddPhoneEmailToPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_methods, :email, :string
    add_column :payment_methods, :phone, :string
  end
end
