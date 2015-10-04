class Copayer < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :amount, presence: true, numericality: true

end
