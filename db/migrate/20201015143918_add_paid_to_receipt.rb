class AddPaidToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :paid, :boolean
  end
end
