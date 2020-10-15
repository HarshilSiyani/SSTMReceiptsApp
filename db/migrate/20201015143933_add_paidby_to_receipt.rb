class AddPaidbyToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :paidby, :string
  end
end
