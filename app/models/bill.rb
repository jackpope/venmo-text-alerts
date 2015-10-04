class Bill < ActiveRecord::Base

  validates :title, presence: true
  validates :total_amount, presence: true, numericality: true
  validates :due_date, presence: true

end
