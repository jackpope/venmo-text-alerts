class Copayer < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :amount, presence: true, numericality: true
  
  validates :phone_number, presence: true
  validate :phone_number_must_be_valid

  def phone_number_must_be_valid
    if phone_number.present?
      phone_number.gsub!(/[^\(\)\d\+]/, '') # remove strange characters
      errors.add(:phone_number_must_be_valid, "phone number must be 10 characters") unless phone_number.length == 10
    end
  end

end
