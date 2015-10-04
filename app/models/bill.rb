class Bill < ActiveRecord::Base

  belongs_to :user
  has_many :copayers

  validates :title, presence: true
  validates :total_amount, presence: true, numericality: true
  validates :due_date, presence: true

end
