class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer :amount
      t.date :date
      t.string :description
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
