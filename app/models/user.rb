class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :venmo_user_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
