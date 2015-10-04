class AddDayofMonthToBills < ActiveRecord::Migration
  def change
    add_column :bills, :day_of_month, :integer
  end
end
