class RemoveDueDateFromBills < ActiveRecord::Migration
  def change
    remove_column :bills, :due_date, :date
  end
end
