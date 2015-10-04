class CreateCopayers < ActiveRecord::Migration
  def change
    create_table :copayers do |t|
      t.string :first_name
      t.string :last_name
      t.text :phone_number
      t.float :amount

      t.timestamps null: false
    end
  end
end
