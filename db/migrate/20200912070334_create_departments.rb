class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :head, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
