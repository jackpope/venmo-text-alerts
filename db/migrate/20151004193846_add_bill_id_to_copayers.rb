class AddBillIdToCopayers < ActiveRecord::Migration
  def change
    add_column :copayers, :bill_id, :integer
    add_index :copayers, :bill_id
  end
end
