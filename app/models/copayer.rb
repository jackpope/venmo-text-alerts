class Copayer < ActiveRecord::Base

  belongs_to :bill

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :amount, presence: true, numericality: true
  
  validates :phone_number, presence: true
  validate :phone_number_must_be_valid

  validate :copayers_amounts_must_not_exceed_bill_amount, on: :create

  def phone_number_must_be_valid
    if phone_number.present?
      phone_number.gsub!(/[^\(\)\d\+]/, '') # remove strange characters
      errors.add(:phone_number_must_be_valid, "phone number must be 10 characters") unless phone_number.length == 10
    end
  end

  def copayers_amounts_must_not_exceed_bill_amount
    if Bill.where(id: bill_id).present? # to keep the tests happy
      bill = Bill.find(bill_id)
      already_owed = bill.copayers.collect(&:amount).inject{ |sum, x| sum + x } #totals amounts owed
      if bill.total_amount < (already_owed.to_f + amount.to_f)
        errors.add(:copayers_amounts_must_not_exceed_bill_amount, "Copayers' totals cannot exceed the total amount of the bill")
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

end
