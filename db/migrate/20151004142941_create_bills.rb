class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :user_id
      t.float :total_amount

      t.timestamps null: false
    end
    add_index :bills, :user_id
  end
end
