class Bill < ActiveRecord::Base

  belongs_to :user
  has_many :copayers

  validates :title, presence: true
  validates :total_amount, presence: true, numericality: true
  validates :day_of_month, presence: true

  validate :day_of_month_must_be_valid

  def day_of_month_must_be_valid
    if day_of_month.present?
      unless day_of_month >= 1 && day_of_month <= 28
        errors.add(:day_of_month_must_be_valid, "day of month must fall between 1 and 28")
      end
    end
  end

end
